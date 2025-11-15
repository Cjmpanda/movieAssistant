@param String username
@param String error

<div class="container">
    <div class="mx-auto" style="max-width: 460px;">
        <div class="mb-4 p-3 rounded" style="background-color:#d9eafd;">
            <h2 class="text-center fw-bold text-primary mb-0">
                <i class="bi bi-person-circle"></i> Sign in to Movie Assistant
            </h2>
        </div>

        @if (error != null)
            <div class="alert alert-danger">${error}</div>
        @endif

        <div class="card shadow-sm">
            <div class="card-body">
                <form method="post" action="/login" class="row g-3">
                    <div class="col-12">
                        <label class="form-label fw-semibold"><i class="bi bi-at"></i> Username</label>
                        <input class="form-control" type="text" name="username" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold"><i class="bi bi-key"></i> Password</label>
                        <input class="form-control" type="password" name="password" required>
                    </div>
                    <div class="col-12 d-grid">
                        <button class="btn btn-primary btn-lg fw-bold">
                            <i class="bi bi-box-arrow-in-right"></i> Sign In
                        </button>
                    </div>
                    <div class="col-12 text-center">
                        <small class="text-muted">No account?</small>
                        <a href="/register" class="ms-1 fw-semibold">Create one</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
