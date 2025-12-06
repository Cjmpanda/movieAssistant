package com.example.movieassistant.web;

import com.example.movieassistant.model.Theater;
import com.example.movieassistant.service.TheaterNavigatorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TheaterNavigatorController {

    private final TheaterNavigatorService theaterNavigatorService;

    public TheaterNavigatorController(TheaterNavigatorService theaterNavigatorService) {
        this.theaterNavigatorService = theaterNavigatorService;
    }

    @GetMapping("/theater-navigator")
    public String theaterNavigator(@RequestParam(value = "zip", required = false) String zip,
                                   Model model) {

        model.addAttribute("zip", zip);

        List<Theater> theaters = (zip == null || zip.isBlank())
                ? List.of()
                : theaterNavigatorService.findTheatersByZip(zip);

        model.addAttribute("theaters", theaters);
        return "theater_navigator";
    }
}
