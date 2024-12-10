// Configure your import map in config/importmap.rb
// For more details on import maps in Rails, visit: https://github.com/rails/importmap-rails

// === Import Rails utilities ===
import "@hotwired/turbo-rails";  // Turbo for SPA-like navigation
import "controllers";             // Stimulus controllers (automatically loads controllers from 'app/javascript/controllers')
import Rails from "@rails/ujs";    // Rails utilities (e.g., form submission, links, etc.)
import * as ActiveStorage from "@rails/activestorage"; // For file uploads and storage
import "channels";                // ActionCable channels for WebSockets

// === Import custom JavaScript ===
import "auto_filter";  // Custom module for auto-submit filters (e.g., for plant filtering)

// === Initialize Rails utilities ===
Rails.start();               // Start Rails UJS (Unobtrusive JavaScript)
ActiveStorage.start();       // Start ActiveStorage (if you're using file uploads)
Turbo.start();               // Start Turbo (replaces Turbolinks for faster navigation and updates)

// === Optional Debugging ===
// Log a success message to confirm that all modules are loaded and initialized
console.log("Application.js successfully loaded and all modules initialized.");

