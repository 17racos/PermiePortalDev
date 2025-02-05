FROM ruby:3.3.6-bullseye

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl
# Keep Node.js 18, but force npm 10.x (not 11)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@10

# Verify Node.js and npm versions
RUN node -v && npm -v

# Install Yarn (Optional)
RUN npm install -g yarn

# Copy application code
COPY . .

# ✅ Clean npm cache and remove old dependencies
RUN rm -rf node_modules package-lock.json && npm cache clean --force

# Install Node dependencies
RUN npm install --force

# Install TailwindCSS and PostCSS dependencies
RUN npm install --save-dev tailwindcss postcss autoprefixer

# Ensure TailwindCSS is initialized
RUN [ -f tailwind.config.js ] || npx tailwindcss init -p

# Ensure assets directory exists before compiling Tailwind
RUN mkdir -p app/assets/builds

# Ensure correct Tailwind input file
RUN test -f app/assets/stylesheets/application.tailwind.css || echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > app/assets/stylesheets/application.tailwind.css

# ✅ Build TailwindCSS (use --postcss flag to avoid errors)
RUN npx tailwindcss -i app/assets/stylesheets/application.tailwind.css -o app/assets/builds/tailwind.css --minify --postcss

# ✅ Install gems
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs=4 --retry=3

# Expose port
EXPOSE 3000

# Start the application
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b '0.0.0.0' -e production"]
