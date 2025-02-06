import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// ✅ Start Stimulus application
const application = Application.start()
window.Stimulus = application

// ✅ Auto-load all controllers from `app/javascript/controllers`
eagerLoadControllersFrom(import.meta.globEager("./controllers/**/*_controller.js"), application)

export { application }
