import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// ✅ Auto-load all controllers inside app/javascript/controllers
eagerLoadControllersFrom(import.meta.globEager("./**/*_controller.js"), application)
