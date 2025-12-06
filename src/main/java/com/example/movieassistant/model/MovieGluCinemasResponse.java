package com.example.movieassistant.model;

import java.util.List;

public class MovieGluCinemasResponse {
    public List<Cinema> cinemas;

    public static class Cinema {
        public int cinema_id;
        public String cinema_name;
        public double distance;
    }
}
