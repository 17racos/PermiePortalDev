#!/bin/bash

echo "🚀 Removing TailwindCSS and old configurations..."

# Delete Tailwind config files
rm -f tailwind.config.js postcss.config.js

# Remove Tailwind from `package.json`
sed -i '/"tailwindcss"/d' package.json
sed -i '/"postcss"/d' package.json
sed -i '/"autoprefixer"/d' package.json

# Remove TailwindCSS files
rm -rf app/javascript/styles
rm -rf app/assets/stylesheets/tailwind.css
rm -rf app/assets/builds/tailwind.css

# Remove TailwindCSS from `application.html.erb`
find app/views/layouts/ -type f -name "*.erb" -exec sed -i '/tailwind/d' {} +

# Ensure Rails is handling CSS
touch app/assets/stylesheets/application.css
echo "@import 'application';" > app/assets/stylesheets/application.css

echo "✅ TailwindCSS cleanup complete!"
