@param String username
@param String error
@param Boolean registered

<div class="card mx-auto" style="max-width: 480px;">
    <div class="card-body">
        <h3 class="text-center mb-3">Create account</h3>

        @if (error != null)
            <div class="alert alert-danger">${error}</div>
        @endif

        @if (registered != null && registered)
            <div class="alert alert-success">Registration successful. Please log in.</div>
        @endif

        <form method="post" action="/register">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input class="form-control" type="text" name="username" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input class="form-control" type="password" name="password" required>
            </div>
            <div class="d-grid">
                <button class="btn btn-primary">Register</button>
            </div>
        </form>
    </div>
</div>
