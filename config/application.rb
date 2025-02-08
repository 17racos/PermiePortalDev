require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

# ✅ Load Propshaft for asset management
require "propshaft"

Bundler.require(*Rails.groups)

module PermiePortal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # ✅ Active Storage configuration
    config.active_storage.service = ENV["RAILS_ENV"] == "production" ? :bucketeer : :local

    # ✅ Ensure static files are served (for Propshaft)
    config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || Rails.env.development?

    # ✅ Don't generate assets/helpers when using Rails generators
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
