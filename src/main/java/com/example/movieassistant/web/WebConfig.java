package com.example.movieassistant.web;

import com.example.movieassistant.service.UserService;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final UserService users;

    public WebConfig(UserService users) {
        this.users = users;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // ✅ Uses the ctor that accepts UserService
        registry.addInterceptor(new AuthInterceptor(users));
    }
}
