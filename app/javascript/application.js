import * as Turbo from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

// ✅ Auto-load controllers
const application = Application.start();
const context = require.context("./controllers", true, /_controller\.js$/);
context.keys().forEach((key) => application.load(context(key).default));

window.Stimulus = application;
console.log("ESBuild is now handling JavaScript!");

export { application };
