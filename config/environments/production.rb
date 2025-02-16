Rails.application.configure do
  # ✅ Ensure Sprockets Asset Pipeline is Configured
  config.assets.compile = true
  config.assets.digest = true
  config.assets.version = "1.0"
  config.assets.css_compressor = :sass
  config.assets.precompile += %w(application.js application.css)
  config.assets.prefix = "/assets"

# Prepend all asset URLs with the correct path for production
  config.assets.prefix = "/assets"

# Serve static files only if RAILS_SERVE_STATIC_FILES is present (Heroku, etc.)

  # ✅ Serve static files only if required
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
end
