var map;
function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
      'callback=initialize';
  document.body.appendChild(script);
  
  var mapcontext = document.getElementById("multimapsearch").getAttribute("mapcontext");
  if(mapcontext === "Closestpoint"){
  	renderLocations();
  }
  else {
  	document.getElementById("singlemapsearch").onclick = function () { 
	  	centerMap();
	  };
  }
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
    document.getElementById("maplatitude").value = lat;
    document.getElementById("maplongitude").value = lng;
  });
  
  
  google.maps.event.addListener(marker, 'click', function() {
	var zoom = map.getZoom();
	zoom++;
    map.setZoom(zoom);
    map.setCenter(marker.getPosition());
  });
}

function centerMap() {
 	
 		var address = $('#txtMapAddress').val();
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
      
function renderLocations() {
      	
      	$.ajax({
        url: '/parking_spaces.json',
	  
	  success: function( resp ) {
	    var locations = []; 
	    locations = resp;
	    var map = new google.maps.Map(document.getElementById('map_canvas'), {
      zoom: 10,
      center: new google.maps.LatLng(-33.92, 151.25),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    
    for (i = 0; i < locations.length; i++) {
    	  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i].location_x, locations[i].location_y),
        map: map,
        icon: 'https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png'
      });
		
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
      	
        return function() 
        { 
              window.location ='/parking_spaces/'+  locations[i].id;   
        };
      })(marker, i));
    }
		  },
		  error: function( req, status, err ) {
		    console.log( 'something went wrong', status, err );
		  }
		});
      	
  }

function pointOnMap(x,y)  
{
	var myLatlng = new google.maps.LatLng(x,y);
	map.setCenter(myLatlng);
}   
     
window.onload = loadScript;