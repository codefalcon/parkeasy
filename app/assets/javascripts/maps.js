var map;
function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
      'callback=initialize';
  document.body.appendChild(script);
  document.getElementById("mapsearch").onclick = function () { 
  	centerMap();	
  };
}

function initialize() {

 geocoder = new google.maps.Geocoder();
  var mapOptions = {
    zoom: 18,
    center: new google.maps.LatLng(13.012802936299424, 80.20887225866318),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
  var directionsDisplay = new google.maps.DirectionsRenderer({ 'map': map }); 
  var marker = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    title: 'Click to zoom'
  });
  var marker; 
  google.maps.event.addListener(map, 'click', function(event) {
    // 3 seconds after the center of the map has changed, pan back to the
    // marker.
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
    var myLatlng = new google.maps.LatLng(lat,lng);
    marker.setMap(null);
    marker = new google.maps.Marker({
    position: myLatlng,
    icons: 'parkinggarage.png',
    title:"Click to Adjust Position "
    });
    marker.setMap(map);
    document.getElementById("movie_location").value = lat + "," + lng;
  });
  
  
  google.maps.event.addListener(marker, 'click', function() {
	var zoom = map.getZoom();
	zoom++;
    map.setZoom(zoom);
    map.setCenter(marker.getPosition());
  });
}

 function centerMap() {
        var address = document.getElementById('txtMapAddress').value;
        if (address.length > 0) {
          var geocoder = new google.maps.Geocoder();

          geocoder.geocode({ 'address': address }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              map.setCenter(results[0].geometry.location);
            } else {
              alert("Address not found" + status.toString());
            }
          });
        }
      }
      
window.onload = loadScript;