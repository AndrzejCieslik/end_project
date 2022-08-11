package andrzej.cieslik.ac.end_project;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import andrzej.cieslik.ac.end_project.user.SpringDataUserDetailsService;

@Configuration
public class Config {
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService userDetailsService() { return new SpringDataUserDetailsService(); }
}