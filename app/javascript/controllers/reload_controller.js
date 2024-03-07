import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  pageFullReload() {
    console.log('pageFullReload method called');
    window.location.reload()
  }
}
