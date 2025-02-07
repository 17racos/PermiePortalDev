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
    npm install -g npm@10 yarn && \
    rm -rf /var/lib/apt/lists/*

# Verify Node.js, npm, and Yarn versions
RUN node -v && npm -v && yarn -v

# Copy application code
COPY . .

# ✅ Install JavaScript dependencies (Production Mode)
RUN yarn install --frozen-lockfile

# ✅ Build JavaScript assets using ESBuild (before asset precompilation)
RUN yarn build

# ✅ Install Gems in production mode
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3 --without development test

# ✅ Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* tmp/cache node_modules

# ✅ Expose port 3000 for production
EXPOSE 3000

# ✅ Start the Rails application in production mode
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -e production"]
