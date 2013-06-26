initialize = ()->
  # console.log window
  # options =
  #   zoom: 8
  #   center: new google.maps.LatLng(35.389155, 139.425729)
  #   mapTypeId: google.maps.MapTypeId.ROADMAP
  # map = new google.maps.Map(document.getElementById("map_canvas"), options)

# loadScript = ()->
#   script = document.createElement "script"
#   script.type = "text/javascript"
#   script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyCwgEbyuLpznYZgpX6pznLoJnLwfY_lXWo&sensor=true&callback=initialize"
#   document.body.appendChild script

window.onload = ->
  # initialize()
  console.log google
  options =
    zoom: 8
    center: new google.maps.LatLng(35.389155, 139.425729)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map(document.getElementById("map_canvas"), options)