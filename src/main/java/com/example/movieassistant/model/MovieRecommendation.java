package com.example.movieassistant.model;
import java.util.List;

public class MovieRecommendation {
    private String title;
    private Integer year;
    private List<String> services;
    private String pitch;

    public MovieRecommendation() {}


    //Setters
    public void setTitle(String title) {
        this.title = title;
    }
    public void setYear(Integer year) {
        this.year = year;
    }
    public void setServices(List<String> services) {
        this.services = services;
    }
    public void setPitch(String pitch) {
        this.pitch = pitch;
    }

    //Getters
    public String getTitle() {
        return title;
    }
    public Integer getYear() {
        return year;
    }
    public List<String> getServices() {
        return services;
    }
    public String getPitch() {
        return pitch;
    }



}
