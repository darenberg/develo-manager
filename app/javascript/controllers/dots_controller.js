import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dots"
export default class extends Controller {
  connect() {
    const stimulus = 'mousedown';

    // Get the button container
    const buttonContainer = document.getElementById('button-container');

    // Add event listeners to each button
    const buttons = document.querySelectorAll('.dotbutton');

    let startX, startY, isDragging = false;
    buttons.forEach(function(button) {
      button.addEventListener(stimulus, function(event) {
        isDragging = true;
        if (button.dataset.dotX == 0 && button.dataset.dotY == 0) {
          startX = event.clientX - button.offsetLeft;
          startY = event.clientY - button.offsetTop;
        } else {
          startX = event.clientX - button.dataset.dotX;
          startY = event.clientY - button.dataset.dotY;
        }
      });

    button.addEventListener('mousemove', function(event) {
      if (isDragging) {
        const containerRect = buttonContainer.getBoundingClientRect();
        const buttonRect = button.getBoundingClientRect();

        const maxX = containerRect.width - buttonRect.width;
        const maxY = containerRect.height - buttonRect.height;

        let newX = event.clientX - containerRect.left - (buttonRect.width / 2);
        let newY = event.clientY - containerRect.top - (buttonRect.height / 2);

        if (newX < 0) {
          newX = 0;
        } else if (newX > maxX) {
          newX = maxX;
        }

        if (newY < 0) {
          newY = 0;
        } else if (newY > maxY) {
          newY = maxY;
        }

        button.style.left = newX + 'px';
        button.style.top = newY + 'px';
      }
    });

    function csrfToken() {
      return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    }

    button.addEventListener('mouseup', function(event) {
        isDragging = false;
        // Get the dot's ID from the data-dot-id attribute
        const dotId = button.getAttribute('data-dot-id');
        const planId = document.querySelector('img').getAttribute('data-plan-id');
        // Get the dot's current position
        const dotRect = button.getBoundingClientRect();
        const containerRect = buttonContainer.getBoundingClientRect();
        const xPosition = (dotRect.left - containerRect.left) / containerRect.width;
        const yPosition = (dotRect.top - containerRect.top) / containerRect.height;
        // Make an AJAX request to update the dot's position
        fetch(`/plans/${planId}/dots/${dotId}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken()
          },
          body: JSON.stringify({
            x_position: xPosition,
            y_position: yPosition
          })
        });
      });
    });
  }
}
