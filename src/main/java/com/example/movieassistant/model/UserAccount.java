package com.example.movieassistant.model;

public class UserAccount {
    private final String username;
    private final String password; // NOTE: plain for lab simplicity (not for prod)

    public UserAccount(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
}

