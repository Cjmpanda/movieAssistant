@import com.example.movieassistant.model.Theater
@import com.example.movieassistant.model.MovieShowtime
@params String zip, java.util.List<Theater> theaters

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Theater Navigator</title>
  <style>
    body { font-family: Arial, sans-serif; background:#f6f7fb; margin: 0; padding: 20px; }
    .panel { background: #fff; border-radius: 8px; padding: 14px; box-shadow: 0 1px 6px rgba(0,0,0,0.12); }
    h1 { margin: 0 0 10px 0; }
    .row { display: flex; gap: 10px; flex-wrap: wrap; align-items: flex-end; }
    input { padding: 8px 10px; border: 1px solid #cfd4e6; border-radius: 6px; min-width: 180px; }
    button { padding: 8px 12px; border: none; border-radius: 6px; background:#2f5bff; color: white; cursor: pointer; }
    .theater { margin-top: 12px; }
    .theater h2 { margin: 0 0 4px 0; font-size: 18px; }
    .muted { color: #6070a6; font-size: 14px; }
    .movie { margin-top: 8px; padding: 10px; background:#f1f3ff; border-radius: 6px; }
    .tag { display:inline-block; margin: 2px 6px 2px 0; padding: 2px 7px; border-radius: 999px;
           background:#2f5bff; color:#fff; font-size: 13px; }
  </style>
</head>
<body>

  <div class="panel">
    <h1>Theater Navigator</h1>
    <div class="row">
      <form method="get" action="/theater-navigator" style="display:flex; gap:10px; flex-wrap:wrap; align-items:flex-end;">
        <div>
          <label class="muted">Enter ZIP code</label><br/>
          <input name="zip" value="${zip}" placeholder="e.g., 90001" required />
        </div>
        <button type="submit">Search</button>
      </form>
    </div>
  </div>

  @if(zip != null && !zip.isBlank()) {
    <div class="panel" style="margin-top: 14px;">
      <h2>Results for <span class="muted">${zip}</span></h2>

      @if(theaters == null || theaters.isEmpty()) {
        <p class="muted">No theaters found (try a different ZIP or enable MovieGlu mode).</p>
      } else {
        @for(Theater t : theaters) {
          <div class="theater">
            <h2>${t.name}</h2>
            <div class="muted">${t.distance}</div>

            @for(MovieShowtime m : t.movies) {
              <div class="movie">
                <div><strong>${m.title}</strong></div>
                <div>
                  @for(String time : m.times) {
                    <span class="tag">${time}</span>
                  }
                </div>
              </div>
            }
          </div>
        }
      }
    </div>
  }

</body>
</html>
