# First stage: build assets
FROM ruby:3.3.4-bullseye AS builder

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

# Install gems
RUN bundle install

# Precompile assets using the Node.js version of Tailwind CSS
RUN npx tailwindcss -i ./app/assets/stylesheets/application.css -o ./app/assets/builds/application.css --minify && \
    bundle exec rake assets:precompile

# Second stage: runtime
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Copy built application
COPY --from=builder /app .

# Expose port and start the application
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
