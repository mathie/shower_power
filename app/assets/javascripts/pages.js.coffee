# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  new Tangle document.getElementById("example"),
    initialize: ->
      this.cookies = 4
      this.caloriesPerCookie = 50
    update: ->
      this.calories = this.cookies * this.caloriesPerCookie
