Rails.application.configure do
  # ✅ Code is NOT reloaded between requests in production
  config.cache_classes = true

  # ✅ Eager load code on boot for better performance
  config.eager_load = true

  # ✅ Full error reports should be disabled in production
  config.consider_all_requests_local = false

  # ✅ Enable caching for better performance
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store

  # ✅ Ensure Sprockets Asset Pipeline is Configured
  config.assets.compile = true  # Should be false unless assets are missing
  config.assets.digest = true
  config.assets.version = "1.0"
  config.assets.css_compressor = :sass  # Compress CSS with Sass
  config.assets.precompile += %w(application.js application.css)  # Ensure these precompile

  # ✅ Serve static files only if required by ENV variable (for Heroku)
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # ✅ Active Storage configuration (Set to `:local` if not using S3)
  config.active_storage.service = :local

  # ✅ Force SSL in production (Recommended for security)
  config.force_ssl = true

  # ✅ Set logging to info to reduce log size
  config.log_level = :info
  config.log_formatter = ::Logger::Formatter.new

  # ✅ Ensure master key is required for credentials (Important for Devise, etc.)
  config.require_master_key = true

  # ✅ Mailer configuration (Set `APP_HOST` in your environment variables)
  config.action_mailer.default_url_options = { host: ENV["APP_HOST"], protocol: "https" }
  config.action_mailer.perform_caching = false

  # ✅ Handle migrations and database connection issues
  config.active_record.dump_schema_after_migration = false

  # ✅ Background job queueing (Set to `:inline` if not using Sidekiq or similar)
  config.active_job.queue_adapter = :inline

  