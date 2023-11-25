import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "tgUserName", "tgUserId", "signIn" ]

    onTelegramAuth = async(user) => {
        this.tgUserNameTarget.value = user.username
        this.tgUserIdTarget.value = user.id
        this.signInTarget.disabled = false

        const respond = await fetch("/signin", {
            method: "POST",
            body: JSON.stringify({
                user_name: user.username,
                user_id: user.id
            })
        })

        console.log(respond)
    }

    save = () => {
        alert("Sended")
    }

    connect() {
        window.onTelegramAuth = this.onTelegramAuth
    }
}
