package com.example.movieassistant.web;

import com.example.movieassistant.service.AIAssetService;
import com.example.movieassistant.service.WatchlistService;
import com.example.movieassistant.model.WatchlistItem;
import com.example.movieassistant.model.RecommendationResult;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WatchlistController {

    private final WatchlistService watchlistService;
    private final AIAssetService aiAssetService;

    public WatchlistController(WatchlistService watchlistService,
                               AIAssetService aiAssetService) {
        this.watchlistService = watchlistService;
        this.aiAssetService = aiAssetService;
    }

    @GetMapping("/watchlist")
    public String watchlist(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";

        List<WatchlistItem> items = watchlistService.listFor(username);

        model.addAttribute("username", username);
        model.addAttribute("items", items);
        return "user_watchlist";
    }

    // ✅ Add-from-recommendation endpoint
    @PostMapping("/assets/{assetId}/watchlist")
    public String addFromAsset(@PathVariable long assetId,
                               @RequestParam("index") int index,
                               HttpSession session) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";

        RecommendationResult recs = aiAssetService.getRecommendations(assetId);
        watchlistService.addFromRecommendation(username, assetId, index, recs);

        return "redirect:/watchlist";
    }

    @PostMapping("/watchlist/{itemId}/delete")
    public String deleteItem(@PathVariable long itemId, HttpSession session) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";

        watchlistService.remove(username, itemId);
        return "redirect:/watchlist";
    }
}