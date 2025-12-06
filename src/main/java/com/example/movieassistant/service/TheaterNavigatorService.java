package com.example.movieassistant.service;

import com.example.movieassistant.model.MovieShowtime;
import com.example.movieassistant.model.Theater;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class TheaterNavigatorService {

    @Value("${google.places.api.key:}")
    private String googleApiKey;

    @Value("${tmdb.api.key:}")
    private String tmdbApiKey;

    private final RestTemplate restTemplate = new RestTemplate();

    public List<Theater> findTheatersByZip(String zip) {
        if (zip == null || zip.isBlank()) {
            return List.of();
        }

        List<Theater> theaters = fetchTheatersFromGoogle(zip);
        List<MovieShowtime> movies = fetchNowPlayingFromTmdb();

        if (theaters.isEmpty() || movies.isEmpty()) {
            // if something fails (no keys / bad response), return empty list
            return List.of();
        }

        // Attach a few real movies to each theater
        List<Theater> result = new ArrayList<>();

        for (Theater t : theaters) {
            int limit = Math.min(3, movies.size());
            List<MovieShowtime> subset = new ArrayList<>(movies.subList(0, limit));
            t.setMovies(subset);
            result.add(t);
        }

        return result;
    }

    // ------------ Google Places: theaters near ZIP ------------

    private List<Theater> fetchTheatersFromGoogle(String zip) {
        if (googleApiKey == null || googleApiKey.isBlank()) {
            return Collections.emptyList();
        }

        try {
            String query = "movie+theater+near+" + zip;
            String url = "https://maps.googleapis.com/maps/api/place/textsearch/json"
                    + "?query=" + query
                    + "&key=" + googleApiKey;

            GooglePlacesResponse response =
                    restTemplate.getForObject(url, GooglePlacesResponse.class);

            if (response == null || response.results == null) {
                return Collections.emptyList();
            }

            List<Theater> theaters = new ArrayList<>();
            for (GooglePlacesResult r : response.results) {
                String name = r.name != null ? r.name : "Unknown Theater";
                String distanceLabel;

                if (r.formatted_address != null) {
                    distanceLabel = r.formatted_address;
                } else if (r.vicinity != null) {
                    distanceLabel = r.vicinity;
                } else {
                    distanceLabel = "Near " + zip;
                }

                theaters.add(new Theater(name, distanceLabel, new ArrayList<>()));
            }

            return theaters;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    // ------------ TMDB: now playing movies ------------

    private List<MovieShowtime> fetchNowPlayingFromTmdb() {
        if (tmdbApiKey == null || tmdbApiKey.isBlank()) {
            return Collections.emptyList();
        }

        try {
            String url = "https://api.themoviedb.org/3/movie/now_playing"
                    + "?api_key=" + tmdbApiKey
                    + "&region=US&page=1";

            TmdbNowPlayingResponse response =
                    restTemplate.getForObject(url, TmdbNowPlayingResponse.class);

            if (response == null || response.results == null) {
                return Collections.emptyList();
            }

            List<MovieShowtime> movies = new ArrayList<>();

            for (TmdbMovieResult r : response.results) {
                if (r.title == null) {
                    continue;
                }
                // generic times just for UI (titles are real)
                List<String> times = List.of("1:00pm", "4:00pm", "7:30pm");
                movies.add(new MovieShowtime(r.title, times));
            }

            return movies;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    // ---------- Internal DTOs for Google Places ----------

    static class GooglePlacesResponse {
        public List<GooglePlacesResult> results;
        public String status;
    }

    static class GooglePlacesResult {
        public String name;
        public String formatted_address;
        public String vicinity;
    }

    // ---------- Internal DTOs for TMDB now playing ----------

    static class TmdbNowPlayingResponse {
        public List<TmdbMovieResult> results;
        public int page;
        public int total_results;
        public int total_pages;
    }

    static class TmdbMovieResult {
        public String title;
    }
}
