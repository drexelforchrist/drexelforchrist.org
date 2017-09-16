


var geocoder;
var map;
var drexelLatLong;
var bounds;

var doMap = function () {
    var colors = {
        background: '#ffffff',
        primary: '#8800a1', // dark
        tertiary: '#b800d9', // mid
        secondary: '#d11cf1', // light
        text: '#222222'
    };


    var styles = [
        {
            featureType: "landscape",
            stylers: [
                { color: colors.background }
            ]
        }, {
            featureType: "road",
            elementType: "labels.text.fill",
            stylers: [
                { color: colors.text }
            ]
        }, {
            featureType: "road",
            elementType: "labels.text.stroke",
            stylers: [
                { color: colors.background }
            ]
        }, {
            featureType: "road",
            elementType: "geometry.fill",
            stylers: [
                { color: colors.primary }
            ]
        }, {
            featureType: "road",
            elementType: "geometry.stroke",
            stylers: [
                { color: colors.secondary }
            ]
        }, {
            featureType: "water",
            stylers: [
                { color: colors.text }
            ]
        }, {
            featureType: "poi", //points of interest
            stylers: [
                { visibility: 'off' }
            ]
        }, {
            featureType: "transit", //points of interest
            stylers: [
                { visibility: 'off' }
            ]
        }, {
            featureType: "administrative", //points of interest
            stylers: [
                { visibility: 'off' }
            ]
        }
    ];

    drexelLatLong = new google.maps.LatLng(39.954, -75.188);
    bounds = new google.maps.LatLngBounds(drexelLatLong);

    var mapOptions = {
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: styles,
        center: drexelLatLong,
        disableDefaultUI: true
    };

    var mapBox = document.getElementById('churchMap');
    map = new google.maps.Map(mapBox, mapOptions);


    var marker = new google.maps.Marker({
        position: drexelLatLong,
        map: map,
        title: "Drexel University",
        icon: "http://sexy.drexelforchrist.org:8000/DrexelForChrist/ideas/xsl/static/application/church/drexel-icon.png"
    });

//        addChurch('Antioch of Calvary Chapel, 4721 Chestnut Street, Philadelphia Pa', '1');

    //window.console.log('1  Antioch of Calvary Chapel', '');
    addChurch('Antioch of Calvary Chapel, 4721 Chestnut Street, Philadelphia, Pa', '1');
    //window.console.log('2  Covenant Community Church', '');
    addChurch('Covenant Community Church, 4115 Baltimore Avenue, Philadelphia, PA', '2');
    //window.console.log('3  Covenant Fellowship Church', '');
    addChurch('Covenant Fellowship Church, 1 Fellowship Drive, Glen Mills, PA', '3');
    //window.console.log('4  Enon Tabernacle Baptist Church (East)', '');
    addChurch('Enon Tabernacle Baptist Church (East), 2800 West Cheltenham Ave., Philadelphia, PA', '4');
    //window.console.log('5  Enon Tabernacle Baptist Church (West)', '');
    addChurch('Enon Tabernacle Baptist Church (West), 230 West Coulter St., Philadelphia, PA', '5');
    //window.console.log('6  Epic Church', '');
    addChurch('Epic Church, 480 S. Broad Street, Philadelphia, PA', '6');
    //window.console.log('7  Grace Covenant Church (GCC)', '');
    addChurch('Grace Covenant Church (GCC), 3400 Walnut St, Philadelphia, PA', '7');
    //window.console.log('8  Liberti Church Center City', '');
    addChurch('Liberti Church Center City, 123 S. 17th Street, Philadelphia, PA', '8');
    //window.console.log('9  Philadelphia Mission Baptist Church (PMBC)', '');
    addChurch('Philadelphia Mission Baptist Church (PMBC), 3400 Spruce St, Philadelphia, PA', '9');
    //window.console.log('10  Tenth Presbyterian Church', '');
    addChurch('Tenth Presbyterian Church, 1700 Spruce, Philadelphia', '10');
    //window.console.log('11  University City Chinese Christian Church (UCCCC)', '');
    addChurch('University City Chinese Christian Church (UCCCC), 4501 Walnut Street, Philadelphia, PA 19139', '11');

};

geocoder = new google.maps.Geocoder();




function addChurch(address,lbl) {
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            //window.console.info(results[0]);
            if (google.maps.geometry.spherical.computeDistanceBetween(drexelLatLong, results[0].geometry.location) < (3219*40)) { // 2 miles *40
                var marker = new google.maps.Marker({
                    map: map,
                    text: lbl.toString(),
                    icon: "%%host:static%%/application/church/church-icon.png",
                    visible: false,
                    position: results[0].geometry.location,
                    zIndex: 40
                });
                var label = new Label({
                    map: map
                });
                label.bindTo('position', marker, 'position');
                label.bindTo('text', marker, 'text');
                bounds.extend(new google.maps.LatLng(results[0].geometry.location.k, results[0].geometry.location.B));
//                        map.fitBounds(bounds);
            } else {
                window.console.log('outside radius');
            }
        } else {
            window.console.warn("Geocode for " + address + " was not successful for the following reason: " + status);
        }
    });
}



// Define the overlay, derived from google.maps.OverlayView
function Label(opt_options) {
    // Initialization
    this.setValues(opt_options);

    // Label specific
    var span = this.span_ = document.createElement('span');
    span.style.cssText = 'position: relative; ' +
        'left: -50%;' +
        'top: -20px;' +
        'z-index:30;' +
        'min-height:29px; ' +
        'display: block ' +
        'min-width:20px;' +
        'white-space: nowrap; ' +
        'padding: 0; ' +
        'background-image: url("http://sexy.drexelforchrist.org:8000/DrexelforChrist/ideas/xsl/static/application/church/church-icon.png");' +
        'color: white; ' +
        'font-weight: bold; ' +
        'font-size:11px; ' +
        '-webkit-transform: translateZ(100px);';

    var div = this.div_ = document.createElement('div');
    div.appendChild(span);
    div.style.cssText = 'position: absolute; display: none';
};
Label.prototype = new google.maps.OverlayView;

// Implement onAdd
Label.prototype.onAdd = function() {
    var pane = this.getPanes().overlayLayer;
    pane.appendChild(this.div_);

    // Ensures the label is redrawn if the text or position is changed.
    var me = this;
    this.listeners_ = [
        google.maps.event.addListener(this, 'position_changed',
            function() { me.draw(); }),
        google.maps.event.addListener(this, 'text_changed',
            function() { me.draw(); })
    ];
};

// Implement onRemove
Label.prototype.onRemove = function() {
    this.div_.parentNode.removeChild(this.div_);

    // Label is removed from the map, stop updating its position/text.
    for (var i = 0, I = this.listeners_.length; i < I; ++i) {
        google.maps.event.removeListener(this.listeners_[i]);
    }
};

// Implement draw
Label.prototype.draw = function () {
    var projection = this.getProjection();
    var position = projection.fromLatLngToDivPixel(this.get('position'));

    var div = this.div_;
    div.style.left = position.x + 'px';
    div.style.top = position.y + 'px';
    div.style.display = 'block';


    var span = this.span_;

    span.innerHTML = this.get('text').toString();
    span.style.display = 'block';
    span.style.width = '20px';
    span.style.height = '29px';
    span.style.textAlign = 'center';
    span.style.lineHeight = '38px';
    span.style.verticalAlign = 'bottom';
    span.style.backgroundImage = 'url(http://sexy.drexelforchrist.org:8000/DrexelForChrist/ideas/xsl/static/application/church/church-icon.png)';
};


