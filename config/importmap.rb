# Pin npm packages by running ./bin/importmap
# Pin core application scripts
pin "application"

# Hotwired Turbo (for Turbo Drive & Turbo Streams)
pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo@7.3.0/dist/turbo.min.js", preload: true

# ActionCable for real-time updates
pin "@rails/actioncable", to: "https://cdn.jsdelivr.net/npm/@rails/actioncable@7.0.4/dist/actioncable.esm.js"

# Stimulus (for interactive components)
pin "@hotwired/stimulus", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus@3.2.2/dist/stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus-loading@1.0.0/dist/stimulus-loading.js", preload: true

# TailwindCSS (Tailwind does not need pinning, but ensuring proper setup)
