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
    curl \
    nodejs \
    yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle config set force_ruby_platform true && \
    bundle install --without development test && \
    bundle lock --add-platform x86_64-linux

# Copy the package.json and yarn.lock for Node dependencies
COPY package.json yarn.lock ./

# Install Node.js dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Precompile assets using TailwindCSS and Rails
RUN yarn build && \
    bundle exec rake assets:precompile

# Expose the port
EXPOSE 3000

# Start the application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
