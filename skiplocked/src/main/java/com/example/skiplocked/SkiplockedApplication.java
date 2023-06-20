package com.example.skiplocked;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class SkiplockedApplication {

    public static void main(String[] args) {
        SpringApplication.run(SkiplockedApplication.class, args);
    }

}
