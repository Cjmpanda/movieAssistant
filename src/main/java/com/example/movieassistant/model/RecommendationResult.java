package com.example.movieassistant.model;
import java.util.List;

public class RecommendationResult {
    private List<MovieRecommendation> recommendations;

    public RecommendationResult () {}
    public RecommendationResult(List<MovieRecommendation> recommendations) {
        this.recommendations = recommendations;
    }

    public List<MovieRecommendation> getRecommendations() {
        return recommendations;
    }
    public void setRecommendations(List<MovieRecommendation> recommendations) {
        this.recommendations = recommendations;
    }
}
