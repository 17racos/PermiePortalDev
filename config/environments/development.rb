require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Reload application code on changes
  config.cache_classes = false
  config.eager_load = false

  # Show full error reports
  config.consider_all_requests_local = true

  # ✅ Serve static files (needed for Propshaft)
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=#{2.days.to_i}"
  }

  # Enable server timing
  config.server_timing = true

  # ✅ Configure caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # ✅ Ensure ActiveStorage uses local storage in development
  config.active_storage.service = :local

  # Disable email errors in development
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Log deprecations
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # Raise error if there are pending migrations
  config.active_record.migration_error = :page_load

  # Show SQL queries in logs
  config.active_record.verbose_query_logs = true

  # Uncomment to raise errors on missing translations
  # config.i18n.raise_on_missing_translations = true

  # Uncomment to annotate rendered views with filenames
  # config.action_view.annotate_rendered_view_with_filenames = true
end
