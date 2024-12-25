# First stage: build assets
FROM ruby:3.3.4-slim AS builder

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs tzdata

# Copy application code
COPY . .

# Configure bundler
RUN bundle config set force_ruby_platform true

# Set a dummy secret key base for precompilation
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Precompile assets
RUN RAILS_ENV=production bundle install && bundle exec rake assets:precompile

# Second stage: runtime
FROM ruby:3.3.4-bullseye

WORKDIR /app

# Copy the built application
COPY --from=builder /app .

# Expose port
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
