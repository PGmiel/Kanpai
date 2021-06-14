import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Book a restaurant", "Book a terrasse seat", "Find an empty table near you"],
    typeSpeed: 54,
    loop: true
  });
}

export { loadDynamicBannerText };
