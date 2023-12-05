import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    onTelegramAuth = async (user) => {
        const response = await fetch("/signin", {
            method: "POST",
            credentials: 'same-origin',
            headers: {
                'X-CSRF_Token': document.head.querySelector("meta[name=csrf-token]")?.content,
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify({
                user: user
            })
        })
        if (response.status === 200) {
            window.Turbo.visit("/profile/", { frame: "main" })
        }
        console.log(response)
    }

    save = () => {
        alert("Sended")
    }

    connect() {
        window.onTelegramAuth = this.onTelegramAuth
    }
}
