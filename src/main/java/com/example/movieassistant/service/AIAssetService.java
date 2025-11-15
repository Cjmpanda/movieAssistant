package com.example.movieassistant.service;

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
    private final AtomicLong idSeq = new AtomicLong(1);

    public AIAssetService(ChatClient chatClient) {
        this.chatClient = chatClient;
    }

    public AIAsset generateTextAsset(String ownerUsername, String promptText) {
        // Use the generic ChatClient API — no OpenAI-specific class
        String content = chatClient.prompt()
                .user("Generate a creative movie or TV related asset from this prompt:\n\n" + promptText)
                .call()
                .content();

        long id = idSeq.getAndIncrement();
        AIAsset asset = new AIAsset(
                id, ownerUsername,
                "AI Asset - " + LocalDateTime.now(),
                content,
                "text",
                LocalDateTime.now()
        );
        store.computeIfAbsent(ownerUsername.toLowerCase(), k -> new ArrayList<>()).add(asset);
        return asset;
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
