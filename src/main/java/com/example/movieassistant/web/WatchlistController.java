package com.example.movieassistant.web;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WatchlistController {

    @GetMapping("/watchlist")
    public String watchlist(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        if (username == null) return "redirect:/login";
        model.addAttribute("username", username);
        return "user_watchlist"; // maps to src/main/jte/user_watchlist.jte
    }
}
