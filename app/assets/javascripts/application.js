// Import necessary dependencies
import { Turbo } from "@hotwired/turbo-rails";
import * as ActiveStorage from "@rails/activestorage";
import "controllers";  // Only if using Stimulus (via stimulus-rails)

// Start ActiveStorage if you're using file uploads
ActiveStorage.start();

// Log Turbo to check if it's working
console.log("Turbo is running:", Turbo);
