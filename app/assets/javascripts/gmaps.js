
function initAutocomplete() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.1039621, lng: -16.9651539},
    zoom: 3,
    fullscreenControl: false,
    streetViewControl: false,
    mapTypeControl: false,
    scrollwheel: false,
    gestureHandling: 'cooperative'
  });
  
  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  
  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });
  
  var infowindow = new google.maps.InfoWindow({
  });

  var markers = [];
   // [START region_getplaces]
   // Listen for the event fired when the user selects a prediction and retrieve
   // more details for that place.
    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();
  
      if (places.length == 0) {
        return;
      }
  
      // Clear out the old markers.
      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];
  
      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        // var icon = {
        //   url: place.icon,
        //   size: new google.maps.Size(71, 71),
        //   origin: new google.maps.Point(0, 0),
        //   anchor: new google.maps.Point(17, 34),
        //   scaledSize: new google.maps.Size(25, 25)
        // };
  
        // Create a marker for each place.
        var marker = new google.maps.Marker({
          map: map,
          // icon: icon,
          // title: place.name,
          animation: google.maps.Animation.DROP,
          position: place.geometry.location
        });
        
      markers.push(marker);
      
      var str1 = "Learn more about it @";
      var str2 = "Atlas Obscura";

      //Add info window click events here
      (function(marker, place){
        marker.addListener('click', function() {
          var content = "<h5>"+place.formatted_address+"</h5>";
          content += "<center>"+str1+"</center><br />";
          content += '<center><h6><a href="http://www.atlasobscura.com/search?utf8=✓&lat='+place.geometry.location.lat()+'&lng='+place.geometry.location.lng()+'" target="_blank">' +str2+ '</a></h6><center>';
          infowindow.setContent(content);
          infowindow.open(map, marker);
        });
      })(marker, place);

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
     
    });
    
    map.fitBounds(bounds);
    map.panBy(0,-160);
    
    google.maps.event.addListenerOnce(yourMap, 'bounds_changed', function(event) {
      if (this.getZoom() > 13) {
      this.setZoom(13);
      }
    });
    
  });

}
