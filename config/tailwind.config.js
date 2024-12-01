module.exports = {
  content: [
    './app/views/**/*.{html.erb,html.haml,html.slim}', // Include all view templates
    './app/helpers/**/*.rb',                          // Include Rails helper files
    './app/javascript/**/*.js',                       // Include JavaScript files
    './app/assets/stylesheets/**/*.css',              // Include CSS files
    './app/assets/javascripts/**/*.js',               // Include JS files from assets
  ],
  theme: {
    extend: {
      height: {
        'screen-minus-header': 'calc(100vh - 64px)',  // Subtract typical header height
      },
      colors: {
        green: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          800: '#166534',
          900: '#14532d',
        },
      },
    },
  },
  plugins: [],
};

