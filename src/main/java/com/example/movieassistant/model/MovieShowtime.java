package com.example.movieassistant.model;

import java.util.List;

public class MovieShowtime {
    private String title;
    private List<String> times;

    public MovieShowtime() {
    }

    public MovieShowtime(String title, List<String> times) {
        this.title = title;
        this.times = times;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<String> getTimes() {
        return times;
    }

    public void setTimes(List<String> times) {
        this.times = times;
    }
}
