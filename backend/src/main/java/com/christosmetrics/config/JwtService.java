package com.christosmetrics.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

/**
 * Émission + validation JWT. Le token porte :
 *   - sub = e-mail,
 *   - tv  = tokenVersion (révocation globale par incrément côté serveur),
 *   - iat/exp standards.
 * Fail-fast au démarrage si APP_JWT_SECRET fait moins de 32 octets.
 */
@Service
public class JwtService {

    private final SecretKey cle;
    private final long dureeValiditeMs;

    public JwtService(@Value("${app.jwt.secret}") String secret,
                      @Value("${app.jwt.expiration-ms:604800000}") long dureeValiditeMs) {
        byte[] octets = secret.getBytes(StandardCharsets.UTF_8);
        if (octets.length < 32) {
            throw new IllegalStateException(
                    "APP_JWT_SECRET doit faire au moins 32 octets (actuel: " + octets.length + ")");
        }
        this.cle = Keys.hmacShaKeyFor(octets);
        this.dureeValiditeMs = dureeValiditeMs;
    }

    /** Génère un token portant l'e-mail + la version actuelle du compte. */
    public String genererToken(String email, long tokenVersion) {
        Date now = new Date();
        return Jwts.builder()
                .setSubject(email)
                .claim("tv", tokenVersion)
                .setIssuedAt(now)
                .setExpiration(new Date(now.getTime() + dureeValiditeMs))
                .signWith(cle, SignatureAlgorithm.HS256)
                .compact();
    }

    public String extraireEmail(String token) {
        return parse(token).getSubject();
    }

    public long extraireTokenVersion(String token) {
        Object v = parse(token).get("tv");
        if (v instanceof Number n) return n.longValue();
        return 0L;
    }

    public boolean estValide(String token) {
        try {
            return parse(token).getExpiration().after(new Date());
        } catch (Exception e) {
            return false;
        }
    }

    private Claims parse(String token) {
        return Jwts.parserBuilder().setSigningKey(cle).build()
                .parseClaimsJws(token).getBody();
    }
}
