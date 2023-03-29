import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-task"
export default class extends Controller {

  static targets = [ "form" ]

  connect() {
  }

  toggleForm() {
    this.formTarget.classList.toggle("d-none")
  }
}
