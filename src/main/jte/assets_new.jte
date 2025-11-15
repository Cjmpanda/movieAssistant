@param String username

<div class="container">
    <div class="mb-4 p-3 rounded text-center" style="background-color:#d9eafd;">
        <h2 class="fw-bold text-primary mb-0">
            <i class="bi bi-magic"></i> AI Movie Recommender
        </h2>
        <small class="text-muted">Tell the assistant what you feel like watching.</small>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <form method="post" action="/assets" class="row g-3">
                <!-- Genres -->
                <div class="col-12">
                    <label class="form-label fw-semibold"><i class="bi bi-tags"></i> Preferred Genres</label>
                    <div class="row">
                        <div class="col-md-6 d-flex gap-3 flex-wrap">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Action" id="g-action">
                                <label class="form-check-label" for="g-action">Action</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Comedy" id="g-comedy">
                                <label class="form-check-label" for="g-comedy">Comedy</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Drama" id="g-drama">
                                <label class="form-check-label" for="g-drama">Drama</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Sci-Fi" id="g-scifi">
                                <label class="form-check-label" for="g-scifi">Sci-Fi</label>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex gap-3 flex-wrap">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Horror" id="g-horror">
                                <label class="form-check-label" for="g-horror">Horror</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Thriller" id="g-thriller">
                                <label class="form-check-label" for="g-thriller">Thriller</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Romance" id="g-romance">
                                <label class="form-check-label" for="g-romance">Romance</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="genre" value="Animation" id="g-animation">
                                <label class="form-check-label" for="g-animation">Animation</label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Mood + Rating -->
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-emoji-smile"></i> Mood</label>
                    <select class="form-select" name="mood">
                        <option value="">No preference</option>
                        <option>Feel-good</option>
                        <option>Dark & gritty</option>
                        <option>Edge-of-seat</option>
                        <option>Slow & thoughtful</option>
                        <option>Family night</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-shield-check"></i> Rating</label>
                    <select class="form-select" name="rating">
                        <option value="">Any</option>
                        <option>G</option>
                        <option>PG</option>
                        <option>PG-13</option>
                        <option>R</option>
                    </select>
                </div>

                <!-- Runtime + Year -->
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-hourglass-split"></i> Max Runtime (mins)</label>
                    <input type="number" min="60" max="240" step="5" class="form-control" name="maxRuntime" placeholder="e.g., 120">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-calendar3"></i> Newer Than Year</label>
                    <input type="number" min="1950" max="2100" class="form-control" name="minYear" placeholder="e.g., 2015">
                </div>

                <!-- Services -->
                <div class="col-12">
                    <label class="form-label fw-semibold"><i class="bi bi-tv"></i> Streaming Services</label>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="service" value="Netflix" id="s-netflix">
                            <label class="form-check-label" for="s-netflix">Netflix</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="service" value="Hulu" id="s-hulu">
                            <label class="form-check-label" for="s-hulu">Hulu</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="service" value="Prime Video" id="s-prime">
                            <label class="form-check-label" for="s-prime">Prime Video</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="service" value="Disney+" id="s-disney">
                            <label class="form-check-label" for="s-disney">Disney+</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="service" value="Max" id="s-max">
                            <label class="form-check-label" for="s-max">Max</label>
                        </div>
                    </div>
                </div>

                <!-- Extra Notes -->
                <div class="col-12">
                    <label class="form-label fw-semibold"><i class="bi bi-journal-text"></i> Anything else?</label>
                    <textarea class="form-control" name="notes" rows="4"
                              placeholder="Actors you like, languages, vibes, avoid spoilers, etc."></textarea>
                </div>

                <div class="col-12 d-grid">
                    <button class="btn btn-primary btn-lg fw-bold">
                        <i class="bi bi-stars"></i> Get Recommendations
                    </button>
                </div>
                <input type="hidden" name="prompt" value="">
            </form>
        </div>
    </div>
</div>
