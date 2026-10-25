package com.christosmetrics.web.controller;

import com.christosmetrics.application.service.RestitutionPdfService;
import com.christosmetrics.domain.model.RestitutionPdf;
import com.christosmetrics.domain.model.User;
import com.christosmetrics.infrastructure.security.RateLimiter;
import com.christosmetrics.infrastructure.security.TrafficExcessif;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * Endpoints PDF (JWT requis) + sécurisation de l'upload :
 *   - vérifie la signature "magic bytes" PDF (%PDF-),
 *   - impose un Content-Type cohérent,
 *   - borne la taille à 2 Mo (le PDF du POC fait ~30 Ko),
 *   - rate-limite les uploads par utilisateur.
 */
@RestController
@RequestMapping("/api/passations")
public class RestitutionPdfController {

    private static final byte[] PDF_MAGIC = {'%','P','D','F','-'};
    private static final long TAILLE_MAX = 2L * 1024 * 1024; // 2 Mo
    private static final long FENETRE_HEURE = 3600L;

    private final RestitutionPdfService pdfService;
    private final RateLimiter rateLimiter;

    public RestitutionPdfController(RestitutionPdfService pdfService, RateLimiter rateLimiter) {
        this.pdfService = pdfService;
        this.rateLimiter = rateLimiter;
    }

    @PostMapping(path = "/{id}/pdf", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public UploadResponse televerser(@AuthenticationPrincipal User user,
                                     @PathVariable Long id,
                                     @RequestParam("fichier") MultipartFile fichier) throws IOException {

        if (!rateLimiter.autoriser("pdf:" + user.getId(), rateLimiter.pdfMaxParHeure(), FENETRE_HEURE)) {
            throw new TrafficExcessif("Trop d'uploads PDF, veuillez patienter.");
        }
        validerPdf(fichier);

        String nom = sanitiserNomFichier(fichier.getOriginalFilename());
        RestitutionPdf pdf = pdfService.enregistrerEtEnvoyer(user, id, nom, fichier.getBytes());
        return new UploadResponse(pdf.getId(), pdf.getTailleOctets(), pdf.getHashSha256(), pdfService.envoiMailActif());
    }

    @GetMapping("/{id}/pdf")
    public ResponseEntity<byte[]> telecharger(@AuthenticationPrincipal User user,
                                              @PathVariable Long id) {
        RestitutionPdf pdf = pdfService.lire(user, id);
        String nomEncode = URLEncoder.encode(pdf.getNomFichier(), StandardCharsets.UTF_8);
        HttpHeaders h = new HttpHeaders();
        h.setContentType(MediaType.APPLICATION_PDF);
        h.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + nomEncode);
        h.setContentLength(pdf.getTailleOctets());
        return new ResponseEntity<>(pdf.getContenu(), h, 200);
    }

    /** Rejette tout fichier qui n'est pas un vrai PDF ou qui dépasse la taille. */
    private void validerPdf(MultipartFile f) throws IOException {
        if (f.isEmpty()) throw new IllegalArgumentException("Fichier vide");
        if (f.getSize() > TAILLE_MAX) throw new IllegalArgumentException("PDF trop volumineux (max 2 Mo)");
        String ct = f.getContentType();
        if (ct == null || !ct.toLowerCase().contains("pdf")) {
            throw new IllegalArgumentException("Content-Type invalide, PDF attendu");
        }
        byte[] premiers = new byte[PDF_MAGIC.length];
        try (var in = f.getInputStream()) {
            if (in.read(premiers) < PDF_MAGIC.length) {
                throw new IllegalArgumentException("Fichier illisible");
            }
        }
        for (int i = 0; i < PDF_MAGIC.length; i++) {
            if (premiers[i] != PDF_MAGIC[i]) {
                throw new IllegalArgumentException("Signature PDF invalide");
            }
        }
    }

    /** Retire les séparateurs chemin et limite la longueur pour éviter path traversal. */
    private String sanitiserNomFichier(String nom) {
        if (nom == null || nom.isBlank()) return "restitution.pdf";
        String base = nom.replaceAll("[\\\\/\\x00]", "_");
        if (base.length() > 200) base = base.substring(0, 200);
        if (!base.toLowerCase().endsWith(".pdf")) base += ".pdf";
        return base;
    }

    public record UploadResponse(Long pdfId, long tailleOctets,
                                 String hashSha256, boolean envoiMailDeclenche) { }
}
