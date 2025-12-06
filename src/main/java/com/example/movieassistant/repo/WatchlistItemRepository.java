package com.example.movieassistant.repo;

import com.example.movieassistant.model.WatchlistItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WatchlistItemRepository extends JpaRepository<WatchlistItem, Long> {

    List<WatchlistItem> findByOwnerUsernameIgnoreCase(String ownerUsername);

    void deleteByOwnerUsernameIgnoreCaseAndId(String ownerUsername, long id);
}

