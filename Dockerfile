# Use an official Ruby image as the base
FROM ruby:3.3.6

# Install necessary packages
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  ruby-dev \
  libffi-dev \
  nodejs \
  postgresql-client \
  libsass-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  libreadline-dev \
  imagemagick \
  tzdata \
  libyaml-dev \
  npm \
  pkg-config \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Set the working directory
WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . ./


# Precompile assets for production (optional for development)
# Uncomment for production:
# RUN RAILS_ENV=production bin/rails assets:precompile

# Expose the port on which the Rails server will run
EXPOSE 3000

# Run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
