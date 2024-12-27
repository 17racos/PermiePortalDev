# Use a single-stage Dockerfile optimized for Heroku deployment
FROM ruby:3.3.6-bullseye

# Set environment variables
ENV PATH="/usr/local/bundle/bin:${PATH}" \
    RAILS_ENV=production \
    NODE_ENV=production

# Set working directory
WORKDIR /app

# Install system dependencies and Node.js
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libssl-dev \
  libffi-dev \
  libpq-dev \
  curl && \
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get update -qq && apt-get install -y nodejs && \
  npm install -g yarn && \
  npm install -g tailwindcss && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy application code
COPY . .

# Remove conflicting Tailwind CSS gem
RUN sed -i '/gem "tailwindcss-rails"/d' Gemfile Gemfile.lock

# Configure bundler and install gems
RUN bundle config set force_ruby_platform true && \
  bundle install --without development test && \
  bundle lock --add-platform x86_64-linux

# Precompile assets using Tailwind CSS
RUN npx tailwindcss -i ./app/assets/stylesheets/application.css -o ./public/assets/application.css --minify && \
  bundle exec rake assets:precompile

# Expose port and start the application
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
