# Builder Stage
FROM ruby:3.3.6-bullseye AS builder

WORKDIR /app

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
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4 --retry=3

COPY . ./

# Set environment variables explicitly for build-time
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Precompile assets
RUN echo "SECRET_KEY_BASE=${SECRET_KEY_BASE}"
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Final Stage
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Copy precompiled assets and installed gems from builder
COPY --from=builder /app /app
EXPOSE 5000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5000"]
