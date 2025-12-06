package com.example.movieassistant.model;

import java.util.List;

public class MovieGluShowtimesResponse {
    public List<Film> films;

    public static class Film {
        public String film_name;
        public Showings showings;
    }

    public static class Showings {
        public Standard standard;
    }

    public static class Standard {
        public List<Time> times;
    }

    public static class Time {
        public String start_time;
    }
}
