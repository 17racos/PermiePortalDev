source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify Ruby version
ruby "3.3.6"

# Rails framework
gem "rails", "~> 7.2.2.1"

# Database adapter for PostgreSQL
gem "pg", "~> 1.5"

gem 'date', '< 3.4.0'

# Puma web server
gem "puma", "~> 6.5"

# JavaScript & Frontend tools
gem "cssbundling-rails"  # ✅ Required for Tailwind/PostCSS
gem "turbo-rails"
gem "stimulus-rails"

#Asset Pipline
gem "sprockets-rails", "~> 3.5"

# SASS for Rails asset pipeline
gem "sass-rails", "~> 6.0"
gem "sassc-rails", "~> 2.1.2"

# Dependencies required for SASS
gem "sassc", "~> 2.4.0"
gem "tilt", "~> 2.6.0"
gem "ffi", "~> 1.17.1"


# JSON API builder
gem "jbuilder"

# Authentication
gem "devise"

# SEO Friendly Titles
gem 'friendly_id', '~> 5.4.2'

# Time zone data for Windows and similar platforms
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Boot performance improvements
gem "bootsnap", require: false

# ✅ Optional: Redis for caching & ActionCable (real-time updates)
gem "redis", "~> 5.0" if ENV['USE_REDIS'] == 'true'

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end



