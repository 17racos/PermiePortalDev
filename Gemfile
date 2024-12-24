source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify Ruby version
ruby "3.3.6"

# Rails framework
gem "rails", "~> 7.2"

# Asset pipeline
gem "sprockets-rails"

# Database adapter for PostgreSQL
gem "pg", "~> 1.5"

# Puma web server
gem "puma", "~> 6.5"

# JavaScript dependencies via import maps
gem "importmap-rails"

# Hotwire components
gem "turbo-rails"
gem "stimulus-rails"

# JSON API builder
gem "jbuilder"

# YAML parsing
gem "yaml"

# Ensure compatibility with certain environments
gem "msgpack", "~> 1.4.0"

# Authentication
gem "devise"

# Full-text search in PostgreSQL
gem "pg_search"

# CMS-like admin interface
gem "activeadmin"

# CSS preprocessor
gem "sassc", "~> 2.1.0"

# Tailwind CSS framework
gem "tailwindcss-rails"

# Time zone data for Windows and similar platforms
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Boot performance improvements
gem "bootsnap", require: false

# Groups for development and testing
group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw] # Debugging tools
end

group :development do
  gem "web-console" # Console on exceptions pages
end

group :test do
  gem "capybara"            # End-to-end testing
  gem "selenium-webdriver"  # Browser-based testing
end
