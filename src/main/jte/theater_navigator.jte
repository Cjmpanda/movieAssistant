@param String username
@param String zip
@param java.util.List<java.util.Map<String, Object>> theaters

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Theater Navigator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">

<header class="bg-primary text-white py-3 mb-4">
    <div class="container d-flex align-items-center">
        <h1 class="h4 mb-0 d-flex align-items-center gap-2">
            <i class="bi bi-geo-alt"></i> Theater Navigator
        </h1>
        <div class="ms-auto">
            @if (username != null)
                <span class="me-2">Hello, <strong>${username}</strong></span>
                <a href="/logout" class="btn btn-outline-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            @else
                <a href="/login" class="btn btn-outline-light btn-sm me-1">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </a>
                <a href="/register" class="btn btn-light btn-sm">
                    <i class="bi bi-person-plus"></i> Register
                </a>
            @endif
        </div>
    </div>
</header>

<div class="container pb-5">

    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h2 class="h5 mb-3">
                <i class="bi bi-search"></i> Find theaters by ZIP
            </h2>
            <form method="post" action="/theaters" class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">ZIP code</label>
                    <input type="text"
                           name="zip"
                           class="form-control"
                           value="${zip}"
                           placeholder="Enter zip-code here"
                           required>
                </div>
                <div class="col-md-3 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-search"></i> Search
                    </button>
                </div>
            </form>
        </div>
    </div>

    @if (theaters != null)
        <div class="row">
            @for (java.util.Map<String, Object> theater : theaters)
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-body">
                            <h3 class="h5 mb-1">
                                ${(String) theater.get("name")}
                            </h3>
                            <p class="text-muted mb-3">
                                ${(String) theater.get("distance")}
                            </p>

                            <h4 class="h6 text-uppercase text-secondary mb-2">
                                Movies playing now:
                            </h4>

                            @for (java.util.Map<String, Object> movie : (java.util.List<java.util.Map<String, Object>>) theater.get("movies"))
                                <div class="mb-2">
                                    <strong>${(String) movie.get("title")}</strong><br/>
                                    <small class="text-muted">
                                        @for (String time : (java.util.List<String>) movie.get("times"))
                                            ${time}
                                        @endfor
                                    </small>
                                </div>
                            @endfor
                        </div>
                    </div>
                </div>
            @endfor
        </div>
    @endif

    <a href="/" class="btn btn-link mt-3">
        <i class="bi bi-house"></i> Back to Home
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
