// app/javascript/controllers/dot_button_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  initialize() {
    this.dragStart = this.dragStart.bind(this);
    this.dragEnd = this.dragEnd.bind(this);
  }

  connect() {
    this.buttonTarget.addEventListener("dragstart", this.dragStart);
    this.buttonTarget.addEventListener("dragend", this.dragEnd);
  }

  dragStart(event) {
    const dotId = this.element.dataset.dotId;
    event.dataTransfer.setData("text/plain", dotId);
    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setDragImage(event.target, 0, 0);
  }

  dragEnd(event) {
    const dotId = event.dataTransfer.getData("text/plain");
    const dot = document.querySelector(`[data-dot-id="${dotId}"]`);
    const positionX = event.clientX - event.offsetX;
    const positionY = event.clientY - event.offsetY;

    dot.style.left = `${positionX}px`;
    dot.style.top = `${positionY}px`;

    Rails.ajax({
      url: `/plans/${dot.dataset.planId}/dots/${dotId}`,
      type: "PATCH",
      data: `dot[position_x]=${positionX}&dot[position_y]=${positionY}`,
    });
  }
}
