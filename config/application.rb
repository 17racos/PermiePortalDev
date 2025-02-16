require_relative "boot"
require "rails"

# ✅ Load only the frameworks you need (BEFORE Bundler.require)
require "sprockets/railtie" # ✅ Ensure Sprockets is loaded
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

# ✅ Load all gems (must be AFTER Rails components)
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # ✅ Ensure ActiveAdmin dependencies are available
    config.eager_load_namespaces << ActiveModel
    config.eager_load_namespaces << ActiveRecord
    config.eager_load_namespaces << ActionController

    # ✅ Configure assets pipeline
    config.assets.version = "1.0"
    config.assets.paths << Rails.root.join("app", "assets", "javascripts")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
    config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("app", "assets", "images")

    # ✅ Ensure TailwindCSS and other assets are precompiled
    config.assets.precompile += %w(application.js application.css admin.js admin.css tailwind.css)

    # ✅ Serve static files only if required (for Heroku, etc.)
    config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

    # ✅ Don't generate assets/helpers when running generators
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
