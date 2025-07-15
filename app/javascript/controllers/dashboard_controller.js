import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mobileMenu", "mobilePanel", "mobileCloseContainer", "dropdown"]
  static values = { 
    mobileOpen: Boolean,
    dropdownStates: Object
  }

  connect() {
    this.dropdownStatesValue = {}
    this.setupDashboard()
  }

  setupDashboard() {
    // Setup mobile menu functionality
    this.setupMobileMenu()
    
    // Setup dropdown menus
    this.setupDropdowns()
    
    // Setup click outside to close dropdowns
    this.setupClickOutside()
  }

  setupMobileMenu() {
    const openButton = document.querySelector('[data-dashboard-mobile-open]')
    const closeButton = document.querySelector('[data-dashboard-mobile-close]')
    const backdrop = document.querySelector('[data-dashboard-mobile-backdrop]')
    
    if (openButton) {
      openButton.addEventListener('click', () => this.openMobileMenu())
    }
    
    if (closeButton) {
      closeButton.addEventListener('click', () => this.closeMobileMenu())
    }
    
    if (backdrop) {
      backdrop.addEventListener('click', () => this.closeMobileMenu())
    }
    
    // Close on Escape key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && this.mobileOpenValue) {
        this.closeMobileMenu()
      }
    })
  }

  setupDropdowns() {
    const dropdownButtons = document.querySelectorAll('[data-dropdown-button]')
    
    dropdownButtons.forEach(button => {
      const menuId = button.getAttribute('data-dropdown-button')
      button.addEventListener('click', (e) => {
        e.stopPropagation()
        this.toggleDropdown(menuId)
      })
    })
  }

  setupClickOutside() {
    document.addEventListener('click', (e) => {
      // Close all dropdowns if clicking outside
      const isDropdownClick = e.target.closest('[data-dropdown-button]') || 
                             e.target.closest('[data-dropdown-menu]')
      
      if (!isDropdownClick) {
        this.closeAllDropdowns()
      }
    })
  }

  openMobileMenu() {
    const mobileMenu = document.querySelector('[data-dashboard-mobile-menu]')
    const backdrop = document.querySelector('[data-dashboard-mobile-backdrop]')
    const panel = document.querySelector('[data-dashboard-mobile-panel]')
    const closeContainer = document.querySelector('[data-dashboard-mobile-close-container]')
    
    if (mobileMenu) {
      // Show the mobile menu
      mobileMenu.classList.remove('hidden')
      this.mobileOpenValue = true
      document.body.style.overflow = 'hidden'
      
      // Animate backdrop
      setTimeout(() => {
        if (backdrop) {
          backdrop.classList.remove('opacity-0')
          backdrop.classList.add('opacity-100')
        }
      }, 10)
      
      // Animate panel sliding in
      setTimeout(() => {
        if (panel) {
          panel.classList.remove('-translate-x-full')
          panel.classList.add('translate-x-0')
        }
      }, 10)
      
      // Show close button
      setTimeout(() => {
        if (closeContainer) {
          closeContainer.classList.remove('opacity-0')
          closeContainer.classList.add('opacity-100')
        }
      }, 150)
    }
  }

  closeMobileMenu() {
    const mobileMenu = document.querySelector('[data-dashboard-mobile-menu]')
    const backdrop = document.querySelector('[data-dashboard-mobile-backdrop]')
    const panel = document.querySelector('[data-dashboard-mobile-panel]')
    const closeContainer = document.querySelector('[data-dashboard-mobile-close-container]')
    
    if (mobileMenu && this.mobileOpenValue) {
      // Hide close button first
      if (closeContainer) {
        closeContainer.classList.remove('opacity-100')
        closeContainer.classList.add('opacity-0')
      }
      
      // Animate panel sliding out
      if (panel) {
        panel.classList.remove('translate-x-0')
        panel.classList.add('-translate-x-full')
      }
      
      // Animate backdrop
      if (backdrop) {
        backdrop.classList.remove('opacity-100')
        backdrop.classList.add('opacity-0')
      }
      
      // Hide the mobile menu after animation
      setTimeout(() => {
        mobileMenu.classList.add('hidden')
        this.mobileOpenValue = false
        document.body.style.overflow = ''
      }, 300)
    }
  }

  toggleDropdown(menuId) {
    const isOpen = this.dropdownStatesValue[menuId] || false
    
    if (isOpen) {
      this.closeDropdown(menuId)
    } else {
      // Close all other dropdowns first
      this.closeAllDropdowns()
      this.openDropdown(menuId)
    }
  }

  openDropdown(menuId) {
    const menu = document.querySelector(`[data-dropdown-menu="${menuId}"]`)
    const button = document.querySelector(`[data-dropdown-button="${menuId}"]`)
    
    if (menu && button) {
      // Update button state
      button.setAttribute('aria-expanded', 'true')
      
      // Show and animate menu
      menu.classList.remove('hidden')
      
      // Force reflow
      menu.offsetHeight
      
      // Animate in
      setTimeout(() => {
        menu.classList.remove('opacity-0', 'scale-95')
        menu.classList.add('opacity-100', 'scale-100')
      }, 10)
      
      // Update state
      this.dropdownStatesValue = {
        ...this.dropdownStatesValue,
        [menuId]: true
      }
    }
  }

  closeDropdown(menuId) {
    const menu = document.querySelector(`[data-dropdown-menu="${menuId}"]`)
    const button = document.querySelector(`[data-dropdown-button="${menuId}"]`)
    
    if (menu && button) {
      // Update button state
      button.setAttribute('aria-expanded', 'false')
      
      // Animate out
      menu.classList.remove('opacity-100', 'scale-100')
      menu.classList.add('opacity-0', 'scale-95')
      
      // Hide after animation
      setTimeout(() => {
        menu.classList.add('hidden')
      }, 75)
      
      // Update state
      this.dropdownStatesValue = {
        ...this.dropdownStatesValue,
        [menuId]: false
      }
    }
  }

  closeAllDropdowns() {
    Object.keys(this.dropdownStatesValue).forEach(menuId => {
      if (this.dropdownStatesValue[menuId]) {
        this.closeDropdown(menuId)
      }
    })
  }

  disconnect() {
    // Cleanup when controller is removed
    document.body.style.overflow = ''
    this.closeAllDropdowns()
  }
}
