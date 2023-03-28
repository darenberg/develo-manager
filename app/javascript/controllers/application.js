import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
//= require jquery
//= require jquery_ujs.
//= require turbolinks
//= require_tree .
export { application }
