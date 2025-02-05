require_relative "boot"

require "rails"

# Load only the frameworks you need, avoiding unnecessary dependencies
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine" # Ensure ActiveStorage is loaded
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.0

    # ✅ Ensure Active Storage is properly configured
    config.active_storage.service = :local # Change to :amazon in production if needed

    # ✅ Serve static files only in production (Heroku)
    if Rails.env.production?
      config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
    end

    # ✅ Ensure Middleware is used only if needed (Optional)
    # This is only necessary if you’re serving assets manually
    # Heroku and most platforms handle assets through `public/`
    config.middleware.use Rack::Static, urls: ["/builds"], root: "public" if Rails.env.production?

    # ✅ Don't generate assets when running Rails generators
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
