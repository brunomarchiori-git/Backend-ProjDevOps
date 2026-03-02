package ProjNEKI.BrunoMarchiori.service;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import ProjNEKI.BrunoMarchiori.entity.Administrador;

import javax.crypto.SecretKey;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;

@Service
public class TokenService {

    @Value("${api.security.token.secret}")
    private String secret;

    public String generateToken(Administrador administrador) {
        return Jwts.builder()
                .issuer("auth-api")
                .subject(administrador.getEmail())
                .expiration(Date.from(LocalDateTime.now().plusHours(2).toInstant(ZoneOffset.of("-03:00"))))
                .signWith(getKey(), Jwts.SIG.HS256)
                .compact();
    }

    public String validateToken(String token) {
        try {
            return Jwts.parser()
                    .verifyWith(getKey())
                    .build()
                    .parseSignedClaims(token)
                    .getPayload()
                    .getSubject();
        } catch (Exception e) {
            return "";
        }
    }

    private SecretKey getKey() {
        return Keys.hmacShaKeyFor(secret.getBytes());
    }
}
