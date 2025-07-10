package com.education.chat.config;

import com.education.chat.security.JwtAuthenticationEntryPoint;
import com.education.chat.security.JwtAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import jakarta.servlet.http.HttpServletRequest; // Tambahkan ini di bagian atas


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers("/", "/login", "/register", "/api/auth/**").permitAll()
                        .requestMatchers("/css/**", "/js/**", "/images/**", "/static/**").permitAll()
                        .requestMatchers("/ws/**", "/topic/**", "/app/**").permitAll()
                        .requestMatchers("/h2-console/**").permitAll()
                        .requestMatchers("/test-login", "/password-fix", "/debug-login").permitAll()
                        .requestMatchers("/api/test/**", "/api/debug/**", "/api/password-test/**").permitAll()
                        .requestMatchers("/admin", "/api/admin/**").hasRole("ADMIN")
                        .requestMatchers("/api/tutor/**").hasAnyRole("ADMIN", "TUTOR")
                        .requestMatchers("/dashboard", "/chat", "/test").authenticated()
                        .requestMatchers("/api/learning/**", "/api/test/**", "/api/chat/**").authenticated()
                        .anyRequest().authenticated()
                )
                .exceptionHandling(ex -> ex.authenticationEntryPoint(jwtAuthenticationEntryPoint))
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .headers(headers -> headers.frameOptions().disable());

        // Tambahkan filter JWT dengan pengecualian endpoint publik
        http.addFilterBefore((request, response, chain) -> {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            String path = httpRequest.getServletPath();

            if (path.equals("/login") || path.equals("/register") || path.startsWith("/api/auth")) {
                chain.doFilter(request, response); // Lewati JWT filter
            } else {
                jwtAuthenticationFilter.doFilter(request, response, chain); // Terapkan JWT filter
            }
        }, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
