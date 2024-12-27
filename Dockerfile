# First stage: build assets
FROM ruby:3.3.6-bullseye AS builder

# Set environment variables
ENV PATH="/usr/local/bundle/bin:${PATH}"

# Set working directory
WORKDIR /app

# Install dependencies and latest LTS Node.js
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libssl-dev \
  libffi-dev \
  libpq-dev \
  curl && \
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get update -qq && apt-get install -y nodejs && \
  npm install -g yarn

# Install Tailwind CSS via npm
RUN npm install -g tailwindcss

# Copy application code
COPY . .

# Remove tailwindcss-rails gem configuration to prevent conflict
RUN sed -i '/gem "tailwindcss-rails"/d' Gemfile Gemfile.lock

# Configure bundler and ensure platform compatibility
RUN bundle config set force_ruby_platform true
RUN bundle lock --add-platform x86_64-linux

# Install gems, excluding development and test groups
RUN bundle install --without development test

# Precompile assets using the Node.js version of Tailwind CSS
RUN npx tailwindcss -i ./app/assets/stylesheets/application.css -o ./public/assets/application.css --minify

# Precompile Rails assets
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Second stage: runtime
FROM ruby:3.3.6-bullseye

# Install Rails (if not already installed via Gemfile)
RUN gem install rails -v 7.2.2.1

# Set working directory
WORKDIR /app

# Copy built application from the builder stage
COPY --from=builder /app .

# Expose port and start the application
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
