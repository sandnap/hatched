import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "output", "menu", "userOptions" ]

  connect() {
  }

  toggleMenu() {
    const classes = this.menuTarget.className
    const showClass = ' md:header-menu'
    const hideClass = ' md:header-menu-collapse'
    if (classes.includes(hideClass)) {
      this.menuTarget.className = classes.replace(hideClass, showClass)
    } else {
      this.menuTarget.className = classes.replace(showClass, hideClass)
    }
  }

  toggleUserOptions() {
    const classes = this.userOptionsTarget.className
    const showClass = ' user-options'
    const hideClass = ' user-options-collapse'
    if (classes.includes(hideClass)) {
      this.userOptionsTarget.className = classes.replace(hideClass, showClass)
    } else {
      this.userOptionsTarget.className = classes.replace(showClass, hideClass)
    }
  }

}
