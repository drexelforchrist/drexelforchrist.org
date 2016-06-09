
////  Static-mode for header
document.addEventListener('scroll', function() {
    var h = document.getElementById('header');
    var hs = document.getElementById('headerSpacer'),

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

function expandableToggle(evt) {
    var toggle = evt.target;
    var section = toggle.parentNode;
    if (section.classList.contains('expandable-closed')) {
        toggle.innerHTML = "-";
        section.classList.remove('expandable-closed')
    } else {
        toggle.innerHTML = "+";
        section.classList.add('expandable-closed')
    }
}

var expandableInit = function() {
    var exp, i;
    exp = document.getElementsByClassName('expandable-toggle');
    for (i = 0; i < exp.length; i++) {
        document.removeChild(exp[i]);
    }
    exp = document.getElementsByClassName('expandable');
    for (i = 0; i < exp.length; i++) {
        var toggle = document.createElement('a');
        toggle.innerHTML = (exp[i].classList.contains('expandable-closed') ? "+" : "-");
        toggle.classList.add("expandable-toggle");
        toggle.addEventListener('click', expandableToggle);
        exp[i].appendChild(toggle);
    }
};
window.addEventListener('load', expandableInit, false);