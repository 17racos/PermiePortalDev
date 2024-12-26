# First stage: build assets
FROM ruby:3.3.6-bullseye AS builder

WORKDIR /app

# Install dependencies and Yarn
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libssl-dev \
  libffi-dev \
  libpq-dev \
  nodejs \
  npm \
  curl && \
  npm install -g yarn

# Install Tailwind CSS via npm (more reliable across architectures)
RUN npm install -g tailwindcss

# Copy application code
COPY . .

# Configure bundler
RUN bundle config set force_ruby_platform true

# Install gems
RUN bundle install

# Precompile assets
RUN PATH=$(npm bin -g):$PATH bundle exec rake assets:precompile

# Second stage: runtime
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Copy built application
COPY --from=builder /app .

# Expose port and start the application
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
