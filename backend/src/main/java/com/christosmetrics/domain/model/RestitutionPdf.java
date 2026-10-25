package com.christosmetrics.domain.model;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import java.time.Instant;

/**
 * PDF de restitution stocké côté serveur, pour re-téléchargement et envoi mail.
 * Un PDF par passation. Hash SHA-256 pour l'intégrité et l'anti-doublon.
 */
@Entity
@Table(name = "restitutions_pdf")
public class RestitutionPdf {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "passation_id", nullable = false, unique = true)
    private Passation passation;

    @Column(name = "nom_fichier", nullable = false)
    private String nomFichier;

    // byte[] est mappé en BYTEA sur PostgreSQL ; @Lob imposerait un OID.
    @Column(name = "contenu", nullable = false)
    private byte[] contenu;

    @Column(name = "taille_octets", nullable = false)
    private long tailleOctets;

    @JdbcTypeCode(SqlTypes.CHAR)
    @Column(name = "hash_sha256", nullable = false, length = 64)
    private String hashSha256;

    @Column(name = "genere_le", nullable = false)
    private Instant genereLe = Instant.now();

    @Column(name = "envoye_par_mail_le")
    private Instant envoyeParMailLe;

    protected RestitutionPdf() { }

    public RestitutionPdf(Passation passation, String nomFichier, byte[] contenu, String hashSha256) {
        this.passation = passation;
        this.nomFichier = nomFichier;
        this.contenu = contenu;
        this.tailleOctets = contenu.length;
        this.hashSha256 = hashSha256;
    }

    public Long getId() { return id; }
    public Passation getPassation() { return passation; }
    public String getNomFichier() { return nomFichier; }
    public byte[] getContenu() { return contenu; }
    public long getTailleOctets() { return tailleOctets; }
    public String getHashSha256() { return hashSha256; }
    public Instant getGenereLe() { return genereLe; }
    public Instant getEnvoyeParMailLe() { return envoyeParMailLe; }
    public void marquerEnvoye() { this.envoyeParMailLe = Instant.now(); }
}
