# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

Tangle.formats.showerFrequency = (value) ->
  switch value
    when 0
      return "every day"
    when 1
      return "every other day"
    when 2
      return "twice a week"
    when 3
      return "once a week"

Tangle.formats.pence = (value) ->
  (value * 100).round(3) + "p"

$ ->
  # FIXME Needs the hot/cold mix taken into account, in order to determine the
  # actual hot water consumed, maybe by virtue of the target temperature?
  #
  # FIXME: It would be kinda cool if we could work out the average gas cost,
  # based on the two-tiered rate we really have. For that, I'd need to capture
  # the two rates, the point at which it switches to the cheaper rate each
  # month, and the average monthly usage.
  #
  # FIXME: I should take water cost into account, too.
  new Tangle document.getElementById("showerCosts"),
    initialize: ->
      this.incomingWaterTemperature = 10
      this.heatedWaterTemperature   = 62
      this.showerFlowRate           = 18
      this.minutesInShower          = 30
      this.boilerEfficiency         = 0.9
      this.gasCost                  = 0.03246
      this.specificHeatOfWater      = 4186 # joules per kg-degree-C
      this.joulesToKwh              = 3600000
      this.showerFrequency          = 1
    update: ->
      this.waterTemperatureDelta = this.heatedWaterTemperature - this.incomingWaterTemperature
      this.litresOfWater         = this.showerFlowRate * this.minutesInShower
      this.kgOfWater             = this.litresOfWater
      this.totalKwh              = (this.specificHeatOfWater * this.kgOfWater * this.waterTemperatureDelta / this.boilerEfficiency) / this.joulesToKwh
      this.totalCost             = this.totalKwh * this.gasCost

      switch this.showerFrequency
        when 0
          this.showersPerYear = 365
          break
        when 1
          this.showersPerYear = 365 / 2
          break
        when 2
          this.showersPerYear = 365 * 2 / 7
          break
        when 3
          this.showersPerYear = 365 / 7

      this.annualCost = this.totalCost * this.showersPerYear
