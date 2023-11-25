import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "stuffInputs", "categoryInput", "categoriesDataList", "nameInput", "priceInput" ]

    add() {
        this.stuffInputsTarget.after("eeg")
    }

}
