<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;?xml-stylesheet type="text/xsl" href="/_formatting/xsl/default.xsl"?&gt;&#xa;</xsl:text>
        <brilliant>
            <xsl:if test="lang != ''">
                <lang><xsl:value-of select="brilliant/lang" /></lang>
            </xsl:if>
            <xsl:apply-templates />
        </brilliant>
    </xsl:template>

    <xsl:template match="brilliant/eventSet">
        <xsl:variable name="topMostDescription" select="description[@type='xhtml']" />
        <document>
            <title><xsl:value-of select="name" /></title>
            <subtitle><xsl:value-of select="subtitle" /></subtitle>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <template>
                <name><xsl:value-of select="eventCalendar/address" /></name>
            </template>
            <id><xsl:value-of select="id" /></id>
            <summary><xsl:value-of select="description[@type='text']" /></summary>
            <content type="xhtml">
                <section>
                    <xsl:copy-of select="description[@type='xhtml']/*" />
                </section>
                <xsl:if test="children/event[@tense='present']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Happening Now</h2>
                        <xsl:for-each select="children/event[@tense='present']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:value-of select="when/human" /><xsl:if test="location/name != ''"> &#8901; <xsl:value-of
                                select="location/name" /></xsl:if> &#8901; <a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/event[@tense='future']/eventStatus != 'cancelled'">
                    <section>
                        <h2>Upcoming Instances</h2>
                        <xsl:for-each select="children/event[@tense='future']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:value-of select="when/human" /><xsl:if test="location/name != ''"> &#8901; <xsl:value-of
                                select="location/name" /></xsl:if> &#8901; <a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/event[@tense='past']/eventStatus != 'cancelled'">
                    <section>
                        <h2>Past Instances</h2>
                        <xsl:for-each select="children/event[@tense='past']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:value-of select="when/human" /><xsl:if test="location/name != ''"> &#8901; <xsl:value-of
                                select="location/name" /></xsl:if> &#8901; <a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/eventSet[@tense='present']/eventStatus != 'cancelled'">
                    <section>
                        <h2>Current Event Sets</h2>
                        <xsl:for-each select="children/eventSet[@tense='present']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:if test="location/name != ''"><xsl:value-of
                                    select="location/name" /> &#8901; </xsl:if><a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/eventSet[@tense='future']/eventStatus != 'cancelled'">
                    <section>
                        <h2>Upcoming Event Sets</h2>
                        <xsl:for-each select="children/eventSet[@tense='future']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:if test="location/name != ''"><xsl:value-of
                                    select="location/name" /> &#8901; </xsl:if><a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/eventSet[@tense='past']/eventStatus != 'cancelled'">
                    <section>
                        <h2>Past Event Sets</h2>
                        <xsl:for-each select="children/eventSet[@tense='past']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:if test="location/name != ''"><xsl:value-of
                                    select="location/name" /> &#8901; </xsl:if><a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="brilliant/event">
        <xsl:variable name="topMostDescription" select="description[@type='xhtml']" />
        <document>
            <itemscope itemtype="http://schema.org/Event" />
            <title><xsl:value-of select="name" /></title>
            <subtitle><xsl:value-of select="subtitle" /></subtitle>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <template>
                <name><xsl:value-of select="eventCalendar/address" /></name>
            </template>
            <id><xsl:value-of select="id" /></id>
            <summary><xsl:value-of select="when/human" /> &#8901; <xsl:value-of select="description" /></summary>
            <content type="xhtml">
                <section>
                    <xsl:copy-of select="description[@type='xhtml']/*" />
                </section>
                <section>
                    <h2>Details</h2>
                    <table>
                        <tr>
                            <td>When:</td>
                            <td>
                                <span itemprop="startDate"><xsl:attribute name="content" ><xsl:value-of select="when/startDate/text()" /></xsl:attribute><xsl:value-of select="when/human" /></span>
                                <span itemprop="endDate"><xsl:attribute name="content" ><xsl:value-of select="when/endDate/text()" /></xsl:attribute></span>
                            </td>
                        </tr>
                        <tr itemprop="location" itemscope="" itemtype="http://schema.org/Place">
                            <td>Where:</td>
                            <td itemprop="name"><xsl:value-of select="location/name" /></td>
                        </tr>
                        <xsl:if test="eventStatus != 'confirmed'" >
                            <tr>
                                <td>Status:</td>
                                <td><xsl:value-of select="eventStatus" />  <xsl:value-of select="eventStatusReason" /></td>
                            </tr>
                        </xsl:if>
                    </table>
                    <xsl:if test="eventStatus = 'cancelled'" >
                        <meta itemprop="eventStatus" content="http://schema.org/EventCancelled" />
                    </xsl:if>
                    <xsl:if test="eventStatus = 'confirmed'" >
                        <meta itemprop="eventStatus" content="http://schema.org/EventScheduled" />
                    </xsl:if>
                </section>
                <xsl:if test="children/*/event[@tense='present']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Happening Now</h2>
                        <xsl:for-each select="children/*/event[@tense='present']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:value-of select="when/human" /><xsl:if test="location/name != ''"> &#8901; <xsl:value-of
                                select="location/name" /></xsl:if> &#8901; <a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/*/event[@tense='future']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Upcoming</h2>
                        <xsl:for-each select="children/*/event[@tense='future']">
                            <h3><xsl:value-of select="name" /><xsl:if test="subtitle != ''"> // <xsl:value-of select="subtitle" /></xsl:if></h3>
                            <xsl:value-of select="when/human" /><xsl:if test="location/name != ''"> &#8901; <xsl:value-of
                                select="location/name" /></xsl:if> &#8901; <a><xsl:attribute name="href">//dev.<xsl:value-of
                                select="canonical" /></xsl:attribute>details...</a>
                            <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                <p><xsl:copy-of select="description[@type='xhtml']/*" /></p>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>
</xsl:stylesheet>