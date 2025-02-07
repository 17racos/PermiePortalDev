pin "application"

# ✅ Hotwired (Fixing Incorrect Asset Path Issue)
pin "@hotwired/turbo-rails", to: "https://ga.jspm.io/npm:@hotwired/turbo-rails@7.3.0/dist/turbo.es2017-esm.js"
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "https://ga.jspm.io/npm:@hotwired/stimulus-loading@3.2.1/dist/stimulus-loading.js"

# ✅ Rails ActionCable (No Need to Pin `@rails/actioncable/src`)
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4/app/assets/javascripts/actioncable.esm.js"
