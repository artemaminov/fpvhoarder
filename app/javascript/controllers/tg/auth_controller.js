import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "tgUserName", "tgUserId" ]

    onTelegramAuth = (user) => {
        this.tgUserNameTarget.value = user.username
        this.tgUserIdTarget.value = user.id
    }

    connect() {
        window.onTelegramAuth = this.onTelegramAuth
    }
}
