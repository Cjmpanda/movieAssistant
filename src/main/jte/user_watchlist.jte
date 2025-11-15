@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${username}'s Watchlist</title>

    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background:#f8f9fa; margin:0; font-family:"Segoe UI",Roboto,Helvetica,Arial,sans-serif; }
        header { background:#d9eafd; border-bottom:2px solid #c5d9f7; padding:.75rem 1rem; }
        .brand { font-weight:700; font-size:1.5rem; color:#0d6efd; }
        .watch-card { background:white; border-radius:.5rem; box-shadow:0 4px 8px rgba(0,0,0,0.05); padding:1rem; margin-bottom:1rem; }
    </style>
</head>
<body>

<header>
    <div class="container d-flex align-items-center">
        <div class="brand d-flex align-items-center gap-2">
            <i class="bi bi-film"></i> Movie Assistant
        </div>
        <div class="ms-auto">
            <span class="me-2">Hello, <strong>${username}</strong></span>
            <a href="/logout" class="btn btn-outline-dark btn-sm fw-semibold">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</header>

<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold text-primary mb-0">
            <i class="bi bi-bookmark-heart"></i> My Watchlist
        </h2>
        <a href="/assets" class="btn btn-primary fw-semibold">
            <i class="bi bi-stars"></i> AI Recommendations
        </a>
    </div>

    <!-- Sample static items; replace with your dynamic list if desired -->
    <div class="watch-card">
        <h5 class="fw-bold mb-1">Inception (2010)</h5>
        <p class="text-muted mb-2"><i class="bi bi-clock"></i> Last watched: Jun 5, 2025</p>
        <p class="mb-0">A mind-bending sci-fi thriller where dreams and reality collide.</p>
        <div class="mt-2">
            <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i> Remove</button>
        </div>
    </div>

    <div class="watch-card">
        <h5 class="fw-bold mb-1">Oppenheimer (2023)</h5>
        <p class="text-muted mb-2"><i class="bi bi-clock"></i> Last watched: Feb 11, 2025</p>
        <p class="mb-0">Christopher Nolan’s masterful biopic exploring the father of the atomic bomb.</p>
        <div class="mt-2">
            <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i> Remove</button>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="/assets/new" class="btn btn-lg btn-primary fw-bold">
            <i class="bi bi-magic"></i> Get AI Movie Recommendations
        </a>
        <br><br>
        <a href="/" class="btn btn-outline-secondary btn-lg fw-bold">
            <i class="bi bi-house-door"></i> Home
        </a>
    </div>
</main>

<footer class="border-top text-center text-muted py-3 mt-4">
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
