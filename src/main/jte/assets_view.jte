@import com.example.movieassistant.model.AIAsset
@import com.example.movieassistant.model.RecommendationResult
@import com.example.movieassistant.model.MovieRecommendation

@param RecommendationResult recs
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
            <h4 class="fw-bold text-primary mb-3">${asset.getTitle()}</h4>
        </div>
        <div class="col-md-3 d-flex align-items-center">
            <a href="/assets" class="btn btn-outline-secondary w-100 fw-bold">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>
    </div>

    <div class="recommendation-box mt-3 shadow-sm">

        @if(recs != null && recs.getRecommendations() != null && !recs.getRecommendations().isEmpty()) {
            <div class="row">

                @for(int i = 0; i < recs.getRecommendations().size(); i++) {

                    <div class="col-md-6 mb-3">
                        <div class="card shadow-sm">
                            <div class="card-body">

                                <h5 class="card-title">
                                    ${recs.getRecommendations().get(i).getTitle()}
                                    @if(recs.getRecommendations().get(i).getYear() != null) {
                                        <small class="text-muted">
                                            (${recs.getRecommendations().get(i).getYear()})
                                        </small>
                                    @endif
                                </h5>

                                @if(recs.getRecommendations().get(i).getPitch() != null) {
                                    <p class="card-text">
                                        ${recs.getRecommendations().get(i).getPitch()}
                                    </p>
                                @endif

                                @if(recs.getRecommendations().get(i).getServices() != null
                            && !recs.getRecommendations().get(i).getServices().isEmpty()) {
                                    <p class="card-text">
                                        <small class="text-muted">
                                            Available on:
                                            ${String.join(", ", recs.getRecommendations().get(i).getServices())}
                                        </small>
                                    </p>
                                @endif

                                <form method="post" action="/assets/${asset.getId()}/watchlist">
                                    <input type="hidden" name="index" value="${i}">
                                    <button type="submit" class="btn btn-sm btn-primary btn-custom">
                                        <i class="bi bi-bookmark-plus"></i> Add to Watchlist
                                    </button>
                                </form>

                            </div>
                        </div>
                    </div>

                @endfor

            </div>
        @endif

        @if(recs == null || recs.getRecommendations() == null || recs.getRecommendations().isEmpty()) {
            <pre>${asset.getContent()}</pre>
        @endif

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