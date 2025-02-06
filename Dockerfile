# Use official Ruby image
FROM ruby:3.3.6-bullseye

WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl

# Install Node.js 18 and npm 10 (Heroku uses Node.js for asset compilation)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@10 yarn

# Copy application code
COPY . .

# ✅ Install only production dependencies (omit dev dependencies)
RUN rm -rf node_modules && npm cache clean --force
RUN npm install --omit=dev  # ✅ Fix: Replace `npm ci` with `npm install --omit=dev`

# ✅ Install TailwindCSS & PostCSS dependencies
RUN npm install --save-dev tailwindcss postcss autoprefixer

# ✅ Ensure TailwindCSS is initialized
RUN [ -f tailwind.config.js ] || npx tailwindcss init -p

# ✅ Ensure the correct Tailwind input file exists
RUN test -f app/assets/stylesheets/application.tailwind.css || echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > app/assets/stylesheets/application.tailwind.css

# ✅ Build TailwindCSS (ensure output is in `public/assets/` for Heroku)
RUN npx tailwindcss -i app/assets/stylesheets/application.tailwind.css -o public/assets/tailwind.css --minify --postcss

# ✅ Install Gems
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3 --deployment

# ✅ Start the Rails server (THIS LINE WAS MISSING)
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p $PORT -e production"]
