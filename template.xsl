<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:if test="brilliant/lang != ''">
                <xsl:attribute name="lang">
                    <xsl:value-of select="brilliant/lang" />
                </xsl:attribute>
            </xsl:if>


            <!-- Extract body className for template. -->
            <xsl:variable name="styleClass">
                <xsl:choose>
                    <xsl:when test="brilliant/calendar/name">
                        <xsl:value-of select="translate(brilliant/calendar/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
                    </xsl:when>
                    <xsl:when test="brilliant/template">
                        <xsl:value-of select="translate(brilliant/template, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
                    </xsl:when>
                    <xsl:otherwise>community</xsl:otherwise><!-- some value is necessary for non-css components (like the icon)  -->
                </xsl:choose>
            </xsl:variable>

            <!-- Isolate Summary -->
            <xsl:variable name="summary">

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
                <!-- general metas -->
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />

                <!-- things that are actually visible -->
                <title><xsl:value-of select="brilliant/title" /><xsl:if test="brilliant/title != ''"> // </xsl:if>Drexel Students for Christ</title>
                <link rel="stylesheet" href="screen.css" type="text/css" media="screen" />
                <link rel="stylesheet" href="print.css" type="text/css" media="print" />
                <link rel="shortcut icon">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('static/ico/RGB-icon-', $styleClass, '.ico')" />
                    </xsl:attribute>
                </link>
                <script src="static/js/templating.js" type="text/javascript" />


                <!-- JS -->
                <xsl:copy-of select="brilliant/headLoad/*" />
                <xsl:if test="brilliant/onLoad">
                    <script type="text/javascript">
                        function load() {
                            <xsl:value-of select="brilliant/onLoad"/>
                        }
                    </script>
                </xsl:if>

                <!-- SEO -->
                <xsl:if test="$summary != ''">
                    <meta name="description">
                        <xsl:copy-of select="$summary" />
                    </meta>
                </xsl:if>
                <!--<xsl:if test="$author">-->
                <!--&lt;!&ndash;<xsl:for-each select="$author/*">&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:copy-of select="*" />&ndash;&gt;-->
                <!--&lt;!&ndash;</xsl:for-each>&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:copy-of select="$author" /> &lt;!&ndash; KURTZ make this work! &ndash;&gt;&ndash;&gt;-->
                <!--&lt;!&ndash;<meta name="author">&ndash;&gt;-->
                <!--&lt;!&ndash;<xsl:value-of select="$author/name" />&ndash;&gt;-->
                <!--&lt;!&ndash;</meta>&ndash;&gt;-->
                <!--</xsl:if>-->

                <!-- -->




            </head>


            <body>
                <xsl:attribute name="class">
                    <xsl:value-of select="$styleClass" />
                </xsl:attribute>

                <xsl:choose>
                    <xsl:when test="$styleClass = 'community'">
                        <div class="background" id="communityBackground">
                            <img src="static/TEMP_bg-guitar.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'church'">
                        <div class="background" id="churchBackground">
                            <img src="static/bg-stainedGlass.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'prayer'">
                        <div class="background" id="prayerBackground">
                            <img src="static/bg-prayer.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'training'">
                        <div class="background" id="trainingBackground">
                            <img src="static/bg-training.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'discipleship'">
                        <div class="background" id="discipleshipBackground">
                            <img src="static/bg-discipleship.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'outreach'">
                        <div class="background" id="outreachBackground">
                            <img src="static/bg-outreach.jpg" alt="" />
                        </div>
                    </xsl:when>
                    <xsl:when test="$styleClass = 'ninja'" >
                        <div class="background" id="ninjaBackground">
                            <video autoplay="autoplay" loop="loop" muted="muted" preload="auto">
                                <source src="http://drexelforchrist.org/_resources/Blue_Discs.webm" type="video/webm" />
                                <source src="http://drexelforchrist.org/_resources/Blue_Discs.mp4" type="video/mp4" />
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
                    <a id="pageLogo" href="/">
                        <img src="static/logo/CMYK_community_wide.svg" class="printOnly" id="printLogo" alt="Drexel Students for Christ" />
                        <div id="pageLogoMark" />
                        <div id="pageLogoText" />
                        <div class="printOnly printPageTitle"><xsl:value-of select="brilliant/title" />
                            <span id="printPageSubtitle"><xsl:value-of select="brilliant/subtitle" /></span>
                        </div>
                    </a>


                    <ul id="topNav">
                        <li id="navMenu" tabindex="1">
                            <a href="">Menu</a>
                            <ul>
                                <li>
                                    <a href="../join">get involved!</a>
                                </li>
                                <li>
                                    <a href="../about">about us</a>
                                    <ul>
                                        <li><a href="../about/faith">our faith</a></li>
                                        <!--<li><a href="../about/leadership">leadership</a></li>-->
                                    </ul>
                                </li>
                                <li>
                                    <a href="../churches">churches</a>
                                </li>
                                <li>
                                    <a href="../events">events</a>
                                    <ul>
                                        <li>
                                            <a href="../?manage">manage</a>
                                        </li>
                                        <li>
                                            <a href="../retreat">retreat</a>
                                        </li>
                                        <li>
                                            <a href="../smallgroups">growth groups</a>
                                        </li>
                                        <li>
                                            <a href="../bridge">alpha</a>
                                        </li>
                                        <li>
                                            <a href="../lg">large group</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="../resources">resources</a>
                                    <ul>
                                        <li>
                                            <a href="../rec">bibles</a>
                                        </li>
                                        <li>
                                            <a href="../rec">recordings</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="../feedback">feedback</a>
                                    <ul>
                                        <li>
                                            <a href="../contact">contact us</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="../give">give</a>
                                    <ul>
                                        <li>
                                            <a href="../serve">serve</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>




                        <li id="navSearch">
                            <a href="../me">search</a>
                            <ul>
                                <li>
                                    <form method="get" action="http://www.google.com/search" class="searchContent" style="display:inline;">
                                        <input name="q" type="search" placeholder="&#160;&#160;search" />
                                    </form>
                                    <ul>
                                        <li>
                                            <a href="../me">Result...</a>
                                        </li>
                                        <li>
                                            <a href="../me">Result...</a>
                                        </li>
                                        <li>
                                            <a href="../me">Result...</a>
                                        </li>
                                        <li>
                                            <a href="../me">Result...</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>


                        <li id="navUser">
                            <a href="../me">User</a>
                            <ul>
                                <li>
                                    <a href="../me">James K.</a>
                                    <ul>
                                        <li>
                                            <a href="../login?out">log out</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </nav>
                <div id="headerSpacer" />
                <div id="corset">
                    <!--<img class="content" src="static/img.png" />-->
                    
                    <xsl:if test="brilliant/document/content/div[@class = 'map']" >
                        <xsl:copy-of select="brilliant/document/content/div[@class = 'map']" />
                    </xsl:if>
                    
                    <h1 class="noPrint">
                        <span id="pageTitle"><xsl:value-of select="brilliant/title" /></span>
                        <xsl:if test="brilliant/subtitle != ''">
                            &#160;//&#160;<xsl:value-of select="brilliant/subtitle" />
                        </xsl:if>
                    </h1>

                    <xsl:for-each select="brilliant/document/content">
                        <xsl:copy-of select="section" />
                    </xsl:for-each>

                </div>
                <nav id="footer">
                    <ul>
                        <li class="copyrightText">&#169;&#160;2015 <span class="narrowHide">Drexel&#160;Students&#160;for&#160;Christ</span> // <span class="bold">connect<span class="narrowHide">&#160;with&#160;us</span>: </span></li>
                        <li><a href="https://www.facebook.com/drexelforchrist" title="Facebook" id="connectFacebook">Facebook</a></li>
                        <li><a href="https://twitter.com/drexelforchrist" title="Twitter" id="connectTwitter">Twitter</a></li>
                        <li><a href="http://www.youtube.com/drexel4christ" title="YouTube" id="connectYoutube">YouTube</a></li>
                        <li><a href="http://www.vimeo.com/drexel" title="Vimeo" id="connectVimeo">Vimeo</a></li>
                        <li><a href="https://plus.google.com/+DrexelforChrist" title="Google+" id="connectGoogleP">Google+</a></li>
                        <li><a href="https://soundcloud.com/drexelforchrist" title="SoundCloud" id="connectSoundcloud">SoundCloud</a></li>
                        <!--<li class="connectSprite" id="connectCSB"><a href="https://drexelforchrist.org/campussoapbox">Campus Soapbox</a></li>-->
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
                <script type="text/javascript">
                    try {
                        load();
                    } catch (e) {
                        document.addEventListener('load', load);
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>