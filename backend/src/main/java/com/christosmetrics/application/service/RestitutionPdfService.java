package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.RestitutionPdf;
import com.christosmetrics.domain.model.User;
import com.christosmetrics.domain.repository.PassationRepository;
import com.christosmetrics.domain.repository.RestitutionPdfRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.MessageDigest;
import java.util.NoSuchElementException;

/**
 * Enregistre le PDF produit par le client (rendu identique au POC) et déclenche
 * l'envoi par e-mail. Idempotent : un nouvel upload remplace l'existant.
 */
@Service
public class RestitutionPdfService {

    private final RestitutionPdfRepository pdfRepo;
    private final PassationRepository passationRepo;
    private final MailService mailService;

    public RestitutionPdfService(RestitutionPdfRepository pdfRepo,
                                 PassationRepository passationRepo,
                                 MailService mailService) {
        this.pdfRepo = pdfRepo;
        this.passationRepo = passationRepo;
        this.mailService = mailService;
    }

    @Transactional
    public RestitutionPdf enregistrerEtEnvoyer(User user, Long passationId,
                                               String nomFichier, byte[] contenu) {
        Passation p = charger(user, passationId);
        if (!p.estTerminee()) {
            throw new IllegalStateException("Passation non terminée : PDF impossible");
        }
        String hash = sha256(contenu);
        RestitutionPdf existant = pdfRepo.findByPassation(p).orElse(null);
        if (existant != null) {
            pdfRepo.delete(existant);
            pdfRepo.flush();
        }
        RestitutionPdf pdf = pdfRepo.save(new RestitutionPdf(p, nomFichier, contenu, hash));
        mailService.envoyerRestitution(user, p, pdf);
        return pdf;
    }

    public boolean envoiMailActif() {
        return mailService.estActif();
    }

    @Transactional(readOnly = true)
    public RestitutionPdf lire(User user, Long passationId) {
        Passation p = charger(user, passationId);
        return pdfRepo.findByPassation(p)
                .orElseThrow(() -> new NoSuchElementException("Aucun PDF pour cette passation"));
    }

    private Passation charger(User user, Long passationId) {
        Passation p = passationRepo.findById(passationId)
                .orElseThrow(() -> new NoSuchElementException("Passation introuvable"));
        if (!p.getUser().getId().equals(user.getId())) {
            throw new SecurityException("Passation appartenant à un autre utilisateur");
        }
        return p;
    }

    private String sha256(byte[] data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] h = md.digest(data);
            StringBuilder sb = new StringBuilder(h.length * 2);
            for (byte b : h) sb.append(String.format("%02x", b));
            return sb.toString();
        } catch (Exception e) { throw new RuntimeException("Hash SHA-256 impossible", e); }
    }
}
