/*!
 * bib.ly
 * Bible reference shortener and popup linker
 * http://bib.ly/
 *
 * Copyright 2012, John Dyer (http://j.hn/)
 *
 * Scripture quotations marked "ESV" are taken from The Holy Bible, English Standard Version. 
 * Copyright �2001 by Crossway Bibles, a publishing ministry of Good News Publishers. Used by permission. 
 * All rights reserved. Text provided by the Crossway Bibles Web Service (http://www.gnpcb.org/esv/share/services/).
 *
 * NET Bible� copyright �1996-2006 by Biblical Studies Press, L.L.C. (http://bible.org/)
 *
 * For all other versions, this site uses the Biblia web services (http://biblia.com/) 
 * from Logos Bible Software (http://www.logos.com/)
 */

var bible = {};
(function () {
    var split = function (subject) {
        return subject.split(" ")
    },
    g = function (j, l) {
        var r = l.split(" "), k = [], i = null, m, v, n, s;
        if (j == 1)i = ["1", "I", "First"]; else if (j == 2)i = ["2", "II", "Second"]; else if (j == 3)i = ["3", "III", "Third"];
        m = 0;
        for (v = r.length; m < v; m++) {
            n = 0;
            for (s = i.length; n < s; n++) {
                k.push(i[n] + " " + r[m]);
                n === 0 && k.push(i[n] + r[m])
            }
        }
        k.unshift(i[0] + r[1]);
        k.unshift(i[0] + " " + r[0]);
        return k
    };
    bible.Books = [{
        names: split("Genesis Ge Gen"),
        verses: [31, 25, 24, 26, 32, 22, 24, 22, 29, 32, 32, 20, 18, 24, 21, 16, 27, 33, 38, 18, 34, 24, 20, 67, 34, 35, 46, 22, 35, 43, 55, 32, 20, 31, 29, 43, 36, 30, 23, 23, 57, 38, 34, 34, 28, 34, 31, 22, 33, 26]
    }, {
        names: split("Exodus Ex Exo Exod"),
        verses: [22, 25, 22, 31, 23, 30, 25, 32, 35, 29, 10, 51, 22, 31, 27, 36, 16, 27, 25, 26, 36, 31, 33, 18, 40, 37, 21, 43, 46, 38, 18, 35, 23, 35, 35, 38, 29, 31, 43, 38]
    }, {
        names: split("Leviticus Le Lev"),
        verses: [17, 16, 17, 35, 19, 30, 38, 36, 24, 20, 47, 8, 59, 57, 33, 34, 16, 30, 37, 27, 24, 33, 44, 23, 55, 46, 34]
    }, {
        names: split("Numbers Nu Num"),
        verses: [54, 34, 51, 49, 31, 27, 89, 26, 23, 36, 35, 16, 33, 45, 41, 50, 13, 32, 22, 29, 35, 41, 30, 25, 18, 65, 23, 31, 40, 16, 54, 42, 56, 29, 34, 13]
    }, {
        names: split("Deuteronomy Dt Deut Deu De"),
        verses: [46, 37, 29, 49, 33, 25, 26, 20, 29, 22, 32, 32, 18, 29, 23, 22, 20, 22, 21, 20, 23, 30, 25, 22, 19, 19, 26, 68, 29, 20, 30, 52, 29, 12]
    }, {
        names: split("Joshua Js Jos Jos Josh"),
        verses: [18, 24, 17, 24, 15, 27, 26, 35, 27, 43, 23, 24, 33, 15, 63, 10, 18, 28, 51, 9, 45, 34, 16, 33]
    }, {
        names: split("Judges Jg Jud Jdg Ju Jdgs Judg"),
        verses: [36, 23, 31, 24, 31, 40, 25, 35, 57, 18, 40, 15, 25, 20, 20, 31, 13, 31, 30, 48, 25]
    }, {
        names: split("Ruth Ru Rut"),
        verses: [22, 23, 18, 22]
    }, {
        names: g(1, "Samuel Sa Sam"),
        verses: [28, 36, 21, 22, 12, 21, 17, 22, 27, 27, 15, 25, 23, 52, 35, 23, 58, 30, 24, 42, 15, 23, 29, 22, 44, 25, 12, 25, 11, 31, 13]
    }, {
        names: g(2, "Samuel Sa Sam"),
        verses: [27, 32, 39, 12, 25, 23, 29, 18, 13, 19, 27, 31, 39, 33, 37, 23, 29, 33, 43, 26, 22, 51, 39, 25]
    }, {
        names: g(1, "Kings Ki King Kin Kngs"),
        verses: [53, 46, 28, 34, 18, 38, 51, 66, 28, 29, 43, 33, 34, 31, 34, 34, 24, 46, 21, 43, 29, 53]
    }, {
        names: g(2, "Kings Ki King Kin Kngs"),
        verses: [18, 25, 27, 44, 27, 33, 20, 29, 37, 36, 21, 21, 25, 29, 38, 20, 41, 37, 37, 21, 26, 20, 37, 20, 30]
    }, {
        names: g(1, "Chronicles Ch Chr"),
        verses: [54, 55, 24, 43, 26, 81, 40, 40, 44, 14, 47, 40, 14, 17, 29, 43, 27, 17, 19, 8, 30, 19, 32, 31, 31, 32, 34, 21, 30]
    }, {
        names: g(2, "Chronicles Ch Chr"),
        verses: [17, 18, 17, 22, 14, 42, 22, 18, 31, 19, 23, 16, 22, 15, 19, 14, 19, 34, 11, 37, 20, 12, 21, 27, 28, 23, 9, 27, 36, 27, 21, 33, 25, 33, 27, 23]
    }, {
        names: split("Ezra Ez Ezr"),
        verses: [11, 70, 13, 24, 17, 22, 28, 36, 15, 44]
    }, {
        names: split("Nehemiah Ne Neh Neh Ne"),
        verses: [11, 20, 32, 23, 19, 19, 73, 18, 38, 39, 36, 47, 31]
    }, {
        names: split("Esther Es Est Esth"),
        verses: [22, 23, 15, 17, 14, 14, 10, 17, 32, 3]
    }, {
        names: split("Job Jb Job"),
        verses: [22, 13, 26, 21, 27, 30, 21, 22, 35, 22, 20, 25, 28, 22, 35, 22, 16, 21, 29, 29, 34, 30, 17, 25, 6, 14, 23, 28, 25, 31, 40, 22, 33, 37, 16, 33, 24, 41, 30, 24, 34, 17]
    }, {
        names: split("Psalm Ps Psa Pss Psalms"),
        verses: [6, 12, 8, 8, 12, 10, 17, 9, 20, 18, 7, 8, 6, 7, 5, 11, 15, 50, 14, 9, 13, 31, 6, 10, 22, 12, 14, 9, 11, 12, 24, 11, 22, 22, 28, 12, 40, 22, 13, 17, 13, 11, 5, 26, 17, 11, 9, 14, 20, 23, 19, 9, 6, 7, 23, 13, 11, 11, 17, 12, 8, 12, 11, 10, 13, 20, 7, 35, 36, 5, 24, 20, 28, 23, 10, 12, 20, 72, 13, 19, 16, 8, 18, 12, 13, 17, 7, 18, 52, 17, 16, 15, 5, 23, 11, 13, 12, 9, 9, 5, 8, 28, 22, 35, 45, 48, 43, 13, 31, 7, 10, 10, 9, 8, 18, 19, 2, 29, 176, 7, 8, 9, 4, 8, 5, 6, 5, 6, 8, 8, 3, 18, 3, 3, 21, 26, 9, 8, 24, 13, 10, 7, 12, 15, 21, 10, 20, 14, 9, 6]
    }, {
        names: split("Proverbs Pr Prov Pro"),
        verses: [33, 22, 35, 27, 23, 35, 27, 36, 18, 32, 31, 28, 25, 35, 33, 33, 28, 24, 29, 30, 31, 29, 35, 34, 28, 28, 27, 28, 27, 33, 31]
    }, {
        names: split("Ecclesiastes Ec Ecc"),
        verses: [18, 26, 22, 16, 20, 12, 29, 17, 18, 20, 10, 14]
    }, {
        names: ["Song of Solomon", "SOS", "Song of Songs"],
        verses: [17, 17, 11, 16, 16, 13, 13, 14]
    }, {
        names: split("Isaiah Isa"),
        verses: [31, 22, 26, 6, 30, 13, 25, 22, 21, 34, 16, 6, 22, 32, 9, 14, 14, 7, 25, 6, 17, 25, 18, 23, 12, 21, 13, 29, 24, 33, 9, 20, 24, 17, 10, 22, 38, 22, 8, 31, 29, 25, 28, 28, 25, 13, 15, 22, 26, 11, 23, 15, 12, 17, 13, 12, 21, 14, 21, 22, 11, 12, 19, 12, 25, 24]
    }, {
        names: split("Jeremiah Je Jer"),
        verses: [19, 37, 25, 31, 31, 30, 34, 22, 26, 25, 23, 17, 27, 22, 21, 21, 27, 23, 15, 18, 14, 30, 40, 10, 38, 24, 22, 17, 32, 24, 40, 44, 26, 22, 19, 32, 21, 28, 18, 16, 18, 22, 13, 30, 5, 28, 7, 47, 39, 46, 64, 34]
    }, {
        names: split("Lamentations La Lam Lament"),
        verses: [22, 22, 66, 22, 22]
    }, {
        names: split("Ezekiel Ek Ezek Eze"),
        verses: [28, 10, 27, 17, 17, 14, 27, 18, 11, 22, 25, 28, 23, 23, 8, 63, 24, 32, 14, 49, 32, 31, 49, 27, 17, 21, 36, 26, 21, 26, 18, 32, 33, 31, 15, 38, 28, 23, 29, 49, 26, 20, 27, 31, 25, 24, 23, 35]
    }, {
        names: split("Daniel Da Dan Dl Dnl"),
        verses: [21, 49, 30, 37, 31, 28, 28, 27, 27, 21, 45, 13]
    }, {
        names: split("Hosea Ho Hos"),
        verses: [11, 23, 5, 19, 15, 11, 16, 14, 17, 15, 12, 14, 16, 9]
    }, {
        names: split("Joel Jl Joel Joe"),
        verses: [20, 32, 21]
    }, {
        names: split("Amos Am Amos Amo"),
        verses: [15, 16, 15, 13, 27, 14, 17, 14, 15]
    }, {
        names: split("Obadiah Ob Oba Obd Odbh"),
        verses: [21]
    }, {
        names: split("Jonah Jh Jon Jnh"),
        verses: [17, 10, 10, 11]
    }, {
        names: split("Micah Mi Mic"),
        verses: [16, 13, 12, 13, 15, 16, 20]
    }, {
        names: split("Nahum Na Nah Na"),
        verses: [15, 13, 19]
    }, {
        names: split("Habakkuk Hb Hab Hk Habk"),
        verses: [17, 20, 19]
    }, {
        names: split("Zephaniah Zp Zep Zeph Ze"),
        verses: [18, 15, 20]
    }, {
        names: split("Haggai Ha Hag Hagg"),
        verses: [15, 23]
    }, {
        names: split("Zechariah Zc Zech Zec"),
        verses: [21, 13, 10, 14, 11, 15, 14, 23, 17, 12, 17, 14, 9, 21]
    }, {
        names: split("Malachi Ml Mal Mlc"),
        verses: [14, 17, 18, 6]
    }, {
        names: split("Matthew Mt Matt Mat"),
        verses: [25, 23, 17, 25, 48, 34, 29, 34, 38, 42, 30, 50, 58, 36, 39, 28, 27, 35, 30, 34, 46, 46, 39, 51, 46, 75, 66, 20]
    }, {
        names: split("Mark Mk Mrk"),
        verses: [45, 28, 35, 41, 43, 56, 37, 38, 50, 52, 33, 44, 37, 72, 47, 20]
    }, {
        names: split("Luke Lk Luk Lu"),
        verses: [80, 52, 38, 44, 39, 49, 50, 56, 62, 42, 54, 59, 35, 35, 32, 31, 37, 43, 48, 47, 38, 71, 56, 53]
    }, {
        names: split("John Jn Joh Jo"),
        verses: [51, 25, 36, 54, 47, 71, 53, 59, 41, 42, 57, 50, 38, 31, 27, 33, 26, 40, 42, 31, 25]
    }, {
        names: split("Acts Ac Act"),
        verses: [26, 47, 26, 37, 42, 15, 60, 40, 43, 48, 30, 25, 52, 28, 41, 40, 34, 28, 41, 38, 40, 30, 35, 27, 27, 32, 44, 31]
    }, {
        names: split("Romans Ro Rom Rmn Rmns"),
        verses: [32, 29, 31, 25, 21, 23, 25, 39, 33, 21, 36, 21, 14, 23, 33, 27]
    }, {
        names: g(1, "Corinthians Co Cor"),
        verses: [31, 16, 23, 21, 13, 20, 40, 13, 27, 33, 34, 31, 13, 40, 58, 24]
    }, {
        names: g(2, "Corinthians Co Cor"),
        verses: [24, 17, 18, 18, 21, 18, 16, 24, 15, 18, 33, 21, 14]
    }, {
        names: split("Galatians Ga Gal Gltns"),
        verses: [24, 21, 29, 31, 26, 18]
    }, {
        names: split("Ephesians Ep Eph Ephn"),
        verses: [23, 22, 21, 32, 33, 24]
    }, {
        names: split("Philippians Phi Phil Phi"),
        verses: [30, 30, 21, 23]
    }, {
        names: split("Colossians Co Col Colo Cln Clns"),
        verses: [29, 23, 25, 18]
    }, {
        names: g(1, "Thessalonians Th Thess Thes"),
        verses: [10, 20, 13, 18, 28]
    }, {
        names: g(2, "Thessalonians Th Thess Thes"),
        verses: [12, 17, 18]
    }, {
        names: g(1, "Timothy Ti Tim"),
        verses: [20, 15, 16, 16, 25, 21]
    }, {
        names: g(2, "Timothy Ti Tim"),
        verses: [18, 26, 17, 22]
    }, {
        names: split("Titus Ti Tit Tt Ts"),
        verses: [16, 15, 15]
    }, {
        names: split("Philemon Pm Phile Philm Pm"),
        verses: [25]
    }, {
        names: split("Hebrews He Heb Hw"),
        verses: [14, 18, 19, 16, 14, 20, 28, 13, 28, 39, 40, 29, 25]
    }, {
        names: split("James Jm Jam Jas Ja"),
        verses: [27, 26, 18, 17, 20]
    }, {
        names: g(1, "Peter Pe Pet P"),
        verses: [25, 25, 22, 19, 14]
    }, {
        names: g(2, "Peter Pe Pet P"),
        verses: [21, 22, 18]
    }, {
        names: g(1, "John Jo Jn J"),
        verses: [10, 29, 24, 21, 21]
    }, {
        names: g(2, "John Jo Jn J"),
        verses: [13]
    }, {
        names: g(3, "John Jo Jn J"),
        verses: [14]
    }, {
        names: split("Jude"),
        verses: [25]
    }, {
        names: split("Revelation Re Rev Rvltn"),
        verses: [20, 29, 22, 11, 14, 17, 17, 13, 21, 11, 19, 17, 18, 20, 8, 21, 18, 24, 21, 15, 27, 20]
    }]
})();
bible.genNames = function () {
    for (var c = [], g = 0, j = bible.Books.length; g < j; g++)c.push(bible.Books[g].names.join("|"));
    return c.join("|")
};
bible.parseReference = function (ref) {
    var bkNum = -1, j = -1, l = -1, r = -1, k = -1;
    ref = (new String(ref)).replace("&ndash;", "-").replace("\u2013", "-").replace(/(\d+[\.:])\s+(\d+)/gi, "$1$2");
    var i, m, v, n, s = false, u = false, h = false, t = "", stdBkName, bkName = null;
    for (i = ref.length; i >= 0; i--)if (/[A-Za-z\s]/.test(ref.substring(i - 1, i))) {
        bkName = ref.substring(0, i);
        break
    }
    if (bkName != null) {
        bkName = bkName.replace(/\s+$/, "").replace(/\.+$/, "").toLowerCase();
        i = 0;
        for (v = bible.Books.length; i < v && bkNum == -1; i++) {
            m = 0;
            for (n = bible.Books[i].names.length; m < n; m++) {
                stdBkName = (new String(bible.Books[i].names[m])).toLowerCase();
                if (bkName == stdBkName) {
                    bkNum = i;
                    ref = ref.substring(stdBkName.length);
                    break
                }
            }
        }
        if (bkNum > -1) {
            for (i = 0; i < ref.length; i++) {
                m = ref.charAt(i);
                if (m == " " || isNaN(m)) {
                    if (h) {
                        if (m == "-" || m == "\u2013") {
                            s = true;
                            u = false
                        } else if (m == ":" || m == "," || m == ".")u = true;
                        t = "";
                        h = false
                    }
                } else {
                    h = true;
                    t += m;
                    if (u)if (s)k = parseInt(t, 10); else l = parseInt(t, 10); else if (s)r = parseInt(t, 10); else j = parseInt(t, 10)
                }
            }
            if (bible.Books[bkNum].verses.length == 1)if (j > 1 && l == -1) {
                l = j;
                j = 1
            }
            if (j > 0 && l > 0 && r > 0 && k <= 0) {
                k = r;
                r = j
            }
            if (j > 0 && l <= 0 && r > 0 && k > 0)l = 1;
            if (bkNum > -1 && j <= 0 && l <= 0 && r <= 0 && k <= 0)j = 1;
            if (typeof bible.Books[bkNum].verses !=
                "undefined") {
                if (j == -1)j = 1; else if (j > bible.Books[bkNum].verses.length) {
                    j = bible.Books[bkNum].verses.length;
                    if (l > 0)l = 1
                }
                if (l > bible.Books[bkNum].verses[j - 1])l = bible.Books[bkNum].verses[j - 1];
                if (l > 0 && k <= l)k = r = -1
            }
        }
    }
    return bible.Reference(bkNum, j, l, r, k)
};
bible.Reference = function () {
    var c = -1, g = -1, j = -1, l = -1, r = -1, k = arguments;
    if (k.length != 0)if (k.length == 1 && typeof k[0] == "string")return bible.parseReference(k[0]); else if (k.length == 1)return null; else {
        c = k[0];
        g = k[1];
        if (k.length >= 3)j = k[2];
        if (k.length >= 4)l = k[3];
        if (k.length >= 5)r = k[4]
    }
    return {
        bookIndex: c, chapter: g, verse: j, chapter1: g, verse1: j, chapter2: l, verse2: r, isValid: function () {
            return c > -1 && c < bible.Books.length && g > 0
        }, chapterAndVerse: function (i, m, v) {
            i = i || ":";
            m = m || "-";
            v = v || "-";
            var n = this.chapter1, s = this.chapter2,
                u = this.verse1, h = this.verse2;
            return n > 0 && u <= 0 && s <= 0 && h <= 0 ? n : n > 0 && u > 0 && s <= 0 && h <= 0 ? n + i + u : n > 0 && u > 0 && s <= 0 && h > 0 ? n + i + u + m + h : n > 0 && u <= 0 && s > 0 && h <= 0 ? n + v + s : n > 0 && u > 0 && s > 0 && h > 0 ? n + i + u + v + (n != s ? s + i : "") + h : "?"
        }, toString: function () {
            if (this.bookIndex < 0 || this.bookIndex >= bible.Books.length)return "invalid";
            return bible.Books[this.bookIndex].names[0] + " " + this.chapterAndVerse()
        }, toShortUrl: function () {
            if (this.bookIndex < 0 || this.bookIndex >= bible.Books.length)return "invalid";
            return "http://bib.ly/" + (bible.Books[this.bookIndex].names.length >
                1 ? bible.Books[this.bookIndex].names[1] : bible.Books[this.bookIndex].names[0]) + this.chapterAndVerse(".", "-", "-")
        }
    }
};
(function () {
    var c = 1E5, g = function (a, b) {
            var d = "callback" + c++, e = p.createElement("script");
            t[d] = function (f) {
                b(f)
            };
            a += (a.indexOf("?") > -1 ? "&" : "?") + "callback=" + d;
            e.setAttribute("src", a);
            e.setAttribute("type", "text/javascript");
            q.appendChild(e)
        }, j = function (a, b) {
            var d = C(), e = h.maxVerses, f = new bible.Reference(a);
            if (f.verse1 > 0 && f.verse2 > 0 && f.verse2 - f.verse1 > e - 1)f.verse2 = f.verse1 + (e - 1); else if (f.verse1 <= 0 && f.verse2 <= 0) {
                f.verse1 = 1;
                f.verse2 = e;
                f.chapter2 = -1
            }
            switch (d) {
                default:
                case "NET":
                    g("http://labs.bible.org/api/?passage=" +
                        encodeURIComponent(f.toString()) + "&type=json", b);
                    break;
                case "KJV":
                case "LEB":
                    g("http://api.biblia.com/v1/bible/content/" + d + ".html.json?style=oneVersePerLine&key=" + h.bibliaApiKey + "&passage=" + encodeURIComponent(f.toString()), b);
                    break;
                case "ESV":
                    g("http://www.esvapi.org/crossref/ref.php?reference=" + encodeURIComponent(f.toString()), b)
            }
        }, l, r = function (a) {
            function b() {
                w = f.left - e.outer.offsetWidth / 2 + d.offsetWidth / 2;
                y = f.top - e.outer.clientHeight;
                if (w < 0)w = 0; else if (w + e.outer.clientWidth > viewport.width)w = viewport.width -
                    e.outer.clientWidth - 20;
                if (y < 0 || y < scrollPos.y) {
                    y = f.top + d.offsetHeight + 10;
                    e.arrowtop.style.display = "block";
                    e.arrowtop_border.style.display = "block";
                    e.arrowbot.style.display = "none";
                    e.arrowbot_border.style.display = "none"
                } else {
                    y -= 10;
                    e.arrowtop.style.display = "none";
                    e.arrowtop_border.style.display = "none";
                    e.arrowbot.style.display = "block";
                    e.arrowbot_border.style.display = "block"
                }
                e.outer.style.top = y + "px";
                e.outer.style.left = w + "px"
            }

            if (!a)a = t.event;
            if (h.enablePopups) {
                clearTimeout(l);
                delete l;
                var d = a.target ? a.target :
                    a.srcElement, e = h.popup, f = n(d), w = y = 0;
                a = C();
                referenceText = d.getAttribute("rel");
                viewport = s();
                scrollPos = u();
                e.outer.style.display = "block";
                e.header.innerHTML = referenceText + " (" + a + ")";
                e.content.innerHTML = "Loading...<br/><br/><br/>";
                e.footer.innerHTML = M(a);
                b();
                j(referenceText, function (x) {
                    var z = C(), N = h.popup, O = h.maxVerses, B = "", F = z + "-version", G;
                    switch (z) {
                        default:
                        case "NET":
                            z = 0;
                            for (G = x.length; z < G && z < O; z++)B += '<span class="bibly_verse_number">' + x[z].verse + "</span>" + x[z].text + " ";
                            break;
                        case "KJV":
                        case "LEB":
                            F +=
                                " biblia";
                            B = x.text;
                            break;
                        case "ESV":
                            B = x.content
                    }
                    N.content.innerHTML = '<div class="' + F + '">' + B + "</div>";
                    b()
                })
            }
        }, k = function () {
            if (h.enablePopups)l = setTimeout(v, 500)
        }, i = function () {
            clearTimeout(l);
            delete l
        }, m = function () {
            l = setTimeout(v, 500)
        }, v = function () {
            h.popup.outer.style.display = "none"
        }, n = function (a) {
            var b = curtop = curtopscroll = curleftscroll = 0;
            if (a.offsetParent) {
                do {
                    b += a.offsetLeft;
                    curtop += a.offsetTop;
                    curleftscroll += a.offsetParent ? a.offsetParent.scrollLeft : 0;
                    curtopscroll += a.offsetParent ? a.offsetParent.scrollTop :
                        0
                } while (a = a.offsetParent)
            }
            return {left: b, top: curtop, leftScroll: curleftscroll, topScroll: curtopscroll}
        }, s = function () {
            var a = 0, b = 0;
            if (typeof t.innerWidth == "number") {
                a = t.innerWidth;
                b = t.innerHeight
            } else if (p.documentElement && (p.documentElement.clientWidth || p.documentElement.clientHeight)) {
                a = p.documentElement.clientWidth;
                b = p.documentElement.clientHeight
            } else if (q && (q.clientWidth || q.clientHeight)) {
                a = q.clientWidth;
                b = q.clientHeight
            }
            return {width: a, height: b}
        }, u = function () {
            var a = 0, b = 0;
            if (q && (q.scrollLeft || q.scrollTop)) {
                b =
                    q.scrollTop;
                a = q.scrollLeft
            } else if (p.documentElement && (p.documentElement.scrollLeft || p.documentElement.scrollTop)) {
                b = p.documentElement.scrollTop;
                a = p.documentElement.scrollLeft
            } else if (typeof t.pageYOffset == "number") {
                b = t.pageYOffset;
                a = t.pageXOffset
            }
            return {x: a, y: b}
        }, h = {
            version: "0.9.5",
            maxNodes: 500,
            className: "bibly_reference",
            enablePopups: true,
            popupVersion: "ESV",
            linkVersion: "",
            bibliaApiKey: "436e02d01081d28a78a45d65f66f4416",
            autoStart: true,
            startNodeId: "",
            maxVerses: 4,
            newWindow: false,
            ignoreClassName: "bibly_ignore",
            ignoreTags: ["h1", "h2", "h3", "h4"],
            newTagName: "A",
            handleLinks: function (a, b) {
                a.setAttribute("href", b.toShortUrl() + (h.linkVersion != "" ? "." + h.linkVersion : ""));
                a.setAttribute("title", "Read " + b.toString());
                a.setAttribute("rel", b.toString());
                a.setAttribute("class", h.className);
                h.newWindow && a.setAttribute("target", "_blank");
                A(a, "mouseover", r);
                A(a, "mouseout", k)
            }
        }, t = window, p = document, q = null, H = ["NET", "ESV", "KJV", "LEB", "DARBY"], D = "\\b(" + bible.genNames() + ").?\\s+(((1?\\d{1,2})([.:]\\s?(\\d+))?)(\\s?[-\u2013&]\\s?(\\d+)([.:]\\s?(\\d+))?)?((\\s?,(\\s+)?((1?\\d{1,2})([.:]\\s?(\\d+))?)(\\s?[-\u2013&]\\s?(\\d+)([.:]\\s?(\\d+))?)?)|(\\s?;(\\s+)?(1?\\d{1,2})[.:]\\s?(\\d+)(\\s?[-\u2013&]\\s?(\\d+))?))*)\\b",
        P = RegExp(D, "mi"), Q = RegExp("((1?\\d{1,2})([.:]\\s?(\\d+))?)(\\s?[-\u2013&]\\s?(\\d+)([.:]\\s?(\\d+))?)?", "mi"), R = ["a", "script", "style", "textarea"], o = null, S = function (a) {
            var b = P.exec(a.data), d;
            o = null;
            if (b) {
                d = b[0];
                b = a.splitText(b.index);
                b.splitText(d.length);
                return a = I(a, b)
            } else return a
        }, I = function (a, b) {
            if (b.nodeValue == null)return b;
            var d = b.nodeValue.indexOf(","), e = b.nodeValue.indexOf(";");
            d = d > 0 && e > 0 ? Math.min(d, e) : Math.max(d, e);
            var f;
            if (d > 0) {
                f = b.splitText(d);
                for (d = 1; d < f.nodeValue.length && f.nodeValue.substring(d,
                    d + 1) == " ";)d++;
                f = f.splitText(d)
            }
            refText = b.nodeValue;
            d = T(refText);
            if (typeof d != "undefined" && d.isValid()) {
                newNode = a.ownerDocument.createElement(h.newTagName);
                a.parentNode.replaceChild(newNode, b);
                h.handleLinks(newNode, d);
                newNode.appendChild(b);
                if (f)newNode = I(a, f);
                return newNode
            } else return b
        }, T = function (a) {
            var b = new bible.Reference(a), d = null, e, f;
            if (b != null && typeof b.isValid != "undefined" && b.isValid())return o = b; else if (o != null) {
                if (d = Q.exec(a)) {
                    b = parseInt(d[2], 10);
                    e = parseInt(d[4], 10);
                    f = parseInt(d[6], 10);
                    d = parseInt(d[8], 10);
                    if (isNaN(e))e = 0;
                    if (isNaN(f))f = 0;
                    if (isNaN(d))d = 0;
                    if (b > 0 && e == 0 && f == 0 && d == 0) {
                        o.verse1 = b;
                        o.chapter2 = -1;
                        o.verse2 = -1
                    } else if (b > 0 && e > 0 && f == 0 && d == 0) {
                        o.chapter1 = b;
                        o.verse1 = e;
                        o.chapter2 = -1;
                        o.verse2 = -1
                    } else if (b > 0 && e == 0 && f > 0 && d == 0) {
                        o.verse1 = b;
                        o.chapter2 = -1;
                        o.verse2 = f
                    } else if (b > 0 && e > 0 && f > 0 && d == 0) {
                        o.chapter1 = b;
                        o.verse1 = e;
                        o.chapter2 = -1;
                        o.verse2 = f
                    } else if (b > 0 && e > 0 && f > 0 && d > 0) {
                        o.chapter1 = b;
                        o.verse1 = e;
                        o.chapter2 = f;
                        o.verse2 = d
                    }
                    return o
                }
                return {
                    refText: a, toShortUrl: function () {
                        return "http://bib.ly/" +
                            a.replace(/\s/ig, "").replace(/:/ig, ".").replace(/\u2013/ig, "-")
                    }, toString: function () {
                        return a + " = Can't parse it"
                    }
                }
            }
        }, M = function (a) {
            switch (a) {
                case "NET":
                    return '<a href="http://bible.org/">NET Bible\u00ae copyright \u00a91996-2006 by Biblical Studies Press, LLC</a>';
                case "ESV":
                    return 'English Standard Version. Copyright &copy;2001 by <a href="http://www.crosswaybibles.org">Crossway Bibles</a>';
                case "LEB":
                case "KJV":
                    return a + ' powered by <a href="http://biblia.com/">Biblia</a> web services from <a href="http://www.logos.com/">Logos Bible Software</a>';
                default:
                    return ""
            }
        }, C = function () {
            for (var a = h.popupVersion.toUpperCase(), b = -1, d = 0, e = H.length; d < e; d++)if (H[d].toUpperCase() === a) {
                b = d;
                break
            }
            return b > -1 ? a : "ESV"
        }, K = function (a) {
            J(a.childNodes[0], 1, S)
        }, J = function (a, b, d) {
            for (var e = 0, f = RegExp("^(" + R.concat(h.ignoreTags).join("|") + ")$", "i"); a && b > 0;) {
                e++;
                if (e >= h.maxNodes) {
                    setTimeout(function () {
                        J(a, b, d)
                    }, 50);
                    break
                }
                switch (a.nodeType) {
                    case 1:
                        if (!f.test(a.tagName.toLowerCase()) && a.childNodes.length > 0 && (h.ignoreClassName == "" || a.className.toString().indexOf(h.ignoreClassName) == -1)) {
                            a = a.childNodes[0];
                            b++;
                            continue
                        }
                        break;
                    case 3:
                    case 4:
                        a = d(a)
                }
                if (a.nextSibling)a = a.nextSibling; else for (; b > 0;) {
                    a = a.parentNode;
                    b--;
                    if (a.nextSibling) {
                        a = a.nextSibling;
                        break
                    }
                }
            }
        }, A = function (a, b, d) {
            if (a.attachEvent)a.attachEvent("on" + b, d); else if (a.addEventListener)a.addEventListener(b, d, false); else {
                var e = a["on" + b];
                a["on" + b] = function () {
                    d();
                    e()
                }
            }
        }, L = false;
    D = function () {
        var a, b, d, e = arguments[0] || {}, f = 1, w = arguments.length;
        if (typeof e !== "object" && typeof e !== "function")e = {};
        for (; f < w; f++)if ((a = arguments[f]) !=
            null)for (b in a) {
            d = a[b];
            if (e !== d)if (d !== undefined)e[b] = d
        }
        return e
    };
    var E = function () {
        if (!L) {
            L = true;
            p = document;
            q = p.body;
            var a = h.popup = {outer: p.createElement("div")}, b = ["header", "content", "footer", "arrowtop_border", "arrowtop", "arrowbot_border", "arrowbot"], d, e, f, w, x = null;
            a.outer.className = "bibly_popup_outer";
            d = 0;
            for (e = b.length; d < e; d++) {
                w = b[d];
                f = p.createElement("div");
                f.className = "bibly_popup_" + w;
                a.outer.appendChild(f);
                a[w] = f
            }
            q.appendChild(a.outer);
            A(a.outer, "mouseover", i);
            A(a.outer, "mouseout", m);
            if (h.autoStart) {
                if (h.startNodeId !=
                    "")x = p.getElementById(h.startNodeId);
                if (x == null)x = q;
                K(x)
            }
        }
    };
    A(p, "DOMContentLoaded", E);
    A(t, "load", E);
    if (typeof window.bibly != "undefined")h = D(h, window.bibly);
    h.startBibly = E;
    h.scanForReferences = K;
    t.bibly = h
})();