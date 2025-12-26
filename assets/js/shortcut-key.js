// Keep the search toggle showing only the icon on all platforms.
document.addEventListener("readystatechange", () => {
  if (document.readyState === "interactive") {
    const shortcutKeyElement = document.querySelector("#search-toggle .nav-link");
    if (shortcutKeyElement) {
      shortcutKeyElement.innerHTML = '<i class="ti ti-search"></i>';
    }
  }
});
