import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Autocomplete controller connected");
  }
  static values = { projectId: Number }
  static targets = ["input", "results", "userId"]

  search(event) {
    const query = this.inputTarget.value;
    if (query.length < 2) { // Skip fetch for too short input
      this.resultsTarget.innerHTML = '';
      return;
    }

    // Replace the URL in the fetch call with the new endpoint

    fetch(`/projects/${this.projectIdValue}/project_users/autocomplete?query=${encodeURIComponent(query)}`)
      .then(response => response.json())
      .then(users => this.displayResults(users));

  }

  displayResults(users) {
    this.resultsTarget.innerHTML = users.map(user =>
      `<div class="autocomplete-item" data-user-id="${user.id}" data-action="click->autocomplete#selectUser">${user.email}</div>`
    ).join('');
  }

  selectUser(event) {
    const userId = event.currentTarget.dataset.userId;
    const userEmail = event.currentTarget.textContent;

    this.userIdTarget.value = userId; // Update the hidden field with the user ID
    this.inputTarget.value = userEmail; // Display selected user's email in input field

    this.resultsTarget.innerHTML = ''; // Clear the results after selection
  }
}
