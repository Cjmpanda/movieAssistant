package com.example.movieassistant.web;

import com.example.movieassistant.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final UserService users;

    public HomeController(UserService users) {
        this.users = users;
    }

    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        // Stale session guard: if user no longer exists in memory, log out
        if (username != null && users.find(username) == null) {
            SessionUtil.logout(session);
            username = null;
        }
        model.addAttribute("username", username);
        model.addAttribute("error", null); // for inline login errors if you reuse home
        return "home"; // no .jte
    }
}




