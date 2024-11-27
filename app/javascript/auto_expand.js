document.addEventListener("input", (event) => {
    if (event.target.classList.contains("auto-expand")) {
      const textarea = event.target;
      textarea.style.height = "auto"; // Reset the height
      textarea.style.height = textarea.scrollHeight + "px"; // Set it to fit content
    }
  });
  