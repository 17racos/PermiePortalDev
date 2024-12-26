FROM ruby:3.3.4-bullseye AS builder

WORKDIR /app

# Install dependencies and latest LTS Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update -qq && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    nodejs \
    npm \
    curl && \
    npm install -g yarn

# Install Tailwind CLI
RUN npm install -g tailwindcss && \
    ln -s "$(npm bin -g)/tailwindcss" /usr/local/bin/tailwindcss

# Ensure npm global binaries are in PATH
ENV PATH="/usr/local/lib/node_modules/.bin:$PATH"

# Copy application code
COPY . .

# Configure bundler
RUN bundle config set force_ruby_platform true
RUN bundle lock --add-platform x86_64-linux
RUN bundle install

# Precompile assets
RUN bundle exec rake assets:clean assets:precompile

# Runtime stage
FROM ruby:3.3.6-bullseye

WORKDIR /app
COPY --from=builder /app .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
