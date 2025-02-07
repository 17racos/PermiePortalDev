# Use official Ruby image
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl

# Install Node.js 18 and force npm 10 (not 11)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@10 yarn

# Verify Node.js and npm versions
RUN node -v && npm -v

# Copy application code
COPY . .

# ✅ Remove old node_modules and install dependencies
RUN rm -rf node_modules yarn.lock && yarn install --check-files

# ✅ Install TailwindCSS & PostCSS dependencies
RUN yarn add --dev tailwindcss postcss autoprefixer

# ✅ Ensure TailwindCSS is initialized
RUN [ -f tailwind.config.js ] || npx tailwindcss init -p

# ✅ Ensure assets directory exists
RUN mkdir -p app/assets/builds

# ✅ Ensure correct Tailwind input file
RUN test -f app/assets/stylesheets/application.tailwind.css || echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > app/assets/stylesheets/application.tailwind.css

# ✅ Build TailwindCSS
RUN npx tailwindcss -i app/assets/stylesheets/application.tailwind.css -o public/builds/tailwind.css --minify --postcss

# ✅ Install Gems
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3

# ✅ Expose port 3000 for development
EXPOSE 3000

# ✅ Start the Rails application
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]
