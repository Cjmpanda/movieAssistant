package com.example.movieassistant.model;

import java.util.List;

public class WatchlistItem {

    private long id;
    private String ownerUsername;

    private String title;
    private Integer year;
    private List<String> services;
    private String pitch;

    private Long sourceAssetId;
    private Integer sourceIndex; // which recommendation in that asset

    public WatchlistItem() {}

    public WatchlistItem(long id,
                         String ownerUsername,
                         String title,
                         Integer year,
                         List<String> services,
                         String pitch,
                         Long sourceAssetId,
                         Integer sourceIndex) {
        this.id = id;
        this.ownerUsername = ownerUsername;
        this.title = title;
        this.year = year;
        this.services = services;
        this.pitch = pitch;
        this.sourceAssetId = sourceAssetId;
        this.sourceIndex = sourceIndex;
    }

    public long getId() { return id; }
    public String getOwnerUsername() { return ownerUsername; }
    public String getTitle() { return title; }
    public Integer getYear() { return year; }
    public List<String> getServices() { return services; }
    public String getPitch() { return pitch; }
    public Long getSourceAssetId() { return sourceAssetId; }
    public Integer getSourceIndex() { return sourceIndex; }

    public void setId(long id) { this.id = id; }
    public void setOwnerUsername(String ownerUsername) { this.ownerUsername = ownerUsername; }
    public void setTitle(String title) { this.title = title; }
    public void setYear(Integer year) { this.year = year; }
    public void setServices(List<String> services) { this.services = services; }
    public void setPitch(String pitch) { this.pitch = pitch; }
    public void setSourceAssetId(Long sourceAssetId) { this.sourceAssetId = sourceAssetId; }
    public void setSourceIndex(Integer sourceIndex) { this.sourceIndex = sourceIndex; }
}