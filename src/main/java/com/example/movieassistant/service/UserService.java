package com.example.movieassistant.service;

import com.example.movieassistant.model.UserAccount;
import com.example.movieassistant.repo.UserAccountRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    private final UserAccountRepository repo;

    public UserService(UserAccountRepository repo) {
        this.repo = repo;
    }

    public boolean exists(String username) {
        return repo.existsByUsernameIgnoreCase(username);
    }

    @Transactional
    public UserAccount register(String username, String rawPassword) {
        String key = username.toLowerCase();
        if (repo.existsByUsernameIgnoreCase(key)) {
            throw new IllegalStateException("User already exists");
        }
        UserAccount ua = new UserAccount(key, rawPassword);
        return repo.save(ua);
    }

    public UserAccount find(String username) {
        return repo.findByUsernameIgnoreCase(username.toLowerCase());
    }

    public boolean verify(String username, String rawPassword) {
        UserAccount ua = find(username);
        return ua != null && ua.getPassword().equals(rawPassword);
    }
}