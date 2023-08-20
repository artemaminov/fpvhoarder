import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "citiesDataList" ]

  initialize() {
    this.url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address";
    this.token = "69126327748d3f5d2d58fcde459f1f3a4891e1cc";

    this.options = {
        method: "POST",
        mode: "cors",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token " + this.token
        }
    }

    this.getCityByIp()
  }

  async getClientIpAddress() {
    const serviceUrl = "http://api.ipify.org/"
    const response = await fetch(serviceUrl)
    return await response.text()
  }

  async getCityByIp() {
    const clientIpAddress = await this.getClientIpAddress()
    const url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/iplocate/address?ip=";

    const options = {
        method: "GET",
        mode: "cors",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Token " + this.token
        }
    }

    console.log("Client ip ", clientIpAddress)
    fetch(url + clientIpAddress, options)
      .then(response => response.json())
      .then(result => this.addDataOption(result.location.data.city))
      .catch(error => console.log("error", error))
  }

  clearDataList() {
    while (this.citiesDataListTarget.firstChild) {
      this.citiesDataListTarget.removeChild(this.citiesDataListTarget.firstChild)
    }
  }

  addDataOption(data) {
    let option = document.createElement("option")
    option.value = data
    this.citiesDataListTarget.appendChild(option)
  }

  generateDataListOptions(data) {
    this.clearDataList()
    const count = data.length
    const citiesArrya = []
    for (const entry of data) {
      let city = entry.data.city
      if (!citiesArrya.includes(city) && (city != null)) {
        citiesArrya.push(city)
        this.addDataOption(city)
      }
      console.log(city)
    }
  }

  request(event) {
    const value = event.target.value
    if (value.length > 0) {
      this.options.body = JSON.stringify({query: value})
      fetch(this.url, this.options)
        .then(response => response.json())
        .then(result => this.generateDataListOptions(result.suggestions))
        .catch(error => console.log("error", error))
    }
  }
}
