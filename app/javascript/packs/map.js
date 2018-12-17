import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

if (mapElement) {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });

  const markers = JSON.parse(mapElement.dataset.markers);

  markers.forEach((marker) => {

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';

    new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 })
      .setHTML(marker.infoWindow.content))
    .addTo(map);
  })

  if (markers.length === 0) {
   map.setZoom(1);
 } else if (markers.length === 1) {
   map.setZoom(14);
   map.setCenter([markers[0].lng, markers[0].lat]);
 } else {
   const bounds = new mapboxgl.LngLatBounds();
   markers.forEach((marker) => {
     bounds.extend([marker.lng, marker.lat]);
   });
   map.fitBounds(bounds, { duration: 700, padding: 75 })
 }

 map.addControl(new MapboxGeocoder({
  accessToken: mapboxgl.accessToken
}));
}

const addressInput = document.getElementById('place_address');

if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}
