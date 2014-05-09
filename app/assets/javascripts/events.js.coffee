# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder


  # override method
  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'yellow') #to customize
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

    # add @bind_infowindow() for < 2.1

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"




  #override create_marker method
  
#then standard use
@buildMap = (markers)->
  handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} }

handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
  markers = handler.addMarkers(markers)
  handler.bounds.extendWith(markers)
  handler.fitMapToBounds()


