document.addEventListener("turbo:load", () => {
  const filterForm = document.querySelector("#plant-filter-form"); // Use the correct ID of your form
  const filterInputs = document.querySelectorAll(".filter-checkbox");

  if (filterForm && filterInputs.length > 0) {
    filterInputs.forEach((input) => {
      input.addEventListener("change", () => {
        filterForm.requestSubmit(); // Triggers form submission
      });
    });
  }
});

