// app/javascript/application.js

// Import Turbo and Stimulus (as specified in importmap.rb)
import "@hotwired/turbo-rails";  // For Turbo (SPA-like navigation)
import "controllers";             // Automatically loads Stimulus controllers
import Rails from "@rails/ujs";    // For Rails UJS (form handling, etc.)
import * as ActiveStorage from "@rails/activestorage"; // For file uploads
import "channels";                // For ActionCable WebSockets

// Your custom JavaScript modules
import "auto_filter";  // Your custom auto-filtering script

// Initialize Rails utilities
Rails.start();               // Starts Rails UJS
ActiveStorage.start();       // Starts ActiveStorage for file uploads
Turbo.start();               // Starts Turbo for faster navigation

// Optional debugging
console.log("Application.js loaded and all modules initialized.");
