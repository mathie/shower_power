# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  new Tangle document.getElementById("showerCosts"),
    initialize: ->
      this.incomingWaterTemperature = 10
      this.heatedWaterTemperature = 62
      this.showerFlowRate = 18
      this.minutesInShower = 30
      this.boilerEfficiency = 0.9
      this.gasCost = 0.03246
      this.specificHeatOfWater = 4186 # joules per kg-degree-C
      this.joulesToKwh = 3600000
    update: ->
      this.waterTemperatureDelta = this.heatedWaterTemperature - this.incomingWaterTemperature
      this.litresOfWater = this.showerFlowRate * this.minutesInShower
      this.kgOfWater = this.litresOfWater
      this.totalKwh = (this.specificHeatOfWater * this.kgOfWater * this.waterTemperatureDelta / this.boilerEfficiency) / this.joulesToKwh
      this.totalCost = this.totalKwh * this.gasCost
      this.annualCost = this.totalCost * 365
