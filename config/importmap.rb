pin "application"

# ✅ Hotwired
pin "@hotwired/turbo-rails", to: "/assets/@hotwired--turbo-rails.js", preload: true
pin "@hotwired/stimulus", to: "/assets/@hotwired--stimulus.js", preload: true
pin "@hotwired/stimulus-loading", to: "/assets/@hotwired--stimulus-loading.js", preload: true

# ✅ Rails ActionCable
pin "@rails/actioncable", to: "/assets/@rails--actioncable.js", preload: true
pin "@rails/actioncable/src", to: "/assets/@rails--actioncable--src.js", preload: true

# ✅ Other JavaScript dependencies
pin "tailwindcss", to: "/assets/tailwindcss.js", preload: true
pin "postcss", to: "/assets/postcss.js", preload: true
pin "autoprefixer", to: "/assets/autoprefixer.js", preload: true
