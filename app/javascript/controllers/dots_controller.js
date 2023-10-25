import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dots"
export default class extends Controller {
  connect() {
    let isDragging = false;

    // Get the button container
    const buttonContainer = document.getElementById('button-container');

    // Add event listeners to each button
    const buttons = document.querySelectorAll('.dotbutton');

    buttons.forEach(function(button) {
      ['mousedown', 'touchstart'].forEach(event => {
        button.addEventListener(event, function(e) {
          isDragging = true;
          const clientX = e.clientX || (e.touches && e.touches[0].clientX);
          const clientY = e.clientY || (e.touches && e.touches[0].clientY);

          if (button.dataset.dotX == 0 && button.dataset.dotY == 0) {
            startX = clientX - button.offsetLeft;
            startY = clientY - button.offsetTop;
          } else {
            startX = clientX - button.dataset.dotX;
            startY = clientY - button.dataset.dotY;
          }
        });
      });

      ['mousemove', 'touchmove'].forEach(event => {
        button.addEventListener(event, function(e) {
          const clientX = e.clientX || (e.touches && e.touches[0].clientX);
          const clientY = e.clientY || (e.touches && e.touches[0].clientY);

          if (isDragging) {
            const containerRect = buttonContainer.getBoundingClientRect();
            const buttonRect = button.getBoundingClientRect();

            const maxX = containerRect.width - buttonRect.width;
            const maxY = containerRect.height - buttonRect.height;

            let newX = clientX - containerRect.left - (buttonRect.width / 2);
            let newY = clientY - containerRect.top - (buttonRect.height / 2);

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
      });

      function csrfToken() {
        return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
      }

      ['mouseup', 'touchend'].forEach(event => {
        button.addEventListener(event, function(e) {
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
