package com.example.movieassistant.web;

import com.example.movieassistant.service.TheaterNavigatorService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TheaterNavigatorController {

    private final TheaterNavigatorService theaterService;

    public TheaterNavigatorController(TheaterNavigatorService theaterService) {
        this.theaterService = theaterService;
    }

    @GetMapping("/theaters")
    public String showForm(HttpSession session, Model model) {
        String username = SessionUtil.currentUser(session);
        model.addAttribute("username", username);

        model.addAttribute("zip", "");
        model.addAttribute("theaters", null);
        return "theater_navigator";
    }

    @PostMapping("/theaters")
    public String search(
            @RequestParam("zip") String zip,
            HttpSession session,
            Model model) {

        String username = SessionUtil.currentUser(session);
        model.addAttribute("username", username);

        model.addAttribute("zip", zip);
        model.addAttribute("theaters", theaterService.findTheatersByZip(zip));
        return "theater_navigator";
    }
}
