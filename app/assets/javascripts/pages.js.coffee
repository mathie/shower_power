# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  new Tangle document.getElementById("waterTemperature"),
    initialize: ->
      this.incomingWaterTemperature = 10
      this.heatedWaterTemperature = 62
    update: ->
      this.waterTemperatureDelta = this.heatedWaterTemperature - this.incomingWaterTemperature
