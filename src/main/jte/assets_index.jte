@param java.util.List<com.example.movieassistant.model.AIAsset> assets
@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Assets</title>

    <!-- Bootswatch Flatly + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background:#f8f9fa; margin:0; font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        header { background:#d9eafd; border-bottom:2px solid #c5d9f7; padding:.75rem 1rem; }
        .brand { font-weight:700; font-size:1.5rem; color:#0d6efd; }
    </style>
</head>
<body>

<!-- Header -->
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

<main class="container py-4">

    <!-- Header row -->
    <div class="d-flex align-items-center mb-3 flex-wrap">
        <h2 class="fw-bold text-primary mb-0">
            <i class="bi bi-collection-play"></i> My AI Assets
        </h2>

        <div class="ms-auto d-flex gap-2">
            <!-- 🔹 NEW BUTTON: Go to Watchlist -->
            <a href="/watchlist" class="btn btn-outline-primary fw-semibold">
                <i class="bi bi-bookmark-heart"></i> My Watchlist
            </a>

            <a href="/assets/new" class="btn btn-primary fw-semibold">
                <i class="bi bi-magic"></i> New Recommendation
            </a>

            <a href="/logout" class="btn btn-outline-dark fw-semibold">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>

    <!-- Sub-header -->
    <p class="text-muted mb-3">
        Welcome back, <strong>${username}</strong>! Here are your AI-generated movie recommendations.
    </p>

    <!-- Asset list -->
    @if (assets.isEmpty())
        <div class="alert alert-info mt-4">
            You don’t have any generated movie recommendations yet.
            Click <strong>New Recommendation</strong> to create your first one!
        </div>
    @else
        <div class="list-group shadow-sm">
            @for (var a : assets)
                <a href="/assets/${a.getId()}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">${a.getTitle()}</h5>
                        <small>${
                a.getCreatedAt().format(
                  java.time.format.DateTimeFormatter.ofPattern("MMM d, yyyy HH:mm")
                )
              }</small>
                    </div>
                    <small class="text-muted">${a.getType()}</small>
                </a>
            @endfor
        </div>
    @endif

    <!-- Footer actions -->
    <div class="mt-4 text-center">
        <a href="/assets/new" class="btn btn-primary btn-lg fw-bold mb-3" aria-label="Generate">
            <i class="bi bi-stars"></i>
        </a>
        <br>
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
