package com.example.movieassistant.service;

import com.example.movieassistant.model.MovieShowtime;
import com.example.movieassistant.model.MovieGluCinemasResponse;
import com.example.movieassistant.model.MovieGluLocationResponse;
import com.example.movieassistant.model.MovieGluShowtimesResponse;
import com.example.movieassistant.model.Theater;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class TheaterNavigatorService {

    private final RestTemplate rest = new RestTemplate();

    // --------- MODE SWITCH (mock by default) ---------
    @Value("${app.theater.mode:mock}")
    private String mode;

    // --------- MovieGlu config (only required when mode=movieglu) ---------
    @Value("${movieglu.apiUrl:}")
    private String movieGluApiUrl;

    @Value("${movieglu.client:}")
    private String movieGluClient;

    @Value("${movieglu.key:}")
    private String movieGluKey;

    @Value("${movieglu.territory:}")
    private String movieGluTerritory;

    @Value("${movieglu.authorization:}")
    private String movieGluAuthorization;

    public List<Theater> findTheatersByZip(String zip) {
        if (!"movieglu".equalsIgnoreCase(mode) || !hasMovieGluConfig()) {
            return mockTheaters();
        }

        return realTheatersFromMovieGlu(zip);
    }

    private boolean hasMovieGluConfig() {
        return notBlank(movieGluApiUrl) &&
               notBlank(movieGluClient) &&
               notBlank(movieGluKey) &&
               notBlank(movieGluTerritory) &&
               notBlank(movieGluAuthorization);
    }

    private boolean notBlank(String s) {
        return s != null && !s.trim().isEmpty();
    }

    private List<Theater> realTheatersFromMovieGlu(String zip) {
        // 1) ZIP -> lat/lon
        String locUrl = movieGluApiUrl + "/locationDetails/?postcode=" + zip;
        MovieGluLocationResponse loc = restGet(locUrl, MovieGluLocationResponse.class);
        if (loc == null) return List.of();

        // 2) nearby cinemas
        String cinemasUrl = movieGluApiUrl + "/cinemasNearby/?n=5&latitude=" + loc.lat + "&longitude=" + loc.lng;
        MovieGluCinemasResponse cinemas = restGet(cinemasUrl, MovieGluCinemasResponse.class);
        if (cinemas == null || cinemas.cinemas == null) return List.of();

        List<Theater> result = new ArrayList<>();

        // 3) for each cinema -> showtimes
        for (MovieGluCinemasResponse.Cinema c : cinemas.cinemas) {
            String showUrl = movieGluApiUrl + "/cinemaShowTimes/?cinema_id=" + c.cinema_id;
            MovieGluShowtimesResponse showtimes = restGet(showUrl, MovieGluShowtimesResponse.class);

            Theater t = new Theater();
            t.setName(c.cinema_name);
            t.setDistance(String.format("%.1f miles away", c.distance));

            List<MovieShowtime> movies = new ArrayList<>();
            if (showtimes != null && showtimes.films != null) {
                for (MovieGluShowtimesResponse.Film f : showtimes.films) {
                    MovieShowtime m = new MovieShowtime();
                    m.setTitle(f.film_name);

                    List<String> times = new ArrayList<>();
                    if (f.showings != null && f.showings.standard != null && f.showings.standard.times != null) {
                        for (MovieGluShowtimesResponse.Time tm : f.showings.standard.times) {
                            times.add(tm.start_time);
                        }
                    }
                    m.setTimes(times);
                    movies.add(m);
                }
            }

            t.setMovies(movies);
            result.add(t);
        }

        return result;
    }