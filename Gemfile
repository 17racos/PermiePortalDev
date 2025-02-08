source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify Ruby version
ruby "3.3.6"

# Rails framework, Asset Pipeline (Propshaft) & Storage
gem "rails", "~> 7.2.2.1"
gem "propshaft", "~> 1.1"

# Database adapter for PostgreSQL
gem "pg", "~> 1.5"

# S3 Storage (Bucketeer)
gem "bucketeer", "~> 0.1.0"
gem 'aws-sdk-s3'

# Web server
gem "puma", "~> 6.5"

# JSON API builder
gem "jbuilder"

# Turbo & Stimulus for Hotwire
gem "turbo-rails"
gem "stimulus-rails"

# Authentication
gem "devise"

# Full-text search in PostgreSQL
gem "pg_search"

# Admin Dashboard
gem "activeadmin"

# SEO Friendly URLs
gem 'friendly_id', '~> 5.4.2'

# Boot performance improvements
gem "bootsnap", require: false

# Development & Test
group :development, :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console"
end
