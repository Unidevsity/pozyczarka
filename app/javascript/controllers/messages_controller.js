import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  connect() {
    const container = document.querySelector("#messages")
    container.scrollTop = container.scrollHeight
  }
}
