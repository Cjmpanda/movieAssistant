package com.example.movieassistant.web;

import com.example.movieassistant.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {

    // Optional; may be null if you use the no-arg ctor
    private final UserService users;

    // ✅ Preferred: pass UserService so we can detect stale sessions
    public AuthInterceptor(UserService users) {
        this.users = users;
    }

    // ✅ Also allow no-arg usage (backward compatible)
    public AuthInterceptor() {
        this.users = null;
    }

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        String path = req.getRequestURI();

        // Protect watchlist and assets
        if (path.startsWith("/assets") || path.startsWith("/watchlist")) {
            HttpSession session = req.getSession(false);
            String user = SessionUtil.currentUser(session);

            // Not logged in at all
            if (user == null) {
                if (session != null) SessionUtil.logout(session);
                res.sendRedirect("/login");
                return false;
            }

            // If we have UserService, also check for stale sessions
            if (users != null && users.find(user) == null) {
                if (session != null) SessionUtil.logout(session);
                res.sendRedirect("/login");
                return false;
            }
        }
        return true;
    }
}

