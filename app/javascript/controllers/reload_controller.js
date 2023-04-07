import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  pageFullReload() {
    window.location.reload()
  }
}
