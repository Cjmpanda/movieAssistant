<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register - Movie Assistant</title>

  <!-- Bootswatch Flatly + Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background: radial-gradient(circle at top, #d9eafd 0, #f8f9fa 45%, #f8f9fa 100%);
      min-height: 100vh;
      margin: 0;
      font-family: "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      display: flex;
      flex-direction: column;
    }
    header {
      background:#d9eafd;
      border-bottom:2px solid #c5d9f7;
      padding:.75rem 1rem;
    }
    .brand {
      font-weight:700;
      font-size:1.5rem;
      color:#0d6efd;
    }
    main {
      flex: 1;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:2rem 1rem;
    }
    .auth-card {
      max-width: 420px;
      width: 100%;
    }
    .logo-circle {
      width:56px;
      height:56px;
      border-radius:50%;
      background:#0d6efd;
      display:flex;
      align-items:center;
      justify-content:center;
      color:#fff;
      font-size:1.6rem;
      box-shadow:0 0.35rem 1rem rgba(13,110,253,.35);
    }
    .form-text-small {
      font-size: .85rem;
    }
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
        <a href="/login" class="btn btn-outline-primary btn-sm fw-semibold">
          <i class="bi bi-box-arrow-in-right"></i> Login
        </a>
      </div>
    </div>
  </header>

  <!-- Centered content -->
  <main>
    <div class="auth-card card shadow-sm border-0">
      <div class="card-body p-4 p-md-5">

        <div class="d-flex justify-content-center mb-3">
          <div class="logo-circle">
            <i class="bi bi-person-plus-fill"></i>
          </div>
        </div>

        <h3 class="text-center fw-bold mb-1">Create your account</h3>
        <p class="text-center text-muted mb-4">
          Sign up to save watchlists and AI-powered movie recommendations.
        </p>

        <!-- Registration form -->
        <form method="post" action="/register" autocomplete="off">
          <div class="mb-3">
            <label class="form-label fw-semibold" for="username">
              Username
            </label>
            <input
              type="text"
              class="form-control"
              id="username"
              name="username"
              placeholder="Choose a username"
              required>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold" for="password">
              Password
            </label>
            <input
              type="password"
              class="form-control"
              id="password"
              name="password"
              placeholder="Create a password"
              required>
            <div class="form-text form-text-small">
              Use at least 6 characters. Avoid reusing important passwords.
            </div>
          </div>

          <div class="mb-4">
            <label class="form-label fw-semibold" for="confirmPassword">
              Confirm password
            </label>
            <input
              type="password"
              class="form-control"
              id="confirmPassword"
              name="confirmPassword"
              placeholder="Re-enter your password"
              required>
          </div>

          <button type="submit" class="btn btn-primary w-100 fw-bold mb-3">
            <i class="bi bi-person-check"></i> Create account
          </button>

          <p class="text-center text-muted form-text-small mb-0">
            Already have an account?
            <a href="/login" class="link-primary text-decoration-none fw-semibold">Log in</a>
          </p>
        </form>
      </div>
    </div>
  </main>

  <footer class="border-top text-center text-muted py-3">
    &copy; ${java.time.Year.now().getValue()} Movie Assistant — Spring Boot &amp; JTE
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
