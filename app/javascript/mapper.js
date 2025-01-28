function parsePolygon(polygonString) {
    return polygonString
        .replace(/[(POLYGON)]/g,'')
        .split(',')
        .map(point => point.split(' ').map(Number));
}

function init_maps(){
    let map_containers = document.querySelectorAll('[id^="map-"]')
    if (!map_containers) return
    map_containers.forEach(container =>{
        let polygon = parsePolygon(container.dataset.polygon)
        console.log(container.id)
        let map = L.map(container.id).setView([polygon[0][0], polygon[0][1]], 10);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        L.polygon([polygon]).addTo(map);
    })

}


document.addEventListener("DOMContentLoaded", init_maps);
