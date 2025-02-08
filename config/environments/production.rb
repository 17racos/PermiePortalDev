require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Optimize performance for production
  config.cache_classes = true
  config.eager_load = true

  # Disable full error reports & enable caching
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # ✅ Force serving static assets (Fix missing CSS/JS)
  config.public_file_server.enabled = true

  # ✅ Use Propshaft for assets (Fix missing assets in production)
  config.assets.digest = true
  config.assets.css_compressor = nil  # Prevents CSS compression issues with Propshaft
  config.assets.js_compressor = nil   # Prevents JS compression issues with Propshaft

  # ✅ Ensure Propshaft finds assets
  config.assets.paths << Rails.root.join("app/assets")
  config.assets.paths << Rails.root.join("public/assets")

  # ✅ Use S3 (Bucketeer) for ActiveStorage in production
  config.active_storage.service = :bucketeer

  # ✅ Force SSL in production (Fixes HTTPS issues)
  config.force_ssl = true

  # Configure mailer
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: ENV["DOMAIN"] || "example.com" }

  # Optimize logging
  config.log_level = :info
  config.log_tags = [:request_id]
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT if required
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # ✅ Force assets precompilation in production
  config.assets.compile = false  # Prevents dynamic compilation
  config.assets.precompile += %w[application.css application.js]

  # Disable schema dump after migrations
  config.active_record.dump_schema_after_migration = false

  # ✅ Optimize caching for performance
  config.cache_store = :memory_store, { size: 64.megabytes }
end
