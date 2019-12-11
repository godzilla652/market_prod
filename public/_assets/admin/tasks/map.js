$(document).ready(function() {
  google.maps.event.addDomListener(window, 'load', initModal);
});

function initModal() {

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: new google.maps.LatLng(51.0501100, -114.0852900),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  var geocoder = new google.maps.Geocoder();

  var searchBox = new google.maps.places.SearchBox(document.getElementById('pac-input'));

  map.controls[google.maps.ControlPosition.TOP_CENTER].push(document.getElementById('pac-input'));

  google.maps.event.addListener(searchBox, 'places_changed', function() {
    searchBox.set('map', null);

    var places = searchBox.getPlaces();

    var bounds = new google.maps.LatLngBounds();
    var i, place;
    for (i = 0; place = places[i]; i++) {
      (function(place) {
        var marker = new google.maps.Marker({
          position: place.geometry.location
        });
        clearMarkers();
        markers.push(marker);

        marker.bindTo('map', searchBox, 'map');
        google.maps.event.addListener(marker, 'map_changed', function() {
          if (!this.getMap()) {
            this.unbindAll();
          }
        });
        bounds.extend(place.geometry.location);

        infowindow = new google.maps.InfoWindow();


        var latlng = marker.getPosition();
        geocoder.geocode({
          'location': latlng
        }, function(results, status) {
          if (status === 'OK') {
            if (results[0]) {
              infowindow.setContent('<div class="address-result-wrap">Address: <span class="address-result">' + results[0].formatted_address + '</span></div>' + '<button class="btn btn-primary" onclick="addAddress()">Add this address</button>');
              infowindow.open(map, marker);
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });


      }(place));

    }
    map.fitBounds(bounds);
    searchBox.set('map', map);
    map.setZoom(Math.min(map.getZoom(), 13));
  });

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng, map);
  });

} //init


function addAddress() {
  var addressResult = $('.address-result').text();

  $('#task_place_attributes_address').val(addressResult);
  $('#modal-map').hide();
}

var markers = [];

function placeMarker(latLng, map) {

  var marker = new google.maps.Marker({
    position: latLng,
    map: map
  });

  clearMarkers();
  markers.push(marker);


  map.panTo(latLng);
  var latlng = marker.getPosition();
  var geocoder = new google.maps.Geocoder();
  var infowindow = new google.maps.InfoWindow();

  geocoder.geocode({
    'location': latlng
  }, function(results, status) {
    if (status === 'OK') {
      if (results[0]) {
        infowindow.setContent('<div class="address-result-wrap">Address: <span class="address-result">' + results[0].formatted_address + '</span></div>' + '<button class="btn btn-primary" onclick="addAddress()">Add this address</button>');
        infowindow.open(map, marker);
      } else {
        window.alert('No results found');
      }
    } else {
      window.alert('Geocoder failed due to: ' + status);
    }
  });
}

function clearMarkers(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}
