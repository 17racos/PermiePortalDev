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
gem "jsbundling-rails"   # ✅ Required for ESBuild
gem "cssbundling-rails"  # ✅ Required for Tailwind/PostCSS
gem "turbo-rails"
gem "stimulus-rails"

# JSON API builder
gem "jbuilder"

# Authentication
gem "devise"

# Full-text search in PostgreSQL
gem "pg_search"

# CMS-like admin interface (✅ Ensure it works without Sprockets)
gem "activeadmin"

# SEO Friendly Titles
gem 'friendly_id', '~> 5.4.2'

# Time zone data for Windows and similar platforms
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Boot performance improvements
gem "bootsnap", require: false

# ✅ Optional: Redis for caching & ActionCable (real-time updates)
gem "redis", "~> 5.0" if ENV['USE_REDIS'] == 'true'

# ✅ Remove aws-sdk-s3 unless using S3 for ActiveStorage
gem "aws-sdk-s3", require: false if ENV['USE_S3'] == 'true'

# Groups for development and testing
group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end


gem "bucketeer", "~> 0.1.0"
