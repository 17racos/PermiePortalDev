import * as Turbo from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

console.log("ESBuild is now handling JavaScript!");

// ✅ Start Stimulus application
const application = Application.start();
window.Stimulus = application;

// ✅ Auto-load all controllers from `app/javascript/controllers`
eagerLoadControllersFrom(import.meta.glob("./controllers/**/*_controller.js"), application);

export { application };
