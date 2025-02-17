import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  submit() {
    // Submit the form when a filter input changes
    this.element.requestSubmit();
  }
}
