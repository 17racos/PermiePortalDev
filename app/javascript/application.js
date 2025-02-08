// app/assets/javascript/application.js (or app/javascript/application.js if needed)
import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";
Turbo.start();
window.Stimulus = Application.start()
