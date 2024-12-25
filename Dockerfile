# First stage: build assets
FROM ruby:3.3.4-slim AS asset_builder

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    tzdata

    # Copy application code
COPY . .

# Set a dummy secret key base for precompilation
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Precompile assets
RUN RAILS_ENV=production bundle install && bundle exec rake assets:precompile

# Second stage: runtime
FROM --platform=linux/amd64 ruby:3.3.4-bullseye AS runtime

WORKDIR /app

# Copy the built application from the asset_builder stage
COPY --from=asset_builder /app .

# Expose port
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
