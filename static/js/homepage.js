var parseXml;

if (typeof window.DOMParser != "undefined") {
    parseXml = function(xmlStr) {
        return ( new window.DOMParser() ).parseFromString(xmlStr, "text/xml");
    };
} else if (typeof window.ActiveXObject != "undefined" &&
    new window.ActiveXObject("Microsoft.XMLDOM")) {
    parseXml = function(xmlStr) {
        var xmlDoc = new window.ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(xmlStr);
        return xmlDoc;
    };
} else {
    throw new Error("No XML parser found");
}


/* START EVENT TILE STUFF */

function tileListener () {
    var xml = parseXml(this.responseText),
        tileItr = xml.evaluate("//softobject[@type='eventTile']", xml, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE),
        tile,
        container = document.getElementById('eventTileContainer');

    container.innerHTML = '';

    while (tile = tileItr.iterateNext()) {
        var evtN = xml.evaluate("softmember[@name='event']/event[@tense='future']", tile, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue;
        var imgUrl = xml.evaluate("softmember[@name='image']/img/@src", tile, null, XPathResult.ANY_UNORDERED_NODE_TYPE).singleNodeValue.textContent;
        var evt = {};

        evt.name = xml.evaluate('name', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent;
        evt.url = "//" + xml.evaluate('canonical', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent;
        evt.subtitle = xml.evaluate('subtitle', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent;
        evt.color = xml.evaluate('eventCalendar/address', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent;
        evt.where = xml.evaluate('location/name', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent.split(',')[0];
        evt.when = xml.evaluate('when/human', evtN, null, XPathResult.FIRST_ORDERED_NODE_TYPE).singleNodeValue.textContent.replace(/[\u22c5<>]/gim,"<br />");

        console.log(evt);

        var box = document.createElement('a'),
            div = document.createElement('div'),
            img = document.createElement('img'),
            span = document.createElement('span');
        box.className = "eventTile";
        box.href = evt.url;

        img.src = imgUrl;

        span.innerHTML += "<span>" + evt.name.toUpperCase() + "</span>";
        span.innerHTML += evt.when + "<br />";
        span.innerHTML += evt.where + "<br />";

        setBackgroundColor(box, evt.color);

        div.appendChild(span);
        box.appendChild(img);
        box.appendChild(div);
        container.appendChild(box);
    }
}


function setBackgroundColor(node, key) {
    switch(key) {
        case "church":
            node.style.backgroundColor = "rgb(136,0,161)";
            break;
        case "prayer":
            node.style.backgroundColor = "rgb(201,27,27)";
            break;
        case "training":
            node.style.backgroundColor = "rgb(206,98,25)";
            break;
        case "discipleship":
            node.style.backgroundColor = "rgb(239,168,30)";
            break;
        case "outreach":
            node.style.backgroundColor = "rgb(37,145,16)";
            break;
        default:
            node.style.backgroundColor = "rgb(44,130,197)";
    }
}

var oReq = new XMLHttpRequest();
oReq.addEventListener("load", tileListener);
oReq.open("GET", "/$eventTile.oml?event:tense=future");
oReq.send();

/* END EVENT TILE STUFF */