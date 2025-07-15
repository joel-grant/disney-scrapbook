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
  setupDashboard();
});

// Reinitialize on Turbo navigation
document.addEventListener('turbo:load', function() {
  setupMobileMenu();
  setupAutoDissmissFlashMessages();
  setupDashboard();
});

// Dashboard functionality
function setupDashboard() {
  setupDashboardMobileMenu();
  setupDropdownMenus();
}

// Dashboard mobile menu functionality
function setupDashboardMobileMenu() {
  const openButton = document.querySelector('[data-dashboard-mobile-open]');
  const closeButton = document.querySelector('[data-dashboard-mobile-close]');
  const backdrop = document.querySelector('[data-dashboard-mobile-backdrop]');
  const mobileMenu = document.querySelector('[data-dashboard-mobile-menu]');
  
  if (!mobileMenu) return; // Not on dashboard page
  
  function openDashboardMobileMenu() {
    const panel = document.querySelector('[data-dashboard-mobile-panel]');
    const closeContainer = document.querySelector('[data-dashboard-mobile-close-container]');
    
    // Show the mobile menu
    mobileMenu.classList.remove('hidden');
    document.body.style.overflow = 'hidden';
    
    // Animate backdrop
    setTimeout(() => {
      if (backdrop) {
        backdrop.classList.remove('opacity-0');
        backdrop.classList.add('opacity-100');
      }
    }, 10);
    
    // Animate panel sliding in
    setTimeout(() => {
      if (panel) {
        panel.classList.remove('-translate-x-full');
        panel.classList.add('translate-x-0');
      }
    }, 10);
    
    // Show close button
    setTimeout(() => {
      if (closeContainer) {
        closeContainer.classList.remove('opacity-0');
        closeContainer.classList.add('opacity-100');
      }
    }, 150);
  }
  
  function closeDashboardMobileMenu() {
    const panel = document.querySelector('[data-dashboard-mobile-panel]');
    const closeContainer = document.querySelector('[data-dashboard-mobile-close-container]');
    
    // Hide close button first
    if (closeContainer) {
      closeContainer.classList.remove('opacity-100');
      closeContainer.classList.add('opacity-0');
    }
    
    // Animate panel sliding out
    if (panel) {
      panel.classList.remove('translate-x-0');
      panel.classList.add('-translate-x-full');
    }
    
    // Animate backdrop
    if (backdrop) {
      backdrop.classList.remove('opacity-100');
      backdrop.classList.add('opacity-0');
    }
    
    // Hide the mobile menu after animation
    setTimeout(() => {
      mobileMenu.classList.add('hidden');
      document.body.style.overflow = '';
    }, 300);
  }
  
  // Event listeners
  if (openButton) {
    openButton.addEventListener('click', openDashboardMobileMenu);
  }
  
  if (closeButton) {
    closeButton.addEventListener('click', closeDashboardMobileMenu);
  }
  
  if (backdrop) {
    backdrop.addEventListener('click', closeDashboardMobileMenu);
  }
  
  // Close on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && !mobileMenu.classList.contains('hidden')) {
      closeDashboardMobileMenu();
    }
  });
}

// Dropdown menus functionality
function setupDropdownMenus() {
  const dropdownButtons = document.querySelectorAll('[data-dropdown-button]');
  
  if (dropdownButtons.length === 0) return; // No dropdowns on this page
  
  // Close all dropdowns
  function closeAllDropdowns() {
    const dropdownMenus = document.querySelectorAll('[data-dropdown-menu]');
    dropdownMenus.forEach(menu => {
      const button = document.querySelector(`[data-dropdown-button="${menu.getAttribute('data-dropdown-menu')}"]`);
      if (button) {
        button.setAttribute('aria-expanded', 'false');
      }
      
      menu.classList.remove('opacity-100', 'scale-100');
      menu.classList.add('opacity-0', 'scale-95');
      
      setTimeout(() => {
        menu.classList.add('hidden');
      }, 75);
    });
  }
  
  // Toggle dropdown
  function toggleDropdown(menuId) {
    const menu = document.querySelector(`[data-dropdown-menu="${menuId}"]`);
    const button = document.querySelector(`[data-dropdown-button="${menuId}"]`);
    
    if (!menu || !button) return;
    
    const isOpen = !menu.classList.contains('hidden');
    
    if (isOpen) {
      // Close this dropdown
      button.setAttribute('aria-expanded', 'false');
      menu.classList.remove('opacity-100', 'scale-100');
      menu.classList.add('opacity-0', 'scale-95');
      
      setTimeout(() => {
        menu.classList.add('hidden');
      }, 75);
    } else {
      // Close all other dropdowns first
      closeAllDropdowns();
      
      // Open this dropdown
      button.setAttribute('aria-expanded', 'true');
      menu.classList.remove('hidden');
      
      // Force reflow
      menu.offsetHeight;
      
      // Animate in
      setTimeout(() => {
        menu.classList.remove('opacity-0', 'scale-95');
        menu.classList.add('opacity-100', 'scale-100');
      }, 10);
    }
  }
  
  // Add click listeners to dropdown buttons
  dropdownButtons.forEach(button => {
    const menuId = button.getAttribute('data-dropdown-button');
    button.addEventListener('click', function(e) {
      e.stopPropagation();
      toggleDropdown(menuId);
    });
  });
  
  // Close dropdowns when clicking outside
  document.addEventListener('click', function(e) {
    const isDropdownClick = e.target.closest('[data-dropdown-button]') || 
                           e.target.closest('[data-dropdown-menu]');
    
    if (!isDropdownClick) {
      closeAllDropdowns();
    }
  });
}
