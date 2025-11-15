package com.example.movieassistant.model;

import java.time.LocalDateTime;

public class AIAsset {
    private final long id;
    private final String ownerUsername;
    private final String title;
    private final String content;
    private final String type;
    private final LocalDateTime createdAt;

    public AIAsset(long id, String ownerUsername, String title, String content, String type, LocalDateTime createdAt) {
        this.id = id;
        this.ownerUsername = ownerUsername;
        this.title = title;
        this.content = content;
        this.type = type;
        this.createdAt = createdAt;
    }

    public long getId() { return id; }
    public String getOwnerUsername() { return ownerUsername; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public String getType() { return type; }
    public LocalDateTime getCreatedAt() { return createdAt; }
}
