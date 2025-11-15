package com.example.movieassistant.web;

import com.example.movieassistant.model.AIAsset;
import com.example.movieassistant.service.AIAssetService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/assets")
public class AssetController {

    private final AIAssetService ai;

    public AssetController(AIAssetService ai) {
        this.ai = ai;
    }

    // AssetController.java
    @GetMapping
    public String myAssets(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";
        model.addAttribute("assets", ai.listFor(username));
        model.addAttribute("username", username);
        return "assets_index"; // <-- no .jte
    }

    @GetMapping("/{id}")
    public String view(@PathVariable long id, HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";
        var asset = ai.findOwned(username, id);
        if (asset == null) return "redirect:/assets";
        model.addAttribute("asset", asset);
        model.addAttribute("username", username);
        return "assets_view";
    }

    @GetMapping("/new")
    public String newForm(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";
        model.addAttribute("username", SessionUtil.currentUser(session));
        return "assets_new";
    }

    @PostMapping
    public String create(
            @RequestParam(required = false, name = "genre") java.util.List<String> genres,
            @RequestParam(required = false) String mood,
            @RequestParam(required = false) String rating,
            @RequestParam(required = false) Integer maxRuntime,
            @RequestParam(required = false) Integer minYear,
            @RequestParam(required = false, name = "service") java.util.List<String> services,
            @RequestParam(required = false) String notes,
            // kept for compatibility; if present, we’ll append it
            @RequestParam(required = false) String prompt,
            jakarta.servlet.http.HttpSession session
    ) {
        String username = com.example.movieassistant.web.SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";

        StringBuilder sb = new StringBuilder();
        sb.append("You are Movie Assistant. Recommend 5 movies the user will love.\n");
        sb.append("- Give a one-sentence pitch for each.\n");
        sb.append("- Include year and where to stream if possible.\n");
        sb.append("- Avoid spoilers.\n\n");

        if (genres != null && !genres.isEmpty()) {
            sb.append("Preferred genres: ").append(String.join(", ", genres)).append("\n");
        }
        if (mood != null && !mood.isBlank()) {
            sb.append("Mood: ").append(mood).append("\n");
        }
        if (rating != null && !rating.isBlank()) {
            sb.append("Rating: ").append(rating).append("\n");
        }
        if (maxRuntime != null) {
            sb.append("Max runtime: ").append(maxRuntime).append(" minutes\n");
        }
        if (minYear != null) {
            sb.append("Newer than year: ").append(minYear).append("\n");
        }
        if (services != null && !services.isEmpty()) {
            sb.append("Streaming services available: ").append(String.join(", ", services)).append("\n");
        }
        if (notes != null && !notes.isBlank()) {
            sb.append("Other preferences: ").append(notes).append("\n");
        }
        if (prompt != null && !prompt.isBlank()) {
            sb.append("\nAdditional instructions: ").append(prompt).append("\n");
        }

        var asset = ai.generateTextAsset(username, sb.toString());
        return "redirect:/assets/" + asset.getId();
    }
}
