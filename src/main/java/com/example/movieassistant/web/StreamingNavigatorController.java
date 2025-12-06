package com.example.movieassistant.web;

import com.example.movieassistant.web.SessionUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StreamingNavigatorController {

    @GetMapping("/streaming-navigator")
    public String streamingNavigator(HttpSession session, Model model) {
        String username = SessionUtil.getUsername(session);

        if (username == null) {
            return "redirect:/login";
        }

        model.addAttribute("username", username);

        return "streaming_navigator";  // New JTE template
    }
}
