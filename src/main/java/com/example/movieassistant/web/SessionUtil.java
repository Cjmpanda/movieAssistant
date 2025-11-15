package com.example.movieassistant.web;

import jakarta.servlet.http.HttpSession;

public class SessionUtil {
    public static final String SESSION_USER = "username";

    public static void login(HttpSession session, String username) {
        session.setAttribute(SESSION_USER, username);
    }

    public static void logout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
    }

    public static String currentUser(HttpSession session) {
        if (session == null) return null;
        Object u = session.getAttribute(SESSION_USER);
        if (u instanceof String s && !s.isBlank()) {
            return s;
        }
        return null;
    }
}
