import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector("#banner-typed-text")) {
  new Typed('#banner-typed-text', {
    strings: ["Book a restaurant", "Book a terrasse seat", "Find an empty table near you"],
    typeSpeed: 50,
    loop: true
  });
  }
}

export { loadDynamicBannerText };
