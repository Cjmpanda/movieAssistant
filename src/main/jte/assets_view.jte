@param com.example.movieassistant.model.AIAsset asset
@param String username

<a href="/assets" class="btn btn-link">&larr; Back to list</a>
<div class="card my-3">
    <div class="card-body">
        <h3 class="card-title">${asset.getTitle()}</h3>
        <p><span class="badge text-bg-secondary">${asset.getType()}</span></p>
        <pre style="white-space: pre-wrap;">${asset.getContent()}</pre>
    </div>
</div>
