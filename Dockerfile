# Use an official Ruby image as the base
FROM ruby:3.2

# Install necessary packages
RUN apt-get update -qq && apt-get install -y build-essential nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Install gems in a separate step to utilize Docker cache more effectively
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV RAILS_ENV=development

# Run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

