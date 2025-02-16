require_relative "boot"
require "rails"
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.0
    #Ensure ActiveAdmin dependencies are available
    config.eager_load_namespaces << ActiveModel


# Load only the frameworks you need
require "sprockets/railtie" # ✅ Ensure Sprockets is loaded
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"


    # ✅ Ensure assets paths exist
    config.assets.paths ||= []
    config.assets.enabled = true
    config.assets.version = "1.0"
    config.assets.paths << Rails.root.join("app", "assets", "javascripts")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
    config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("app", "assets", "images")

    # ✅ Add assets for precompilation
    config.assets.precompile ||= []
    config.assets.precompile += %w(application.js application.css admin.js admin.css)

    # ✅ Ensure Rails serves assets
    config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || Rails.env.development?

    

    # ✅ Don't generate assets when running Rails generators
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
