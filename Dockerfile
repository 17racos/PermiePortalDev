FROM ruby:3.3.6-bullseye

# Set environment variables
ENV PATH="/usr/local/bundle/bin:/usr/local/bin:${PATH}" \
    RAILS_ENV=production \
    NODE_ENV=production

# Set working directory
WORKDIR /app

# Install system dependencies, Node.js, and npm
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Yarn and TailwindCSS globally
RUN npm install -g yarn tailwindcss

# Copy application code
COPY . .

# Remove conflicting Tailwind CSS gem
RUN sed -i '/gem "tailwindcss-rails"/d' Gemfile Gemfile.lock

# Configure bundler and install gems
RUN bundle config set force_ruby_platform true && \
    bundle install --without development test && \
    bundle lock --add-platform x86_64-linux

# Install node dependencies
RUN yarn install

# Precompile assets using TailwindCSS
RUN ./node_modules/.bin/tailwindcss -i ./app/assets/stylesheets/application.css -o ./public/assets/application.css --minify && \
    bundle exec rake assets:precompile

# Expose port and start the application
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
