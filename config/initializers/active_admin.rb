# Ensure ActiveAdmin does not rely on `config.assets`
if Rails.application.config.respond_to?(:assets)
  Rails.application.config.assets = nil
end

ActiveAdmin.setup do |config|
  # Use Webpacker (or Tailwind/PostCSS)
  config.use_webpacker = true if defined?(Webpacker)

  # Register stylesheets and JavaScripts safely
  config.register_stylesheet 'active_admin.css' if Rails.root.join('app/assets/stylesheets/active_admin.css').exist?
  config.register_javascript 'active_admin.js' if Rails.root.join('app/javascript/packs/active_admin.js').exist?

  # Standard ActiveAdmin Configuration
  config.site_title = "App"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  config.localize_format = :long

  # Ensure Webpacker is used instead of Sprockets
  config.use_webpacker = true
end
