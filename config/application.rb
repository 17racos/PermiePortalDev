require_relative "boot"

require "rails"

# Load only the frameworks you need, avoiding unnecessary dependencies
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

# ✅ Only require Sprockets if you're still using it
require "sprockets/railtie" if defined?(Sprockets)

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.0

    # ✅ Active Storage configuration
    config.active_storage.service = :local # Change to :amazon or :digitalocean in production

    # ✅ Asset Pipeline Configuration (if still using Sprockets)
    if defined?(Sprockets)
      config.assets.enabled = true
      config.assets.version = "1.0"
      config.assets.paths << Rails.root.join("app", "assets", "builds") # Ensure assets are found
    end

    # ✅ Serve static files (Rails will handle JavaScript + CSS built by ESBuild)
    config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present? || Rails.env.development?

    # ✅ Remove Rack::Static (Handled by Rails Public File Server)
    # config.middleware.use Rack::Static, urls: ["/builds"], root: "public" if Rails.env.production?

    # ✅ Don't generate assets when running Rails generators
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
