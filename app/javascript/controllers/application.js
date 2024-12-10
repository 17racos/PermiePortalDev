// Import necessary libraries
import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"  // Import Turbo for SPA-like navigation
import Rails from "@rails/ujs"                // Rails UJS for form submissions and other utilities

// Start the Stimulus application
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Initialize Rails UJS (Unobtrusive JavaScript) and Turbo
Rails.start()        // Start Rails UJS
Turbo.start()        // Start Turbo for faster navigation and updates

export { application }
