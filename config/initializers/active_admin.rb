ActiveAdmin.setup do |config|
  # ✅ Remove Webpacker/Sprockets settings (since we use Propshaft)
  config.use_webpacker = false if defined?(Webpacker)

  # ✅ Register ActiveAdmin styles & scripts (for Propshaft)
  config.register_stylesheet "active_admin.css" if Rails.root.join("app/assets/builds/active_admin.css").exist?
  config.register_javascript "active_admin.js" if Rails.root.join("app/assets/builds/active_admin.js").exist?

  # Standard ActiveAdmin Configuration
  config.site_title = "PermiePortal"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  config.localize_format = :long
end
