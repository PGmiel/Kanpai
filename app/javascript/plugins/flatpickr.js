import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput: true,
    allowInput: true,
  });
}

export { initFlatpickr };
