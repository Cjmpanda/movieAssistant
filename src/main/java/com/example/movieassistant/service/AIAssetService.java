package com.example.movieassistant.service;

import com.example.movieassistant.model.MovieRecommendation;
import com.example.movieassistant.model.RecommendationResult;

import com.example.movieassistant.model.AIAsset;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class AIAssetService {

    private final ChatClient chatClient;
    private final Map<String, List<AIAsset>> store = new ConcurrentHashMap<>();
    //
    private final Map<Long, RecommendationResult> recommendationStore = new ConcurrentHashMap<>();
    //
    private final AtomicLong idSeq = new AtomicLong(1);

    public AIAssetService(ChatClient chatClient) {
        this.chatClient = chatClient;
    }

    public AIAsset generateTextAsset(String ownerUsername, String promptText) {
        // Use the generic ChatClient API — no OpenAI-specific class
        RecommendationResult result = chatClient
                .prompt()
                .user(promptText)
                .call()
                .entity(RecommendationResult.class);

        StringBuilder display = new StringBuilder();
        int i = 1;
        if (result.getRecommendations() != null) {
            for (MovieRecommendation rec : result.getRecommendations()) {
                display.append(i++).append(". ");

                if (rec.getTitle() != null) {
                    display.append(rec.getTitle());
                }

                if (rec.getYear() != null) {
                    display.append(" (").append(rec.getYear()).append(")");
                }

                display.append("\n");

                if (rec.getPitch() != null) {
                    display.append("   ").append(rec.getPitch()).append("\n");
                }

                if (rec.getServices() != null && !rec.getServices().isEmpty()) {
                    display.append("   Available on: ")
                            .append(String.join(", ", rec.getServices()))
                            .append("\n");
                }

                display.append("\n");
            }
        }

        long id = idSeq.getAndIncrement();
        AIAsset asset = new AIAsset(
                id,
                ownerUsername,
                "AI Movie Recommendations - " + LocalDateTime.now(),
                display.toString(),               // still text for the UI
                "movie-recommendations",
                LocalDateTime.now()
        );

        store.computeIfAbsent(ownerUsername.toLowerCase(), k -> new ArrayList<>())
                .add(asset);

        // 3. Save structured data for this asset id
        recommendationStore.put(id, result);

        return asset;
    }

    public RecommendationResult getRecommendations(long assetId) {
        return recommendationStore.get(assetId);
    }

    public List<AIAsset> listFor(String ownerUsername) {
        return store.getOrDefault(ownerUsername.toLowerCase(), List.of()).stream()
                .sorted(Comparator.comparing(AIAsset::getCreatedAt).reversed())
                .toList();
    }

    public AIAsset findOwned(String ownerUsername, long id) {
        return store.getOrDefault(ownerUsername.toLowerCase(), List.of())
                .stream().filter(a -> a.getId() == id).findFirst().orElse(null);
    }
}
