package com.example.movieassistant.service;

import com.example.movieassistant.model.WatchlistItem;
import com.example.movieassistant.model.MovieRecommendation;
import com.example.movieassistant.model.RecommendationResult;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class WatchlistService {

    private final Map<String, List<WatchlistItem>> store = new ConcurrentHashMap<>();
    private final AtomicLong idSeq = new AtomicLong(1);

    public List<WatchlistItem> listFor(String username) {
        return store.getOrDefault(username.toLowerCase(), List.of());
    }

    public WatchlistItem addFromRecommendation(String username,
                                               long assetId,
                                               int index,
                                               RecommendationResult result) {
        if (result == null || result.getRecommendations() == null) return null;

        List<MovieRecommendation> recs = result.getRecommendations();
        if (index < 0 || index >= recs.size()) return null;

        MovieRecommendation rec = recs.get(index);

        long id = idSeq.getAndIncrement();
        WatchlistItem item = new WatchlistItem(
                id,
                username,
                rec.getTitle(),
                rec.getYear(),
                rec.getServices(),
                rec.getPitch(),
                assetId,
                index
        );

        store.computeIfAbsent(username.toLowerCase(), k -> new ArrayList<>()).add(item);
        return item;
    }

    public void remove(String username, long itemId) {
        List<WatchlistItem> items = store.get(username.toLowerCase());
        if (items == null) return;
        items.removeIf(i -> i.getId() == itemId);
    }
}