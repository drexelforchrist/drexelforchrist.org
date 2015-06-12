<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <xsl:if test="brilliant/lang != ''">
                <xsl:attribute name="lang">
                    <xsl:value-of select="brilliant/lang" />
                </xsl:attribute>
            </xsl:if>


            <!-- Extract body className for template. -->
            <xsl:variable name="styleClass">
                <xsl:choose>
                    <xsl:when test="brilliant/calendar/name != ''">
                        <xsl:value-of select="translate(brilliant/calendar/name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
                    </xsl:when>
                    <xsl:when test="brilliant/template != ''">
                        <xsl:value-of select="translate(brilliant/template, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
                    </xsl:when>
                    <xsl:otherwise>
                        community <!-- some value is necessary for non-css components (like the icon)  -->
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>


            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
                <title><xsl:value-of select="brilliant/title" /><xsl:if test="brilliant/title != ''"> // </xsl:if>Drexel Students for Christ</title>
                <link rel="stylesheet" href="screen.css" type="text/css" media="screen" />
                <link rel="stylesheet" href="print.css" type="text/css" media="print" />
                <link rel="shortcut icon">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('static/ico/RGB-icon-', $styleClass, '.ico')" />
                    </xsl:attribute>
                </link>
            </head>


            <body>
                <xsl:attribute name="class">
                    <xsl:value-of select="$styleClass" />
                </xsl:attribute>
                <div class="background">
                    <video autoplay="autoplay" loop="loop" muted="muted" preload="auto" id="videoBackground">
                        <source src="http://drexelforchrist.org/_resources/Blue_Discs.webm" type="video/webm" />
                        <source src="http://drexelforchrist.org/_resources/Blue_Discs.mp4" type="video/mp4" />
                        <!-- KURTZ alternative for browsers which don't support the Video tag -->
                    </video>

                </div>
                <nav id="header">
                    <div id="headerColorBar" class="printOnly">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                             viewBox="0 0 600 10" preserveAspectRatio="xMidYMid slice">
                            <rect x="0" y="0" width="600" height="10" style="fill:rgb(248,193,44);" />
                        </svg>
                    </div>
                    <div id="logo">
                        <img src="static/logo/CMYK_community_wide.svg" class="printOnly" id="printLogo" alt="Drexel Students for Christ" />
                        <div class="printOnly printPageTitle"><xsl:value-of select="brilliant/title" />
                            <span id="printPageSubtitle"><xsl:value-of select="brilliant/subtitle" /></span>
                        </div>
                    </div>

                </nav>
                <div id="corset">
                    <!--<img class="content" src="static/img.png" />-->
                    <h1 class="noPrint">
                        <span id="pageTitle"><xsl:value-of select="brilliant/title" /></span>
                        <xsl:if test="brilliant/subtitle != ''">
                            &#160;//&#160;<xsl:value-of select="brilliant/subtitle" />
                        </xsl:if>
                    </h1>

                    <xsl:for-each select="brilliant/document/content">
                        <xsl:copy-of select="*" />
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>