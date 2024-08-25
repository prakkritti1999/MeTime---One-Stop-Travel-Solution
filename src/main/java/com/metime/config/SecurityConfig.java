/*
 * package com.metime.config;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.security.authentication.AuthenticationProvider; import
 * org.springframework.security.authentication.dao.DaoAuthenticationProvider;
 * import org.springframework.security.config.Customizer; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.config.http.SessionCreationPolicy; import
 * org.springframework.security.core.userdetails.UserDetailsService; import
 * org.springframework.security.crypto.password.NoOpPasswordEncoder; import
 * org.springframework.security.web.SecurityFilterChain;
 * 
 * 
 * @SuppressWarnings("deprecation")
 * 
 * @Configuration
 * 
 * @EnableWebSecurity public class SecurityConfig {
 * 
 * @Autowired private UserDetailsService userDetailsService;
 * 
 * 
 * @Bean public AuthenticationProvider authProvider() {
 * DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
 * provider.setUserDetailsService(userDetailsService);
 * provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance()); return
 * provider; }
 * 
 * 
 * @Bean public SecurityFilterChain securityFilterChain(HttpSecurity http)
 * throws Exception {
 * 
 * http.csrf(customizer -> customizer.disable()) .authorizeHttpRequests(request
 * -> request.anyRequest().authenticated())
 * //.formLogin(Customizer.withDefaults()) .httpBasic(Customizer.withDefaults())
 * .sessionManagement(session ->
 * session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
 * 
 * return http.build(); }
 * 
 * 
 * 
 * 
 * 
 * 
 * @Bean public UserDetailsService userDetailsService() {
 * 
 * UserDetails user=User .withDefaultPasswordEncoder() .username("navin")
 * .password("n@123") .roles("USER") .build();
 * 
 * UserDetails admin=User .withDefaultPasswordEncoder() .username("admin")
 * .password("admin@789") .roles("ADMIN") .build();
 * 
 * return new InMemoryUserDetailsManager(user,admin); }
 * 
 * 
 * 
 * }
 * 
 */


package com.metime.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public AuthenticationProvider authProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        //provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
        provider.setPasswordEncoder(new BCryptPasswordEncoder());
        return provider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                		.requestMatchers("/MeTime/register").permitAll() // Allow access to sign-up and static resources without authentication
                        .requestMatchers("/updatetrip/**", "/deleteTrips/**", "/addtrip/**").hasRole("ADMIN") // Restrict these paths to ADMIN
                        .anyRequest().authenticated()
                )
                .formLogin(Customizer.withDefaults()) // Use this if you want to enable form-based login
                //.httpBasic(Customizer.withDefaults())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));

        return http.build();
    }
}
