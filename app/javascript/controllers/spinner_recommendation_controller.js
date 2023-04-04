import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spinner-recommendation"
export default class extends Controller {

  static targets = [ "spinner", "button" ]

  connect() {
    console.log("SpinnerRecommendationController connected");
  }

  showSpinner() {
    this.spinnerTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }
}
