
////  Static-mode for header
var h;
document.addEventListener('scroll', function() {
    h = document.getElementById('header');
    var    hs = document.getElementById('headerSpacer'),

        scrollPos = window.scrollY,

        headH = parseInt(document.defaultView.getComputedStyle(hs, '').getPropertyValue('height')) +
            parseInt(document.defaultView.getComputedStyle(hs, '').getPropertyValue('margin-top')) +
            parseInt(document.defaultView.getComputedStyle(hs, '').getPropertyValue('margin-bottom')),

        navH = '26'; // KURTZ replace with a retrieved value.

    if (scrollPos === undefined) { // cuz internet explorer.
        scrollPos = window.pageYOffset;
    }

    //window.console.log("headH:", headH, "navH:", navH, "scrollPos", scrollPos);
    if (scrollPos >= (headH - navH) && !h.classList.contains('static')) {
        h.classList.add('static');
    } else if (scrollPos < (headH - navH) && h.classList.contains('static')) {
        h.classList.remove('static');
    }




});