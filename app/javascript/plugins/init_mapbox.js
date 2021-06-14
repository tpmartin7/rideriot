import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
      
   
      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        var el = document.createElement('div');
        el.className = 'marker';
        new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      });
      
     fitMapToMarkers(map, markers);
      
      var canvas = map.getCanvasContainer();
      const urlMarkers = markers.map((item) => { return `${item.lng},${item.lat}`}).join(';')
      console.log(urlMarkers);

       var url = 'https://api.mapbox.com/directions/v5/mapbox/cycling/' + urlMarkers + '?steps=true&geometries=geojson&access_token=' + mapboxgl.accessToken;
       console.log('hello')
    
       fetch(url)
       .then(response => response.json())
       .then((data) => {
       
          var data = data.routes[0];

          data.legs.forEach((leg, legIndex) => {

            leg.steps.forEach((step, index) => {
             
              var route = step.geometry.coordinates.map((coord) => {
                
                  return coord;
  
              });

              map.addSource(`leg${legIndex}step${index}`, {
                'type': 'geojson',
                'data': {
                  'type': 'Feature',
                  'properties': {},
                  'geometry': {
                    'type': 'LineString',
                    'coordinates': route
                  }
                }
              });

              map.addLayer({
                'id': `leg${legIndex}step${index}`,
                'type': 'line',
                'source': `leg${legIndex}step${index}`,
                'layout': {
                  'line-join': 'round',
                  'line-cap': 'round'
                },
                'paint': {
                  'line-color': '#5857D5',
                  'line-width': 8
                }
              });
            });
        });
    });
  } 
 };

export { initMapbox };
