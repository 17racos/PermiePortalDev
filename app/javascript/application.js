// Configure your import map in config/importmap.rb
// Read more: https://github.com/rails/importmap-rails

// === Import Rails utilities ===
import "@hotwired/turbo-rails"; // Turbo for SPA-like navigation
import "controllers"; // Stimulus controllers
import Rails from "@rails/ujs"; // Rails utilities
import Turbolinks from "turbolinks"; // Turbolinks for faster navigation
import * as ActiveStorage from "@rails/activestorage"; // File uploads and storage
import "channels"; // ActionCable channels


// === Import custom JavaScript ===
import "auto_filter"; // Auto-submit filters for plant filtering

// === Initialize Rails utilities ===
Rails.start();
Turbolinks.start();
ActiveStorage.start();

// === Debugging (optional) ===
console.log("Application.js loaded successfully with all modules initialized.");

