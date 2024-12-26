# First stage: build assets
FROM ruby:3.3.4-bullseye AS builder

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

# Install Tailwind CSS via npm
RUN npm install -g tailwindcss

# Ensure the PATH includes the global npm bin directory
ENV PATH="${PATH}:$(npm bin -g)"

# Copy application code
COPY . .

# Configure bundler and ensure platform compatibility
RUN bundle config set force_ruby_platform true
RUN bundle lock --add-platform x86_64-linux

# Install gems
RUN bundle install

# Precompile assets
RUN bundle exec rake assets:precompile

# Second stage: runtime
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Copy built application
COPY --from=builder /app .

# Expose port and start the application
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
