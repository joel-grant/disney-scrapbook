// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Flash Message Functions - Disney Magic
window.dismissFlashMessage = function(element) {
  if (element) {
    element.classList.add('fade-out');
    setTimeout(() => {
      element.remove();
    }, 300);
  }
}

// Auto-dismiss flash messages
function setupAutoDissmissFlashMessages() {
  const flashMessages = document.querySelectorAll('.flash-message[data-auto-dismiss]');
  
  flashMessages.forEach(message => {
    const dismissTime = parseInt(message.dataset.autoDismiss) || 5000;
    
    setTimeout(() => {
      if (document.body.contains(message)) {
        dismissFlashMessage(message);
      }
    }, dismissTime);
  });
}

// Mobile menu functionality
function setupMobileMenu() {
  const mobileMenuButton = document.querySelector('[data-mobile-menu-button]');
  const mobileMenu = document.querySelector('[data-mobile-menu]');
  const mobileMenuClose = document.querySelector('[data-mobile-menu-close]');
  const mobileMenuBackdrop = document.querySelector('[data-mobile-menu-backdrop]');
  
  if (mobileMenuButton && mobileMenu) {
    // Remove any existing event listeners to prevent duplicates
    const newButton = mobileMenuButton.cloneNode(true);
    mobileMenuButton.parentNode.replaceChild(newButton, mobileMenuButton);
    
    // Open mobile menu
    newButton.addEventListener('click', function() {
      mobileMenu.classList.remove('hidden');
      document.body.style.overflow = 'hidden';
    });
    
    // Close mobile menu function
    function closeMobileMenu() {
      mobileMenu.classList.add('hidden');
      document.body.style.overflow = '';
    }
    
    // Close on X button click
    if (mobileMenuClose) {
      const newClose = mobileMenuClose.cloneNode(true);
      mobileMenuClose.parentNode.replaceChild(newClose, mobileMenuClose);
      newClose.addEventListener('click', closeMobileMenu);
    }
    
    // Close on backdrop click
    if (mobileMenuBackdrop) {
      const newBackdrop = mobileMenuBackdrop.cloneNode(true);
      mobileMenuBackdrop.parentNode.replaceChild(newBackdrop, mobileMenuBackdrop);
      newBackdrop.addEventListener('click', closeMobileMenu);
    }
    
    // Close on Escape key (remove previous listener first)
    document.removeEventListener('keydown', window.mobileMenuEscapeHandler);
    window.mobileMenuEscapeHandler = function(e) {
      if (e.key === 'Escape' && !mobileMenu.classList.contains('hidden')) {
        closeMobileMenu();
      }
    };
    document.addEventListener('keydown', window.mobileMenuEscapeHandler);
  }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
  setupMobileMenu();
  setupAutoDissmissFlashMessages();
});

// Reinitialize on Turbo navigation
document.addEventListener('turbo:load', function() {
  setupMobileMenu();
  setupAutoDissmissFlashMessages();
});
