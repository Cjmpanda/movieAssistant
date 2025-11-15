package com.example.movieassistant.service;

import com.example.movieassistant.model.UserAccount;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class UserService {
    private final Map<String, UserAccount> users = new ConcurrentHashMap<>();

    public boolean exists(String username) {
        return users.containsKey(username.toLowerCase());
    }

    public UserAccount register(String username, String rawPassword) {
        String key = username.toLowerCase();
        if (users.containsKey(key)) {
            throw new IllegalArgumentException("Username already taken");
        }
        UserAccount ua = new UserAccount(username, rawPassword);
        users.put(key, ua);
        return ua;
    }

    public UserAccount find(String username) {
        return users.get(username.toLowerCase());
    }

    public boolean verify(String username, String rawPassword) {
        UserAccount ua = find(username);
        return ua != null && ua.getPassword().equals(rawPassword);
    }
}
