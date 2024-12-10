import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  submit(event) {
    event.preventDefault()  // Prevent the default form submission
    this.formTarget.requestSubmit()  // Submit the form via Turbo (this triggers Turbo)
  }
}

