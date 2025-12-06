package com.example.movieassistant.model;

import java.util.ArrayList;
import java.util.List;

public class Theater {
    private String name;
    private String distance; 
    private List<MovieShowtime> movies = new ArrayList<>();

    public Theater() {}

    public Theater(String name, String distance, List<MovieShowtime> movies) {
        this.name = name;
        this.distance = distance;
        this.movies = movies;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDistance() { return distance; }
    public void setDistance(String distance) { this.distance = distance; }

    public List<MovieShowtime> getMovies() { return movies; }
    public void setMovies(List<MovieShowtime> movies) { this.movies = movies; }
}
