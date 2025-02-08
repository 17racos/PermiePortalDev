# Use official Ruby image
FROM ruby:3.3.6-bullseye

# Set working directory
WORKDIR /app

# ✅ Install system dependencies first (optimizes caching)
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    git \
    nodejs \
    npm  # ✅ Ensure npm is installed

# ✅ Install Yarn manually (without Corepack)
RUN npm install -g yarn && yarn -v

# ✅ Copy only Gemfile first to optimize caching
COPY Gemfile Gemfile.lock ./

# ✅ Install Gems (without dev/test for production)
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3 --without development test

# ✅ Copy the rest of the application code
COPY . .

# ✅ Ensure Propshaft compiles assets properly
RUN RAILS_ENV=production bundle exec rails assets:precompile

# ✅ Clean up unnecessary files to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* tmp/cache node_modules

# ✅ Expose port 3000 for Heroku
EXPOSE 3000

# ✅ Start the Rails application
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p $PORT"]
