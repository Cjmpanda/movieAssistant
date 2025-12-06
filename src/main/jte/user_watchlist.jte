@import com.example.movieassistant.model.WatchlistItem

@param String username
@param java.util.List<WatchlistItem> items

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${username}'s Watchlist</title>

    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background-color: #f8f9fa; padding: 20px; }
        .box { background-color: #d9eafd; border-radius: 8px; padding: 15px; margin-bottom: 15px; text-align: center; }
        .btn-custom { border-radius: 12px; }
        .timestamp { color: #6c757d; font-size: 0.9rem; }
    </style>
</head>
<body>

<!-- Header -->
<div class="container text-center mb-4">
    <div class="box">
        <h1 class="fw-bold text-primary">
            <i class="bi bi-bookmark-heart"></i> ${username}'s Watchlist
        </h1>
        <div class="timestamp">
            Keep track of movies and shows you want to watch.
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="container mb-3">
    <div class="row mb-3">
        <div class="col-md-6">
            <a href="/assets" class="btn btn-outline-secondary btn-custom">
                <i class="bi bi-arrow-left"></i> Back to Recommendations
            </a>
        </div>
        <div class="col-md-6 text-md-end mt-2 mt-md-0">
            <a href="/assets/new" class="btn btn-primary btn-custom">
                <i class="bi bi-stars"></i> Get New AI Recommendations
            </a>
        </div>
    </div>

    @if(items == null || items.isEmpty()) {
        <div class="alert alert-info text-center">
            <i class="bi bi-info-circle"></i>
            Your watchlist is empty. Go to AI recommendations and add something!
        </div>
    @endif

    @if(items != null && !items.isEmpty()) {
        <div class="row">
            @for(WatchlistItem item : items) {
                <div class="col-md-6 mb-3">
                    <div class="card shadow-sm h-100">
                        <div class="card-body d-flex flex-column">

                            <h5 class="card-title mb-1">
                                ${item.getTitle()}
                                @if(item.getYear() != null) {
                                    <small class="text-muted">(${item.getYear()})</small>
                                @endif
                            </h5>

                            @if(item.getServices() != null && !item.getServices().isEmpty()) {
                                <p class="card-text mb-1">
                                    <small class="text-muted">
                                        Streaming: ${String.join(", ", item.getServices())}
                                    </small>
                                </p>
                            @endif

                            @if(item.getPitch() != null) {
                                <p class="card-text flex-grow-1">
                                    ${item.getPitch()}
                                </p>
                            @endif

                            <div class="mt-2 d-flex justify-content-between align-items-center">
                                <small class="text-muted">
                                    @if(item.getSourceAssetId() != null) {
                                        From asset #${item.getSourceAssetId()}
                                    @endif
                                </small>
                                <form method="post" action="/watchlist/${item.getId()}/delete">
                                    <button type="submit" class="btn btn-sm btn-outline-danger btn-custom">
                                        <i class="bi bi-trash"></i> Remove
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            @endfor
        </div>
    @endif
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>