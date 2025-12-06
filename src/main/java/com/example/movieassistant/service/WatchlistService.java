package com.example.movieassistant.service;

import com.example.movieassistant.model.WatchlistItem;
import com.example.movieassistant.model.MovieRecommendation;
import com.example.movieassistant.model.RecommendationResult;
import com.example.movieassistant.repo.WatchlistItemRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WatchlistService {

    private final WatchlistItemRepository repo;

    public WatchlistService(WatchlistItemRepository repo) {
        this.repo = repo;
    }

    public List<WatchlistItem> listFor(String username) {
        return repo.findByOwnerUsernameIgnoreCase(username);
    }

    @Transactional
    public WatchlistItem addFromRecommendation(String username,
                                               long assetId,
                                               int index,
                                               RecommendationResult result) {
        if (result == null || result.getRecommendations() == null) return null;

        List<MovieRecommendation> recs = result.getRecommendations();
        if (index < 0 || index >= recs.size()) return null;

        MovieRecommendation rec = recs.get(index);

        WatchlistItem item = new WatchlistItem();
        item.setOwnerUsername(username.toLowerCase());
        item.setTitle(rec.getTitle());
        item.setYear(rec.getYear());
        item.setServices(rec.getServices());
        item.setPitch(rec.getPitch());
        item.setSourceAssetId(assetId);
        item.setSourceIndex(index);

        return repo.save(item);
    }

    @Transactional
    public void remove(String username, long itemId) {
        repo.deleteByOwnerUsernameIgnoreCaseAndId(username.toLowerCase(), itemId);
    }
}