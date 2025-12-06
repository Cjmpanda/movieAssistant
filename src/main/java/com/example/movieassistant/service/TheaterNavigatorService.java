package com.example.movieassistant.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TheaterNavigatorService {

    // For the class project, this can be hard‑coded sample data.
    // Later you could swap this out for a real API.
    public List<Map<String, Object>> findTheatersByZip(String zip) {

        // Example data similar to your PDF mockup. [file:19]
        return List.of(
                Map.of(
                        "name", "Theatre Name 2",
                        "distance", "0.9 miles away",
                        "movies", List.of(
                                Map.of("title", "Movie A", "times", List.of("12:00pm", "4:30pm", "6:30pm")),
                                Map.of("title", "Movie B", "times", List.of("10:00am", "1:00pm", "11:30pm"))
                        )
                ),
                Map.of(
                        "name", "Theatre Name 1",
                        "distance", "1.4 miles away",
                        "movies", List.of(
                                Map.of("title", "Movie X", "times", List.of("1:00pm", "2:30pm", "7:30pm")),
                                Map.of("title", "Movie Y", "times", List.of("4:00pm", "12:00pm", "9:30pm"))
                        )
                )
        );
    }
}
