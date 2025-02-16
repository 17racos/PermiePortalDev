# Ensure Sprockets is loaded before configuring assets
Rails.application.config.assets ||= ActiveSupport::OrderedOptions.new

# Ensure `config.assets.paths` is initialized before modifying it
Rails.application.config.assets.paths ||= []

# Add asset paths (if needed)
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "javascripts")
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")

# Ensure `config.assets.precompile` is defined before modifying it
Rails.application.config.assets.precompile ||= []

# Add assets for precompilation
Rails.application.config.assets.precompile += %w(application.js application.css admin.js admin.css)

# Explicitly set the version of assets to force cache busting when changed
Rails.application.config.assets.version = "1.0"
