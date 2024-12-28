# Use a single-stage Dockerfile optimized for Heroku deployment
FROM ruby:3.3.6-bullseye

# Set environment variables
ENV PATH="/usr/local/bundle/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" \
    RAILS_ENV=production \
    NODE_ENV=production \
    BUNDLE_WITHOUT="development:test" \
    BUNDLE_PATH="/usr/local/bundle"

# Set working directory
WORKDIR /app

# Install system dependencies and Node.js
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    curl \
    nodejs \
    yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install TailwindCSS globally via npm
RUN npm install -g tailwindcss

# Copy application code
COPY . .

# Remove conflicting Tailwind CSS gem (if applicable)
RUN sed -i '/gem "tailwindcss-rails"/d' Gemfile Gemfile.lock || true

# Configure bundler and install gems
RUN bundle config set force_ruby_platform false && \
    bundle lock --add-platform x86_64-linux && \
    bundle install

# Configure and build assets with TailwindCSS
RUN npx tailwindcss -i ./app/assets/stylesheets/application.css -o ./public/assets/application.css --minify && \
    bundle exec rake assets:precompile

# Expose the port used by Rails
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
