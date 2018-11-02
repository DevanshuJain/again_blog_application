# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'turbolinks:load', ->
  $('.edit_link').click ->
    $.ajax
      type: 'GET'
      url: $(this).data('url')
    return
  return
