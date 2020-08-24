import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "output", "menu", "userOptions" ]

  connect() {
  }

  toggleMenu() {
    const classes = this.menuTarget.className
    const showClass = ' md:expandable-expand'
    const hideClass = ' md:expandable-collapse'
    if (classes.includes(hideClass)) {
      this.menuTarget.className = classes.replace(hideClass, showClass)
    } else {
      this.menuTarget.className = classes.replace(showClass, hideClass)
    }
  }

  toggleUserOptions() {
    const classes = this.userOptionsTarget.className
    const showClass = ' expandable-expand'
    const hideClass = ' expandable-collapse'
    if (classes.includes(hideClass)) {
      this.userOptionsTarget.className = classes.replace(hideClass, showClass)
    } else {
      this.userOptionsTarget.className = classes.replace(showClass, hideClass)
    }
  }

}
