import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["mapFloors", "drag"]

  // <script>
  //   $(document).ready(function() {
  //     $('.draggable').draggable();
  //   });
  // </script>

  connect() {
    console.log("HELLO THIS IS CONNECTED!!!");

  }

  displayDotTasks(e) {
    // fetch to the project show to retrieve the tasks of this dot
    e.preventDefault();
    console.log("hola");
    const url = `${e.target.action}?dot_id=${e.target.querySelector("input").value}`
    fetch(url, { headers: {"Accept": "text/plain"} })
      .then(response => response.text())
      .then((data) => {
        this.buttonTarget.outerHTML = data

      })
  }

    hideAllPlans() {
      this.mapFloorsTargets.forEach((floor) => {
        floor.querySelectorAll("[id*='map-plan']").forEach((plan) => {
          plan.classList.add("d-none");
        });
      });
    }


    changeFloor(event) {
      console.log(this.mapFloorsTargets);
      const floor = this.mapFloorsTargets.find((target) => target.id === `map-${event.target.id}`);
      const planExisting = floor.querySelector(`#map-${sessionStorage.getItem("mapPlan")}`);
      this.hideAllPlans();
      planExisting.classList.remove("d-none");
      sessionStorage.setItem("mapFloor", event.target.id);
    }


    changePlan(event) {
      const currentFloor = this.mapFloorsTargets.find((target) => target.id === `map-${sessionStorage.getItem("mapFloor")}`);
      const plan = currentFloor.querySelector(`#map-${event.target.id}`);
      this.hideAllPlans();
      plan.classList.remove("d-none");
      sessionStorage.setItem("mapPlan", event.target.id);
    }

    deleteFloor(event) {
      const currentFloor = this.mapFloorsTargets.find((target) => target.id === `map-${sessionStorage.getItem("mapFloor")}`);
    }



}
