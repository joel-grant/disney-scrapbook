// Dashboard Feature Tests
console.log('=== Dashboard Functionality Tests ===');

// Test function to be called after page loads
function runDashboardTests() {
  console.log('\n1. Testing Mobile Menu Elements...');
  
  // Check mobile menu elements
  const mobileOpenButton = document.querySelector('[data-dashboard-mobile-open]');
  const mobileCloseButton = document.querySelector('[data-dashboard-mobile-close]');
  const mobileMenu = document.querySelector('[data-dashboard-mobile-menu]');
  const backdrop = document.querySelector('[data-dashboard-mobile-backdrop]');
  const mobilePanel = document.querySelector('[data-dashboard-mobile-panel]');
  const closeContainer = document.querySelector('[data-dashboard-mobile-close-container]');
  
  console.log('Mobile Menu Elements Found:');
  console.log('  - Open Button:', !!mobileOpenButton);
  console.log('  - Close Button:', !!mobileCloseButton);
  console.log('  - Mobile Menu:', !!mobileMenu);
  console.log('  - Backdrop:', !!backdrop);
  console.log('  - Mobile Panel:', !!mobilePanel);
  console.log('  - Close Container:', !!closeContainer);
  
  console.log('\n2. Testing Dropdown Elements...');
  
  // Check dropdown elements
  const dropdownButtons = document.querySelectorAll('[data-dropdown-button]');
  const dropdownMenus = document.querySelectorAll('[data-dropdown-menu]');
  
  console.log('Dropdown Elements Found:');
  console.log('  - Dropdown Buttons:', dropdownButtons.length);
  console.log('  - Dropdown Menus:', dropdownMenus.length);
  
  // List each dropdown
  dropdownButtons.forEach((button, index) => {
    const menuId = button.getAttribute('data-dropdown-button');
    const menu = document.querySelector(`[data-dropdown-menu="${menuId}"]`);
    console.log(`  - Button ${index + 1}: ID="${menuId}", Menu Found: ${!!menu}`);
  });
  
  console.log('\n3. Testing Mobile Menu Functionality...');
  
  if (mobileOpenButton && mobileMenu) {
    console.log('  - Testing mobile menu open...');
    
    // Simulate opening mobile menu
    mobileOpenButton.click();
    
    setTimeout(() => {
      const isMenuVisible = !mobileMenu.classList.contains('hidden');
      const hasCorrectClasses = mobilePanel && mobilePanel.classList.contains('translate-x-0');
      
      console.log('  - Mobile menu visible:', isMenuVisible);
      console.log('  - Panel has correct classes:', hasCorrectClasses);
      
      if (mobileCloseButton) {
        console.log('  - Testing mobile menu close...');
        mobileCloseButton.click();
        
        setTimeout(() => {
          const isMenuHidden = mobileMenu.classList.contains('hidden');
          console.log('  - Mobile menu hidden:', isMenuHidden);
        }, 400);
      }
    }, 100);
  } else {
    console.log('  - Mobile menu elements not found, skipping test');
  }
  
  console.log('\n4. Testing Dropdown Functionality...');
  
  if (dropdownButtons.length > 0) {
    const firstButton = dropdownButtons[0];
    const menuId = firstButton.getAttribute('data-dropdown-button');
    const menu = document.querySelector(`[data-dropdown-menu="${menuId}"]`);
    
    if (menu) {
      console.log(`  - Testing dropdown "${menuId}" open...`);
      
      // Simulate dropdown open
      firstButton.click();
      
      setTimeout(() => {
        const isMenuVisible = !menu.classList.contains('hidden');
        const hasCorrectClasses = menu.classList.contains('opacity-100') && menu.classList.contains('scale-100');
        
        console.log('  - Dropdown visible:', isMenuVisible);
        console.log('  - Dropdown has correct classes:', hasCorrectClasses);
        
        // Test closing by clicking outside
        console.log('  - Testing dropdown close by clicking outside...');
        document.body.click();
        
        setTimeout(() => {
          const isMenuHidden = menu.classList.contains('hidden') || menu.classList.contains('opacity-0');
          console.log('  - Dropdown hidden after outside click:', isMenuHidden);
        }, 100);
      }, 100);
    }
  } else {
    console.log('  - No dropdown buttons found, skipping test');
  }
  
  console.log('\n=== Tests Complete ===');
}

// Export for use in browser console
window.runDashboardTests = runDashboardTests;

// Auto-run after a delay to let page settle
setTimeout(() => {
  if (document.querySelector('[data-dashboard-mobile-menu]')) {
    console.log('Dashboard detected, running tests...');
    runDashboardTests();
  }
}, 2000);
