@import com.example.movieassistant.model.AIAsset
@param AIAsset asset
@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${asset.getTitle()}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/flatly/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body { background-color: #f8f9fa; padding: 20px; }
        .box { background-color: #d9eafd; border-radius: 8px; padding: 15px; margin-bottom: 15px; text-align: center; }
        .recommendation-box { background-color: #cfe2ff; border-radius: 8px; padding: 40px; text-align: left; }
        .btn-custom { border-radius: 12px; }
        .no-bg { background-color: transparent !important; }
        .spacer { margin-top: 20px; }
        .timestamp { color: #6c757d; font-size: 0.9rem; }
        pre { white-space: pre-wrap; background: transparent; border: none; font-family: inherit; }
    </style>
</head>
<body>

<!-- Header -->
<div class="container text-center mb-4">
    <div class="box">
        <h1 class="fw-bold text-primary">
            <i class="bi bi-film"></i> AI Movie/TV Recommendations <i class="bi bi-film"></i>
        </h1>
        <div class="timestamp">
            Generated: ${asset.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("MMM d, yyyy h:mm a"))}
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="container mb-3">
    <div class="row">
        <div class="col-md-9">
            <div class="no-bg">
                <h4 class="fw-bold text-primary mb-3">${asset.getTitle()}</h4>
            </div>
        </div>
        <div class="col-md-3 d-flex align-items-center">
            <a href="/assets" class="btn btn-outline-secondary w-100 fw-bold">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
    </div>

    <div class="recommendation-box mt-3 shadow-sm">
        <pre>${asset.getContent()}</pre>
    </div>
</div>

<!-- Footer Buttons -->
<div class="container text-center">
    <div class="row justify-content-center">
        <div class="col-md-3 col-6 mb-2">
            <a href="/assets/new" class="btn btn-primary w-100 btn-custom">
                <i class="bi bi-stars"></i> New Recommendation
            </a>
        </div>
        <div class="col-md-3 col-6 mb-2">
            <a href="/watchlist" class="btn btn-primary w-100 btn-custom">
                <i class="bi bi-bookmark-heart"></i> My Watchlist
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>