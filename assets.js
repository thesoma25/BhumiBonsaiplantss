// Sound effects and 3D elements functionality

// Click sound effect function
function playClickSound() {
  const clickSound = new Audio();
  clickSound.src = 'https://assets.mixkit.co/active_storage/sfx/2568/2568-preview.mp3'; // Using a free sound effect URL
  clickSound.volume = 0.5; // Set volume to 50%
  clickSound.play();
}

// Add 3D effect to elements
function add3DEffect(element) {
  // Store original transform and transition properties
  const originalTransform = element.style.transform || '';
  const originalTransition = element.style.transition || '';
  const originalBoxShadow = element.style.boxShadow || '';
  
  // Add 3D effect styles
  element.style.transition = 'transform 0.2s ease, box-shadow 0.2s ease';
  element.style.transformStyle = 'preserve-3d';
  element.style.perspective = '1000px';
  
  // Add a class to mark this element as having 3D effects
  element.classList.add('has-3d-effect');
  
  // Mouse over effect - element pops up with 3D rotation
  element.addEventListener('mouseover', function(e) {
    // Calculate rotation based on mouse position relative to element center
    const rect = element.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    const mouseX = e.clientX;
    const mouseY = e.clientY;
    
    // Calculate rotation angles (limited to small values for subtle effect)
    const rotateY = ((mouseX - centerX) / (rect.width / 2)) * 5; // max 5 degrees
    const rotateX = ((centerY - mouseY) / (rect.height / 2)) * 5; // max 5 degrees
    
    element.style.transform = `${originalTransform} translateY(-5px) scale(1.02) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
    element.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.15), 0 0 15px rgba(140, 210, 121, 0.2)';
  });
  
  // Track mouse movement for dynamic 3D effect
  element.addEventListener('mousemove', function(e) {
    const rect = element.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    const mouseX = e.clientX;
    const mouseY = e.clientY;
    
    // Calculate rotation angles
    const rotateY = ((mouseX - centerX) / (rect.width / 2)) * 5; // max 5 degrees
    const rotateX = ((centerY - mouseY) / (rect.height / 2)) * 5; // max 5 degrees
    
    element.style.transform = `${originalTransform} translateY(-5px) scale(1.02) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
  });
  
  // Mouse out effect - element returns to normal
  element.addEventListener('mouseout', function() {
    element.style.transform = originalTransform;
    element.style.boxShadow = originalBoxShadow;
  });
  
  // Mouse down effect - element presses down with 3D effect
  element.addEventListener('mousedown', function() {
    element.style.transform = `${originalTransform} translateY(2px) scale(0.98) rotateX(2deg)`;
    element.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.1), 0 0 5px rgba(140, 210, 121, 0.2)';
    playClickSound(); // Play click sound on press
  });
  
  // Mouse up effect - element returns to hover state if still hovering
  element.addEventListener('mouseup', function(e) {
    const rect = element.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    const mouseX = e.clientX;
    const mouseY = e.clientY;
    
    // Calculate rotation angles
    const rotateY = ((mouseX - centerX) / (rect.width / 2)) * 5;
    const rotateX = ((centerY - mouseY) / (rect.height / 2)) * 5;
    
    element.style.transform = `${originalTransform} translateY(-5px) scale(1.02) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
    element.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.15), 0 0 15px rgba(140, 210, 121, 0.2)';
  });
}

// Initialize 3D effects and click sounds
function initialize3DEffects() {
  // Apply 3D effects to all buttons
  const buttons = document.querySelectorAll('button');
  buttons.forEach(button => {
    add3DEffect(button);
  });
  
  // Apply 3D effects to navigation links
  const navLinks = document.querySelectorAll('header a');
  navLinks.forEach(link => {
    add3DEffect(link);
  });
  
  // Apply 3D effects to product cards and images
  const productCards = document.querySelectorAll('.flex-col.gap-4, .flex-col.gap-3');
  productCards.forEach(card => {
    add3DEffect(card);
  });
  
  // Apply 3D effects to product images
  const productImages = document.querySelectorAll('[style*="background-image"]');
  productImages.forEach(image => {
    // Only apply to elements that are likely product images (based on aspect ratio)
    if (image.classList.contains('aspect-[3/4]') || 
        image.classList.contains('aspect-square') || 
        image.classList.contains('rounded-xl')) {
      add3DEffect(image);
    }
  });
  
  // Apply 3D effects to category tags and filter buttons
  const categoryTags = document.querySelectorAll('.rounded-full');
  categoryTags.forEach(tag => {
    add3DEffect(tag);
  });
  
  // Add click sound to all clickable elements that don't have 3D effects
  const clickableElements = document.querySelectorAll('a:not(.has-3d-effect), [onclick]:not(.has-3d-effect)');
  clickableElements.forEach(element => {
    if (!element.classList.contains('has-3d-effect')) {
      element.addEventListener('click', playClickSound);
    }
  });
  
  // Add click sound to document for elements created dynamically
  document.addEventListener('click', function(e) {
    // If the clicked element or its parent has a link or onclick attribute but no 3D effect
    let target = e.target;
    let found = false;
    
    // Check up to 3 levels of parent elements
    for (let i = 0; i < 3; i++) {
      if (!target) break;
      
      if ((target.tagName === 'A' || target.hasAttribute('onclick')) && 
          !target.classList.contains('has-3d-effect')) {
        found = true;
        break;
      }
      
      target = target.parentElement;
    }
    
    if (found) {
      playClickSound();
    }
  });
  
  // Add a subtle animation to the logo
  const logo = document.querySelector('header svg');
  if (logo) {
    logo.style.transition = 'transform 0.5s ease';
    logo.addEventListener('mouseover', function() {
      logo.style.transform = 'rotate(10deg) scale(1.1)';
    });
    logo.addEventListener('mouseout', function() {
      logo.style.transform = '';
    });
  }
}

// Run initialization when DOM is fully loaded
document.addEventListener('DOMContentLoaded', initialize3DEffects);