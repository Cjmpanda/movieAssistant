@param String title
@param String username
@param gg.jte.Content body

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body{background:#f8f9fa;margin:0}
        header{background:#d9eafd;border-bottom:2px solid #c5d9f7;padding:.75rem 1rem}
        .brand{font-weight:700;font-size:1.5rem;color:#0d6efd}
        footer{border-top:1px solid #dee2e6;margin-top:3rem;padding:1rem 0;text-align:center;color:#6c757d}
    </style>
</head>
<body>
<header class="d-flex justify-content-between align-items-center">
    <div class="brand d-flex align-items-center gap-2">
        <i class="bi bi-film"></i> Movie Assistant
    </div>
    <div>
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
</header>

<main class="container py-4">
    @body()
</main>

<footer>
    &copy; ${java.time.Year.now().getValue()} Movie Assistant — Spring Boot + JTE
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
