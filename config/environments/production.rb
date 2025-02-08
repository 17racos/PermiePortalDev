require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Optimize performance for production
  config.cache_classes = true
  config.eager_load = true

  # Disable full error reports & enable caching
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # ✅ Serve static files in production when `RAILS_SERVE_STATIC_FILES` is set
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # ✅ Use S3 (Bucketeer) for ActiveStorage in production
  config.active_storage.service = :bucketeer

  # Force SSL in production for security (adjust if needed)
  config.force_ssl = ENV["RAILS_ENV"] == "production"

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

  # Disable schema dump after migrations
  config.active_record.dump_schema_after_migration = false

  # ✅ Optimize caching for performance
  config.cache_store = :memory_store, { size: 64.megabytes }
end
