Rails.application.configure do
  # Code is reloaded on changes in development
  config.cache_classes = false

  # Don't eager load code on boot
  config.eager_load = false

  # Show full error reports
  config.consider_all_requests_local = true

  # ✅ Ensure public file server is enabled for Sprockets
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{2.days.to_i}"
  }

  # ✅ Enable Sprockets asset debugging
  config.assets.debug = true
  config.assets.raise_runtime_errors = true

  # Enable caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Configure mailer
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Print deprecation notices
  config.active_support.deprecation = :log

  # Raise error on pending migrations
  config.active_record.migration_error = :page_load
end
