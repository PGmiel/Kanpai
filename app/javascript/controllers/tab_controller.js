import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tabs", "button" ]

  connect() {
    console.log('connected')
    
  }
  change_tab(event) {
    let divId = event.currentTarget.dataset.tabname
    console.log(this.tabsTargets)
    this.tabsTargets.forEach(element => { 
      element.classList.add('d-none')
      if(element.id === divId) {
        element.classList.remove('d-none')
      }
      
    });
    this.buttonTargets.forEach(element=> {
      console.log(element)
      element.classList.remove('active')
      if(element.dataset.tabname === event.currentTarget.dataset.tabname) {
        element.classList.add('active')
      }
    })
  }
}
