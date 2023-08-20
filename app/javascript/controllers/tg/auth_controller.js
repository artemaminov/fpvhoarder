import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "tgUser" ]

    onTelegramAuth = (user) => {
        console.log(this)
        this.tgUserTarget.innerText = 'Post as ' + user.first_name + ' ' + user.last_name + ' (' + user.id + (user.username ? ', @' + user.username : '') + ')'
    }

    connect() {
        window.onTelegramAuth = this.onTelegramAuth
    }
}
