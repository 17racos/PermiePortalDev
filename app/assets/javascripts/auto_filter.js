// app/javascript/auto_filter.js
document.addEventListener('DOMContentLoaded', () => {
  const filterInput = document.getElementById('plant-filter-input');
  if (filterInput) {
    filterInput.addEventListener('input', function() {
      // Add your filtering logic here
      console.log('Filtering plants based on input:', this.value);
      // You could trigger a form submit, AJAX request, or other actions
    });
  }
});

