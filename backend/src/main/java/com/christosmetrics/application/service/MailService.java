package com.christosmetrics.application.service;

import com.christosmetrics.domain.model.Passation;
import com.christosmetrics.domain.model.RestitutionPdf;
import com.christosmetrics.domain.model.User;
import jakarta.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

/**
 * Envoi de la restitution PDF par e-mail.
 * - Mode simulé si app.mail.actif=false (log sans envoi réel).
 * - Les e-mails des utilisateurs sont MASQUÉS dans les logs (RGPD).
 * - Le corps HTML échappe toutes les données utilisateur (anti-XSS mail).
 * - Asynchrone pour ne pas bloquer la réponse HTTP.
 */
@Service
public class MailService {

    private static final Logger log = LoggerFactory.getLogger(MailService.class);

    private final JavaMailSender mailSender;
    private final String expediteur;
    private final boolean actif;

    public MailService(JavaMailSender mailSender,
                       @Value("${app.mail.expediteur:noreply@christosmetrics.app}") String expediteur,
                       @Value("${app.mail.actif:false}") boolean actif) {
        this.mailSender = mailSender;
        this.expediteur = expediteur;
        this.actif = actif;
    }

    @Async
    public void envoyerRestitution(User user, Passation passation, RestitutionPdf pdf) {
        String emailMasque = masquerEmail(user.getEmail());
        if (!actif) {
            log.info("[MAIL SIMULÉ] -> {}, sujet=Restitution {} ({} Ko)",
                    emailMasque, passation.getReferentiel().getNom(),
                    pdf.getTailleOctets() / 1024);
            return;
        }
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper h = new MimeMessageHelper(message, true, "UTF-8");
            h.setFrom(expediteur);
            h.setTo(user.getEmail());
            h.setSubject("Votre restitution CHRISTOSMETRICS — " + passation.getReferentiel().getNom());
            h.setText(corpsHtml(user, passation), true);
            h.addAttachment(pdf.getNomFichier(),
                    new ByteArrayResource(pdf.getContenu()), "application/pdf");
            mailSender.send(message);
            log.info("Restitution envoyée à {} (passation {})", emailMasque, passation.getId());
        } catch (Exception e) {
            log.error("Envoi à {} échoué : {}", emailMasque, e.getMessage());
        }
    }

    public boolean estActif() {
        return actif;
    }

    /** Corps HTML — toutes les variables utilisateur passent par htmlEscape (anti-XSS). */
    private String corpsHtml(User u, Passation p) {
        String prenom = HtmlUtils.htmlEscape(u.getPrenom() == null ? "" : u.getPrenom());
        String fruit = HtmlUtils.htmlEscape(p.getReferentiel().getNom());
        return """
            <p>Bonjour %s,</p>
            <p>Votre restitution personnelle pour <strong>%s</strong> est disponible en pièce jointe.</p>
            <p>Bonne lecture et bon cheminement.</p>
            <p style="color:#5A6B70;font-size:12px;margin-top:24px">
              CHRISTOSMETRICS — Mesurer pour devenir Christ
            </p>
            """.formatted(prenom, fruit);
    }

    /** "momo@christosmetrics.app" → "m***@c***.app" (RGPD-friendly dans les logs). */
    static String masquerEmail(String email) {
        if (email == null || !email.contains("@")) return "***";
        String[] p = email.split("@", 2);
        String local = p[0].isEmpty() ? "*" : p[0].charAt(0) + "***";
        String dom = p[1];
        int point = dom.lastIndexOf('.');
        if (point <= 1) return local + "@***";
        return local + "@" + dom.charAt(0) + "***" + dom.substring(point);
    }
}
