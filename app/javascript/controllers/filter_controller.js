// app/javascript/controllers/filter_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];  // Define the targets in your view

  connect() {
    console.log("Filter controller connected");
  }

  submit(event) {
    // Prevent default form submission and trigger Turbo submission
    event.preventDefault();
    this.formTarget.requestSubmit();
  }
}
