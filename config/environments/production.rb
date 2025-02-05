require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Cache classes to improve performance in production
  config.cache_classes = true

  # Eager load code on boot to improve thread safety and performance
  config.eager_load = true

  # Full error reports are disabled, and caching is enabled
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensure that a master key is available for decrypting credentials
  # If using Rails 5.2+ for credentials management, uncomment below
  # config.require_master_key = true

  # Disable serving static files from `/public` folder
  # This is handled by NGINX/Apache in production
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Use S3 for ActiveStorage in production
  config.active_storage.service = :bucketeer


  # Ensure SSL in production (consider enabling this for better security)
  config.force_ssl = true if ENV['RAILS_ENV'] == 'production'

  # Email handling
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'example.com' }  # Update with your domain

  # Use default logging formatter
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :debug  # Adjust logging level if needed
  config.log_tags = [:request_id]

  # Use stdout logging if configured via ENV
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Don't dump schema after migrations
  config.active_record.dump_schema_after_migration = false

  # Caching configuration (can be adjusted for efficiency)
  config.cache_store = :memory_store, { size: 64.megabytes }

  # Consider additional performance tuning options for better efficiency:

end
