# Pin npm packages by running ./bin/importmap

# Rails defaults
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

# Pin all Stimulus controllers
pin_all_from "app/javascript/controllers", under: "controllers"

# Pin custom JavaScript modules
pin "auto_filter", to: "auto_filter.js"

