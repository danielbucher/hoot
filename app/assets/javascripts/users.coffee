# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".i-content").focusin ->
    $(".i-content").val("")
    $(".i-content").css("color", "#555555")
    $('.i-content').simplyCountable(counter: '#hoot-counter')
  $(".i-content").focusout ->
    $(".i-content").val("What's going on?")
    $(".i-content").css("color", "#0084B4")
