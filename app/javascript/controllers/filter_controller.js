import { Controller } from "stimulus"
import { useDebounce } from "stimulus-use"

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    useDebounce(this, { wait: 500 })
  }

  @debounce
  submit() {
    this.formTarget.submit()
  }
}

