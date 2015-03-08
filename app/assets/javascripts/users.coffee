# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".i-content").focus ->
    $(".i-content").val("")
    $(".i-content").css("color", "#555555")
    $('.i-content').simplyCountable(counter: '#hoot-counter')
