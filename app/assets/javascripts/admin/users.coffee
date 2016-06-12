# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

toggle_admin = (tag) ->
  console.log $(tag).parent()
  parent = $($(tag).parent()).parent()
  id = $(parent).children('.id')
  console.log $(id).html()
  $.post '/admin',
    id: $(id).html()


$(document).ready ->
  $('.user_admin').on 'change', (event) ->
    toggle_admin(event.target)