import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["mapFloors", "drag", "floorButton", "stageBtn"]

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
    // this.addDarkColorToFirstButtonAndPlan();

    }

    // addDarkColorToFirstButtonAndPlan() {
    //   this.floorButtonTargets.forEach((floor) => {
    //     if (floor.id == "map-floor0") {
    //       floor.classList.remove("floor-btn")
    //       floor.classList.add("orange-btn-darker")
    //     }
    //   });
    //   this.stageBtnTargets.forEach((stage) => {
    //     if (stage.id == "plan-Existing") {
    //       stage.classList.remove("plan-btn")
    //       stage.classList.add("plan-btn-darker")
    //     }
    //   });
    // }

    hideAllPlans() {
      this.mapFloorsTargets.forEach((floor) => {
        floor.querySelectorAll("[id*='map-plan']").forEach((plan) => {
          plan.classList.add("d-none");
        });
      });
    }

    resetFloorButtonsColors() {
      this.floorButtonTargets.forEach((floor) => {
        floor.classList.add("floor-btn")
        floor.classList.remove("orange-btn-darker")
      });
    }


    resetStageButtonsColors() {
      this.stageBtnTargets.forEach((stage) => {
        console.log(stage);
        stage.classList.add("plan-btn")
        stage.classList.remove("plan-btn-darker")
      });
    }

    changeFloor(event) {
      const floor = this.mapFloorsTargets.find((target) => target.id === `map-${event.target.id}`);
      const planExisting = floor.querySelector(`#map-${sessionStorage.getItem("mapPlan")}`);
      this.hideAllPlans();
      this.resetFloorButtonsColors();
      event.target.classList.remove("floor-btn")
      event.target.classList.add("orange-btn-darker")
      planExisting.classList.remove("d-none");
      sessionStorage.setItem("mapFloor", event.target.id);
    }


    changePlan(event) {
      const currentFloor = this.mapFloorsTargets.find((target) => target.id === `map-${sessionStorage.getItem("mapFloor")}`);
      const plan = currentFloor.querySelector(`#map-${event.target.id}`);
      this.hideAllPlans();
      this.resetStageButtonsColors();
      event.target.classList.remove("plan-btn")
      event.target.classList.add("plan-btn-darker")
      plan.classList.remove("d-none");
      sessionStorage.setItem("mapPlan", event.target.id);
    }

    deleteFloor(event) {
      const currentFloor = this.mapFloorsTargets.find((target) => target.id === `map-${sessionStorage.getItem("mapFloor")}`);
    }
}
