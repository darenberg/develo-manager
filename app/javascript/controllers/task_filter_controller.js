import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-filter"
export default class extends Controller {
  static targets = ["list"]


  static values = {
    projectId: String
  }

  connect() {
  }

  searchTags(e) {
    e.preventDefault()
    console.log( this.listTarget)
    console.log(this.projectIdValue);
    // console.log(e.target.querySelector("input").value)
    const url = `${e.target.action}?tag_name=${e.target.querySelector("input").value}`
    fetch(url, { headers: {"Accept": "text/plain"} })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
        // console.log(data)
      })
  }
}
