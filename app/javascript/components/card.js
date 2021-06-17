const bookingConfirm = () => {
  const bookingButtons = document.querySelectorAll(".booking-submit").forEach((bookingButton) =>{
    bookingButton.addEventListener("ajax:success", (event) => {
      const [_data, _status, xhr] = event.detail;
      bookingButton.insertAdjacentHTML("beforeend", xhr.responseText);
    });
    bookingButton.addEventListener("ajax:error", () => {
      bookingButton.insertAdjacentHTML("beforeend", "<p>ERROR</p>");
    });
  })
};

// let modalBtn = document.getbookingButtonById("modal-btn")
// let modal = document.querySelector(".modal")
// let closeBtn = document.querySelector(".close-btn")
// modalBtn.onclick = function(){
//   modal.style.display = "block"
// }
// closeBtn.onclick = function(){
//   modal.style.display = "none"
// }
// window.onclick = function(e){
//   if(e.target == modal){
//     modal.style.display = "none"
//   }
// }

export{bookingConfirm}
