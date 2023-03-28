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
    const floor0 = this.mapFloorsTargets.find((target) => target.id === "map-floor0");
    const planExisting = floor0.querySelector("#map-plan-Existing");
    sessionStorage.setItem("mapPlan", "plan-Existing");
    planExisting.classList.remove("d-none");

    $(function() {
      let isDragging = false;
      let currentX;
      let currentY;
      let initialX;
      let initialY;
      let xOffset = 0;
      let yOffset = 0;

      $('.draggable').mousedown(function(e) {
        initialX = e.clientX - xOffset;
        initialY = e.clientY - yOffset;

        if (e.target === $('.draggable')[0]) {
          isDragging = true;
        }
      });

      $('.parent').mousemove(function(e) {
        if (isDragging) {
          e.preventDefault();

          currentX = e.clientX - initialX;
          currentY = e.clientY - initialY;

          xOffset = currentX;
          yOffset = currentY;

          $('.draggable').css('left', `${currentX}px`);
          $('.draggable').css('top', `${currentY}px`);
        }
      });

      $('.parent').mouseup(function(e) {
        isDragging = false;
      });
    });
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
