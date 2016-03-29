myLatLng =
  lat: 47.860803
  lng: 35.0992256

@initMap = ->
  map = new (google.maps.Map)($('#map')[0],
    center: myLatLng
    zoom: 10)
  marker = new (google.maps.Marker)(
    position: myLatLng
    map: map)
  return