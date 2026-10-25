package com.christosmetrics.config;

import com.christosmetrics.domain.repository.UserRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

/**
 * À chaque requête : lit Authorization: Bearer <token>, valide le JWT,
 * vérifie que sa tokenVersion correspond à celle du compte (sinon le token
 * est révoqué, ex. après un logout global ou un changement de mot de passe),
 * puis place l'utilisateur dans le SecurityContext.
 * Laisse passer les requêtes OPTIONS (preflight CORS).
 */
@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    private final JwtService jwt;
    private final UserRepository userRepo;

    public JwtAuthFilter(JwtService jwt, UserRepository userRepo) {
        this.jwt = jwt;
        this.userRepo = userRepo;
    }

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain chain)
            throws ServletException, IOException {

        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            chain.doFilter(request, response);
            return;
        }

        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7);
            if (jwt.estValide(token)) {
                String email = jwt.extraireEmail(token);
                long tv = jwt.extraireTokenVersion(token);
                userRepo.findByEmail(email).ifPresent(user -> {
                    if (user.getTokenVersion() == tv) {
                        var auth = new UsernamePasswordAuthenticationToken(user, null, List.of());
                        auth.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                        SecurityContextHolder.getContext().setAuthentication(auth);
                    }
                    // sinon : token révoqué → auth non placée → endpoint protégé renverra 401
                });
            }
        }
        chain.doFilter(request, response);
    }
}
