package com.example.movieassistant.web;

import com.example.movieassistant.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserService users;

    public AuthController(UserService users) {
        this.users = users;
    }

    @GetMapping("/login")
    public String loginPage(HttpSession session, Model model) {
        model.addAttribute("username", SessionUtil.currentUser(session));
        model.addAttribute("error", null);
        return "home"; // using inline login on the homepage
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {
        if (!users.verify(username, password)) {
            model.addAttribute("error", "Invalid username or password");
            model.addAttribute("username", null);
            return "home"; // re-render inline login on homepage with error
        }
        SessionUtil.login(session, username);
        return "redirect:/watchlist"; // ✅ go to watchlist after login
    }

    @GetMapping("/register")
    public String registerForm(HttpSession session, Model model) {
        model.addAttribute("username", SessionUtil.currentUser(session));
        model.addAttribute("error", null);
        model.addAttribute("registered", false);
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           HttpSession session,
                           Model model) {
        if (users.exists(username)) {
            model.addAttribute("error", "Username already taken");
            model.addAttribute("username", null);
            model.addAttribute("registered", false);
            return "register";
        }
        users.register(username, password);
        model.addAttribute("registered", true);
        model.addAttribute("username", null);
        model.addAttribute("error", null);
        return "home"; // show home; user can login
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        SessionUtil.logout(session);
        return "redirect:/";
    }
}
