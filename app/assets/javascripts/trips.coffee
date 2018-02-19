# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initializeLocations = ->
  input = document.getElementById('trip_location')
  if input
    new (google.maps.places.Autocomplete)(input)
  return

google.maps.event.addDomListener window, 'load', initializeLocations

$(document).ready(initializeLocations)
$(document).on('turbolinks:load', initializeLocations)
