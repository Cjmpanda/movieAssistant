@param String username
@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Movie and TV Show Assistant</title>

    <!-- Bootswatch Flatly + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background:#f8f9fa; margin:0; font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        header { background:#d9eafd; border-bottom:2px solid #c5d9f7; padding:.75rem 1rem; }
        .brand { font-weight:800; font-size:1.5rem; color:#0d6efd; }
        .hero { min-height:80vh; }
        .login-card { max-width:400px; width:100%; }
        footer { border-top:1px solid #dee2e6; padding:1rem 0; text-align:center; color:#6c757d; }
    </style>
</head>
<body>

<!-- Header: brand left, auth actions right -->
<header>
    <div class="container d-flex align-items-center">
        <div class="brand d-flex align-items-center gap-2">
            <i class="bi bi-film"></i> Movie Assistant
        </div>
        <div class="ms-auto">
            @if (username != null)
                <span class="me-2">Hello, <strong>${username}</strong></span>
                <a href="/logout" class="btn btn-outline-dark btn-sm fw-semibold">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            @else
                <a href="/login" class="btn btn-outline-primary btn-sm fw-semibold">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </a>
                <a href="/register" class="btn btn-primary btn-sm fw-semibold ms-1">
                    <i class="bi bi-person-plus"></i> Register
                </a>
            @endif
        </div>
    </div>
</header>

<!-- Title banner -->
<section class="text-center py-4" style="background:#d9eafd;">
    <h1 class="fw-bold d-flex justify-content-center align-items-center gap-2 mb-0">
        <i class="bi bi-film"></i>
        Movie and TV Show Assistant
        <i class="bi bi-film"></i>
    </h1>
</section>

<!-- Hero section -->
<section class="hero d-flex flex-column justify-content-center align-items-center text-center bg-light py-5">
    <img
            src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_640.jpg"
            alt="Movie Assistant"
            class="rounded mb-4 shadow-sm"
            style="max-width:500px; border-radius:.75rem;"
    />

    <p class="lead mb-5" style="max-width:640px;">
        Keep track of what you’ve watched, find where to stream it, and get AI-powered recommendations
        for your next favorite movie or TV show.
    </p>

    @if (username == null)
        <!-- Inline login card -->
        <div class="card shadow-sm login-card">
            <div class="card-body">
                <h4 class="fw-bold text-primary text-center mb-3">
                    <i class="bi bi-box-arrow-in-right"></i> Sign In
                </h4>

                @if (error != null)
                    <div class="alert alert-danger">${error}</div>
                @endif

                <form method="post" action="/login">
                    <div class="mb-3 text-start">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="d-grid">
                        <button class="btn btn-primary btn-lg fw-bold" type="submit">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </button>
                    </div>
                </form>

                <p class="text-center mt-3 mb-0">
                    Don’t have an account? <a href="/register" class="fw-semibold">Register here</a>
                </p>
            </div>
        </div>

    @else
        <!-- Logged-in actions  -->
        <div class="text-center">
            <h4 class="fw-bold text-success mb-3">Welcome back, ${username}!</h4>

            <a href="/assets" class="btn btn-primary btn-lg me-2 mb-2">
                <i class="bi bi-collection-play"></i> Go to Dashboard
            </a>

            <!-- Theater Navigator -->
            <a href="/theater-navigator" class="btn btn-outline-primary btn-lg me-2 mb-2">
                <i class="bi bi-geo-alt"></i> Theater Navigator
            </a>

            <a href="/logout" class="btn btn-outline-dark btn-lg mb-2">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    @endif
</section>

<footer class="mt-4">
    <div class="container">
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
