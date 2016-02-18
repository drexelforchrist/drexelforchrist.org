<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="no" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html prefix="og: http://ogp.me/ns#">
            <xsl:if test="brilliant/lang != ''">
                <xsl:attribute name="lang">
                    <xsl:value-of select="brilliant/lang" />
                </xsl:attribute>
            </xsl:if>


            <!-- Extract body className for template. -->
            <xsl:variable name="rawStyleClass">
                <xsl:choose>
                    <xsl:when test="brilliant/document/template/name">
                        <xsl:value-of select="translate(brilliant/document/template/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
                    </xsl:when>
                    <xsl:otherwise>community</xsl:otherwise><!-- some value is necessary for non-css components (like the icon)  -->
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="styleClass">
                <xsl:choose>
                    <xsl:when test="$rawStyleClass = 'community' or
                                    $rawStyleClass = 'church' or
                                    $rawStyleClass = 'prayer' or
                                    $rawStyleClass = 'training' or
                                    $rawStyleClass = 'discipleship' or
                                    $rawStyleClass = 'outreach' or
                                    $rawStyleClass = 'ninja'">
                        <xsl:value-of select="$rawStyleClass" />
                    </xsl:when>
                    <xsl:otherwise>community</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>


            <!-- Isolate Summary -->
            <xsl:variable name="summary">
                <xsl:if test="brilliant/document/summary">
                    <xsl:value-of select="brilliant/document/summary" />
                </xsl:if>
            </xsl:variable>


            <!-- Isolate Summary -->
            <!--<xsl:variable name="author" as="element()">-->
            <!--<xsl:choose>-->
            <!--<xsl:when test="brilliant/document/author">-->
            <!--<xsl:copy-of select="brilliant/document/author" />-->
            <!--</xsl:when>-->
            <!--<xsl:otherwise />-->
            <!--</xsl:choose>-->
            <!--</xsl:variable>-->


            <head>
                <!-- really important metas -->
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1.0, user-scalable=no" name="viewport" />

                <!-- things that are actually visible -->
                <title><xsl:value-of select="brilliant/document/title/text()" /><xsl:if test="brilliant/document/title/text() != ''"> // </xsl:if>Drexel Students for Christ</title>

                <!-- First Party CSS -->
                <link rel="stylesheet" href="%%host:cdn%%/style/screen.min.css" type="text/css" media="screen" />
                <link rel="stylesheet" href="%%host:cdn%%/style/print.min.css" type="text/css" media="print" />
                <link rel="shortcut icon">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('%%host:cdn%%/ico/RGB-icon-', $styleClass, '.ico')" />
                    </xsl:attribute>
                </link>

                <!-- Third Party CSS -->
                <!--Font Awesome-->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />


                <!-- SEO Canon -->
                <link rel="canonical">
                    <xsl:attribute name="href">https://<xsl:value-of select="brilliant/document/canonical" /></xsl:attribute>
                </link>

                <!-- Bibly -->
                <link href="https://cdn.drexelforchrist.com/bibly/bibly.core.min.css" rel="stylesheet" />

                <script src="%%host:static%%/js/templating.js" type="text/javascript" />

                <!-- Header JS -->
                <xsl:copy-of select="brilliant/document/headload/*" />


                <!-- SEO -->
                <xsl:if test="$summary != ''">
                    <meta name="description">
                        <xsl:attribute name="content">
                            Drexel Students for Christ // <xsl:value-of select="brilliant/document/title/text()" /><xsl:if test="brilliant/document/title/text() != ''"> // </xsl:if>
                            <xsl:value-of select="$summary" />
                        </xsl:attribute>
                    </meta>
                </xsl:if>


                <!-- Twitter Card data.  Twitter must come first, else will fall back to OG data -->
                <meta name="twitter:card" content="summary_large_image" /> <!-- KURTZ when image exists, change to summary_large_image -->
                <meta name="twitter:site" content="@DrexelForChrist" />
                <meta name="twitter:title">
                    <xsl:attribute name="content">
                        <xsl:value-of select="brilliant/document/title/text()" />
                    </xsl:attribute>
                </meta>
                <meta name="twitter:description">
                    <xsl:attribute name="content">
                        <xsl:value-of select="$summary" />
                    </xsl:attribute>
                </meta>
                <!--<meta name="twitter:creator" content="@author_handle">-->
                <!-- Twitter Summary card images must be at least 120x120px -->
                <meta property="twitter:image">
                    <xsl:attribute name="content">http://13.drexelforchrist.org/dev/imageText/facebook.php/<xsl:value-of select="substring(brilliant/document/canonical, 21)" /></xsl:attribute>
                </meta>

                <!-- Open Graph data -->
                <meta property="og:url">
                    <xsl:attribute name="content">https://<xsl:value-of select="brilliant/document/canonical" /></xsl:attribute>
                </meta>
                <meta property="og:title">
                    <xsl:attribute name="content">
                        <xsl:value-of select="brilliant/document/title/text()" />
                    </xsl:attribute>
                </meta>
                <!--<meta property="og:type" content="article" />-->
                <meta property="og:image">
                    <xsl:attribute name="content">http://13.drexelforchrist.org/dev/imageText/facebook.php/<xsl:value-of select="substring(brilliant/document/canonical, 21)" /></xsl:attribute><!-- the /image is meant to effectively invalidate facebook's cache.  Soon, this will break.  -->
                </meta>

                <meta property="og:description">
                    <xsl:attribute name="content">
                        <xsl:value-of select="$summary" />
                    </xsl:attribute>
                </meta>
                <meta property="og:site_name" content="Drexel Students for Christ" />
                <meta property="fb:admins" content="590301109" />
                <meta property="fb:app_id" content="471343559743264" />



                <!--<xsl:if test="$author">-->
                <!--&lt;!&ndash;<xsl:for-each select="$author/*">&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:copy-of select="*" />&ndash;&gt;-->
                <!--&lt;!&ndash;</xsl:for-each>&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:copy-of select="$author" /> &lt;!&ndash; KURTZ make this work! &ndash;&gt;&ndash;&gt;-->
                <!--&lt;!&ndash;<meta name="author">&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:value-of select="$author/name" />&ndash;&gt;-->
                <!--&lt;!&ndash;</meta>&ndash;&gt;-->
                <!--</xsl:if>-->

            </head>


            <body>
                <xsl:attribute name="class">
                    <xsl:value-of select="$styleClass" />
                </xsl:attribute>

                <xsl:choose>
                    <xsl:when test="$styleClass = 'community'">
                        <div class="background" id="communityBackground">
                            <img src="%%host:cdn%%/backgrounds/bg_hanes_Community.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'church'">
                        <div class="background" id="churchBackground">
                            <img src="%%host:cdn%%/backgrounds/bg-stainedGlass.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'prayer'">
                        <div class="background" id="prayerBackground">
                            <img src="%%host:cdn%%/backgrounds/bg-prayer.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'training'">
                        <div class="background" id="trainingBackground">
                            <img src="%%host:cdn%%/backgrounds/bg-training.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'discipleship'">
                        <div class="background" id="discipleshipBackground">
                            <img src="%%host:cdn%%/backgrounds/bg-bibleStudyTable.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'outreach'">
                        <div class="background" id="outreachBackground">
                            <img src="%%host:cdn%%/backgrounds/bg-outreach.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'ninja'" >
                        <div class="background" id="ninjaBackground">
                            <video autoplay="autoplay" loop="loop" muted="muted" preload="auto">
                                <source src="%%host:cdn%%/backgrounds/Blue_Discs.webm" type="video/webm" />
                                <source src="%%host:cdn%%/backgrounds/Blue_Discs.mp4" type="video/mp4" />
                                <!-- KURTZ alternative for browsers which don't support the Video tag -->
                            </video>
                        </div>
                    </xsl:when>


                </xsl:choose>

                <nav id="header">
                    <div id="headerColorBar" class="printOnly">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                             viewBox="0 0 600 10" preserveAspectRatio="xMidYMid slice">
                            <rect x="0" y="0" width="600" height="10" style="fill:rgb(248,193,44);" />
                        </svg>
                    </div>
                    <div id="pageLogo">
                        <img src="%%host:cdn%%/logo/CMYK_community_wide.svg" class="printOnly" id="printLogo" alt="Drexel Students for Christ" />
                        <a id="pageLogoMark" href="/" />
                        <a id="pageLogoText" href="/" />

                        <div class="printOnly printPageTitle"><xsl:value-of select="brilliant/document/title" />
                            <span id="printPageSubtitle"><xsl:value-of select="brilliant/document/subtitle" /></span>
                        </div>
                    </div>




                    <ul id="topNav" oncontextmenu="return false;">
                        <li id="navMenu" tabindex="1">
                            <a class="fa fa-bars" title="Menu" />
                            <ul>
                                <li>
                                    <a href="https://drexelforchrist.org/join">get involved!</a>
                                </li>
                                <li>
                                    <a href="/about">about us</a>
                                    <ul>
                                        <li><a href="/about/faith">our faith</a></li>
                                        <!--<li><a href="../about/leadership">leadership</a></li>-->
                                    </ul>
                                </li>
                                <li>
                                    <a href="/churches">churches</a>
                                </li>
                                <li>
                                    <a href="https://drexelforchrist.org/events">events</a>
                                    <ul>
                                        <xsl:if test="brilliant/session/person">
                                            <li>
                                                <a href="/events/_manage">manage</a>
                                            </li>
                                        </xsl:if>
                                        <li>
                                            <a href="/events/sr16">spring retreat</a>
                                        </li>
                                        <li>
                                            <a href="/smallgroups">growth groups</a>
                                        </li>
                                        <li>
                                            <a href="/lg">large group</a>
                                        </li>
                                        <li>
                                            <a href="/sugar">sugar giveaway</a>
                                        </li>
                                        <li>
                                            <a href="/events/427">week of prayer</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/contact">contact us</a>
                                </li>
                                <!--<li>-->
                                    <!--<a href="../resources">resources</a>-->
                                    <!--<ul>-->
                                        <!--<li>-->
                                            <!--<a href="../rec">bibles</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a href="../rec">recordings</a>-->
                                        <!--</li>-->
                                    <!--</ul>-->
                                <!--</li>-->
                                <li>
                                    <a href="/give">give</a>
                                    <ul>
                                        <li>
                                            <a href="/serve">serve</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>




                        <!--<li id="navSearch">-->
                            <!--<a class="fa fa-search" title="search" />-->
                            <!--<ul>-->
                                <!--<li>-->
                                    <!--<form method="get" action="http://www.google.com/search" class="searchContent" style="display:inline;">-->
                                        <!--<input name="q" type="search" placeholder="&#160;&#160;search" />-->
                                    <!--</form>-->
                                    <!--<ul>-->
                                        <!--<li>-->
                                            <!--<a href="../me">Result...</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a href="../me">Result...</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a href="../me">Result...</a>-->
                                        <!--</li>-->
                                        <!--<li>-->
                                            <!--<a href="../me">Result...</a>-->
                                        <!--</li>-->
                                    <!--</ul>-->
                                <!--</li>-->
                            <!--</ul>-->
                        <!--</li>-->


                        <li id="navUser">
                            <a class="fa fa-user" title="You" />
                            <ul>
                                <li>
                                    <xsl:choose>
                                        <xsl:when test="brilliant/session/person">
                                            <a>
                                                <xsl:attribute name="href">
                                                    <xsl:value-of select="brilliant/session/person/address/text()" />
                                                </xsl:attribute>
                                                <xsl:value-of select="brilliant/session/person/name/first/text()" />
                                                <xsl:if test="brilliant/session/person/name/first/text() != ''">
                                                    &#160;<xsl:value-of select="substring(brilliant/session/person/name/last/text(),1,1)" />.
                                                </xsl:if>
                                            </a>
                                            <ul>
                                                <li>
                                                    <a href="/_login?out">log out</a>
                                                </li>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a href="/_login">log in</a>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </nav>
                <div id="headerSpacer" />
                <main id="corset">
                    <xsl:if test="brilliant/document/itemscope[@itemtype]">
                        <xsl:attribute name="itemscope" />
                        <xsl:attribute name="itemtype"><xsl:value-of select="brilliant/document/itemscope/@itemtype" /></xsl:attribute>
                    </xsl:if>

                    <xsl:if test="brilliant/document/content/div[@class = 'map']" >
                        <xsl:copy-of select="brilliant/document/content/div[@class = 'map']" />
                    </xsl:if>

                    <xsl:if test="not(brilliant/document/template/notitle)" >
                        <h1 class="noPrint">
                            <xsl:if test="brilliant/document/itemscope[@itemtype]">
                                <xsl:attribute name="itemprop">name</xsl:attribute>
                            </xsl:if>
                            <span id="pageTitle"><xsl:value-of select="brilliant/document/title" /></span>
                            <xsl:if test="brilliant/document/subtitle != ''">
                                //&#160;<xsl:value-of select="brilliant/document/subtitle" />
                            </xsl:if>
                        </h1>
                    </xsl:if>

                    <xsl:for-each select="brilliant/document/content">
                        <xsl:copy-of select="*[not(@class = 'map')]" />
                    </xsl:for-each>

                </main>
                <nav id="footer">
                    <ul>
                        <li class="copyrightText">&#169;&#160;2016 <span class="narrowHide">Drexel&#160;Students&#160;for&#160;Christ</span> // <span class="bold">connect<span class="narrowHide">&#160;with&#160;us</span>: </span></li>
                        <li><a href="https://www.facebook.com/drexelforchrist" title="Facebook" id="connectFacebook">Facebook</a></li>
                        <li><a href="https://twitter.com/drexelforchrist" title="Twitter" id="connectTwitter">Twitter</a></li>
                        <li><a href="https://www.youtube.com/drexel4christ" title="YouTube" id="connectYoutube">YouTube</a></li>
                        <li><a href="https://www.vimeo.com/drexel" title="Vimeo" id="connectVimeo">Vimeo</a></li>
                        <li><a href="https://plus.google.com/+DrexelforChrist" title="Google+" id="connectGoogleP">Google+</a></li>
                        <li><a href="https://soundcloud.com/drexelforchrist" title="SoundCloud" id="connectSoundcloud">SoundCloud</a></li>
                        <xsl:if test="$styleClass = 'ninja'" >
                        <li><a href="https://github.com/drexelforchrist" title="GitHub" id="connectGithub">Github</a></li>
                        </xsl:if>
                        <!--<li class="connectSprite" id="connectFeeds"><a href="https://drexelforchrist.org/media/feeds">Feeds</a></li>-->
                    </ul><!-- KURTZ make year dynamic -->
                    <span id="printPageNumber" class="printOnly" />
                    <div id="footerColorBar" class="printOnly">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                             viewBox="0 0 600 10" preserveAspectRatio="xMidYMid slice">
                            <rect x="0" y="0" width="600" height="10" style="fill: #4fc2ff;" />
                        </svg>
                    </div>
                </nav>

                <xsl:copy-of select="brilliant/document/footload/*" />
                <script>
                    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                    ga('create', 'UA-16892920-2', 'auto');
                    ga('send', 'pageview');

                </script>

                <!-- Facebook Pixel Code -->
                <!--<script>-->
                    <!--!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?-->
                    <!--n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;-->
                    <!--n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;-->
                    <!--t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,-->
                    <!--document,'script','//connect.facebook.net/en_US/fbevents.js');-->

                    <!--fbq('init', '1784021421825571');-->
                    <!--fbq('track', "PageView");</script>-->
                <!--<noscript><img height="1" width="1" style="display:none"-->
                               <!--src="https://www.facebook.com/tr?id=1784021421825571&ev=PageView&noscript=1"-->
                        <!--/></noscript>-->
                <!-- End Facebook Pixel Code -->

                <!--<script src="http://www.esvapi.org/crossref/crossref.min.js" type="text/javascript" />-->
                <!--<script>-->
                    <!--var refTagger = {-->
                    <!--settings: {-->
                    <!--bibleVersion: "ESV",-->
                    <!--dropShadow: false,-->
                    <!--socialSharing: []-->
                    <!--}-->
                    <!--};-->
                    <!--(function(d, t) {-->
                    <!--var g = d.createElement(t), s = d.getElementsByTagName(t)[0];-->
                    <!--g.src = "//api.reftagger.com/v2/RefTagger.js";-->
                    <!--s.parentNode.insertBefore(g, s);-->
                    <!--}(document, "script"));-->
                <!--</script>-->

                <script src="https://cdn.drexelforchrist.com/bibly/bibly.min.js"><!--Bibly--></script>
                <script type="text/javascript"><![CDATA[
                    bibly.toShortUrl = function (reference) {
                        if (reference.bookIndex < 0 || reference.bookIndex >= bible.Books.length) return "invalid";
                        return 'http://www.esvbible.org/' + bible.Books[reference.bookIndex].names[1] + reference.chapterAndVerse(':','-','-');
                    };
                ]]></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>