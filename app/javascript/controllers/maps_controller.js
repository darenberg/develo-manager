import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["mapFloors"]

  connect() {
    const floor0 = this.mapFloorsTargets.find((target) => target.id === "map-floor0");
    const planExisting = floor0.querySelector("#map-plan-Existing");
    planExisting.classList.remove("d-none");
  }

  hideAllPlans() {
    this.mapFloorsTargets.forEach((floor) => {
      floor.querySelectorAll("[id*='map-plan']").forEach((plan) => {
        plan.classList.add("d-none");
      });
    });
  }

  changeFloor(event) {
    const floor = this.mapFloorsTargets.find((target) => target.id === `map-${event.target.id}`);
    const planExisting = floor.querySelector("#map-plan-Existing");
    this.hideAllPlans();
    planExisting.classList.remove("d-none");
    sessionStorage.setItem("mapFloor", event.target.id);
  }

  changePlan(event) {
    const currentFloor = this.mapFloorsTargets.find((target) => target.id === `map-${sessionStorage.getItem("mapFloor")}`);
    const plan = currentFloor.querySelector(`#map-${event.target.id}`);
    this.hideAllPlans();
    plan.classList.remove("d-none");
  }
}
