require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Use S3 for ActiveStorage in production (as you're using Buketeer)
    config.active_storage.service = :S3

    # Other configurations for your app
  end
end
