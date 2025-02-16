# Use official Ruby image
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    git

# Install Node.js 18, npm 10, and Yarn (Required for ESBuild)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@10 yarn

# Verify Node.js, npm, and Yarn versions
RUN node -v && npm -v && yarn -v

# Copy application code
COPY . . 

# ✅ Remove old `node_modules` and reinstall dependencies
RUN rm -rf node_modules yarn.lock && yarn install --check-files

# ✅ Install Gems in production mode
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3 --without development test

# ✅ Precompile assets for production
RUN bundle exec rails assets:precompile

# ✅ Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# ✅ Expose port 3000 for production
EXPOSE 3000

# ✅ Start the Rails application in production mode
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -e production"]
