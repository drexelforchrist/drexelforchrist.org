<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="no" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;?xml-stylesheet type="text/xsl" href="/_formatting/xsl/default.xsl"?&gt;&#xa;</xsl:text>
        <doxolo>
            <xsl:if test="lang != ''">
                <lang><xsl:value-of select="doxolo/lang" /></lang>
            </xsl:if>
            <xsl:apply-templates />
        </doxolo>
    </xsl:template>

    <xsl:template match="doxolo/eventCalendar">
        <xsl:variable name="topMostDescription" select="description[@type='xhtml']" />
        <document>
            <title><xsl:value-of select="name" /></title>
            <subtitle><xsl:value-of select="subtitle" /></subtitle>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <template>
                <name><xsl:value-of select="address" /></name>
            </template>
            <id><xsl:value-of select="id" /></id>
            <summary><xsl:value-of select="description" /></summary>
            <content type="xhtml">
                <section>
                    <xsl:copy-of select="description[@type='xhtml']/*" />
                </section>
                <section>


                    <!-- TODO remove and replace with a legitimate thing -->

                    <iframe src="https://www.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=qk2letk797p777abs6g9alhlbui78kel%40import.calendar.google.com&amp;color=%235229A3&amp;src=f7i0ob76ovene2b81ftkcijcg8sjhtoo%40import.calendar.google.com&amp;color=%232952A3&amp;src=hlal0f5pe2832u0t9jj47hok07gjjc1s%40import.calendar.google.com&amp;color=%23AB8B00&amp;src=gbsnkvmb74f1a84ii1spjtl6p3ov9bgj%40import.calendar.google.com&amp;color=%232F6309&amp;src=kqc92veva7o3aiuc4veeqkffcvksrveh%40import.calendar.google.com&amp;color=%23711616&amp;src=mdjno10u33s927vhes7442l1mp2rl7me%40import.calendar.google.com&amp;color=%238C500B&amp;src=vq75c0mikt3uiecu2ujgpi6n24%40group.calendar.google.com&amp;color=%23333333&amp;src=en.usa%23holiday%40group.v.calendar.google.com&amp;color=%23333333&amp;ctz=America%2FNew_York" style="border-width:0 min-width:600px; min-height:600px; width:98%; height:inherit; right:15px;" frameborder="0" scrolling="no" class="narrowHide" />

                    <!--<iframe src="https://www.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=qk2letk797p777abs6g9alhlbui78kel%40import.calendar.google.com&amp;color=%235229A3&amp;src=f7i0ob76ovene2b81ftkcijcg8sjhtoo%40import.calendar.google.com&amp;color=%232952A3&amp;src=hlal0f5pe2832u0t9jj47hok07gjjc1s%40import.calendar.google.com&amp;color=%23AB8B00&amp;src=gbsnkvmb74f1a84ii1spjtl6p3ov9bgj%40import.calendar.google.com&amp;color=%232F6309&amp;src=kqc92veva7o3aiuc4veeqkffcvksrveh%40import.calendar.google.com&amp;color=%23711616&amp;src=mdjno10u33s927vhes7442l1mp2rl7me%40import.calendar.google.com&amp;color=%238C500B&amp;src=vq75c0mikt3uiecu2ujgpi6n24%40group.calendar.google.com&amp;color=%23333333&amp;src=en.usa%23holiday%40group.v.calendar.google.com&amp;color=%23333333&amp;ctz=America%2FNew_York&amp;mode=AGENDA" style="border-width:0 min-width:600px; min-height:600px; width:100%; height:inherit;" frameborder="0" scrolling="no" class="narrowOnly" />-->


                </section>
                <xsl:if test="instances/event[@tense='present']/eventStatus != 'cancelled'">
                    <section class="expandable">
                        <h2>Happening Now</h2>
                        <xsl:for-each select="instances/event[@tense='present']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:value-of select="when/human"/>
                                    <xsl:if test="location/name != ''">
                                        &#8901;
                                        <xsl:value-of select="location/name"/>
                                    </xsl:if>
                                    &#8901;
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="instances/event[@tense='future']/eventStatus != 'cancelled'">
                    <section class="expandable">
                        <h2>Upcoming Events</h2>
                        <xsl:for-each select="instances/event[@tense='future']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:value-of select="when/human"/>
                                    <xsl:if test="location/name != ''">
                                        &#8901;
                                        <xsl:value-of select="location/name"/>
                                    </xsl:if>
                                    &#8901;
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="instances/event[@tense='past']/eventStatus != 'cancelled'">
                    <section class="expandable expandable-closed">
                        <h2>Past Events</h2>
                        <xsl:for-each select="instances/event[@tense='past']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:value-of select="when/human"/>
                                    <xsl:if test="location/name != ''">
                                        &#8901;
                                        <xsl:value-of select="location/name"/>
                                    </xsl:if>
                                    &#8901;
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="doxolo/eventSet">
        <xsl:variable name="topMostDescription" select="description[@type='xhtml']" />
        <document>
            <title><xsl:value-of select="name" /></title>
            <subtitle><xsl:value-of select="subtitle" /></subtitle>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <template>
                <name><xsl:value-of select="eventCalendar/address" /></name>
                <xsl:if test="related/softobject[@type='eventHeader']/softmember[@name='image']/img" >
                    <notitle />
                </xsl:if>
            </template>
            <id><xsl:value-of select="id" /></id>
            <summary><xsl:value-of select="description[@type='text']" /></summary>
            <content type="xhtml">
                <xsl:if test="related/softobject[@type='eventHeader']/softmember[@name='image']/img" >
                    <img class="header">
                        <xsl:attribute name="src">
                            <xsl:value-of select="related/softobject[@type='eventHeader']/softmember[@name='image']/img/@src" />
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="name" />
                        </xsl:attribute>
                    </img>
                </xsl:if>
                <section>
                    <xsl:copy-of select="description[@type='xhtml']/*" />
                </section>
                <xsl:if test="children/*[@tense='present']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Happening Now</h2>
                        <xsl:for-each select="children/*[@tense='present']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:if test="when/human != ''">
                                        <xsl:value-of select="when/human"/>
                                        &#8901;
                                    </xsl:if>
                                    <xsl:if test="location/name != ''">
                                        <xsl:value-of select="location/name"/>
                                        &#8901;
                                    </xsl:if>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/*[@tense='future']/eventStatus != 'cancelled'">
                    <section class="expandable">
                        <h2>Upcoming Events</h2>
                        <xsl:for-each select="children/*[@tense='future']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:if test="when/human != ''">
                                        <xsl:value-of select="when/human"/>
                                        &#8901;
                                    </xsl:if>
                                    <xsl:if test="location/name != ''">
                                        <xsl:value-of select="location/name"/>
                                        &#8901;
                                    </xsl:if>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/*[@tense='past']/eventStatus != 'cancelled'">
                    <section class="expandable expandable-closed">
                        <h2>Past Events</h2>
                        <xsl:for-each select="children/*[@tense='past']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:if test="eventCalendar/address">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">
                                        <xsl:text> // </xsl:text>
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <span>
                                    <xsl:if test="when/human != ''">
                                        <xsl:value-of select="when/human"/>
                                        &#8901;
                                    </xsl:if>
                                    <xsl:if test="location/name != ''">
                                        <xsl:value-of select="location/name"/>
                                        &#8901;
                                    </xsl:if>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>//</xsl:text>
                                            <xsl:value-of select="canonical"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="eventCalendar/address"/>
                                        </xsl:attribute>
                                        <xsl:text>details...</xsl:text>
                                    </a>
                                </span>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="doxolo/event">
        <xsl:variable name="topMostDescription" select="description[@type='xhtml']"/>
        <document>
            <itemscope itemtype="http://schema.org/Event"/>
            <title>
                <xsl:value-of select="name"/>
            </title>
            <subtitle>
                <xsl:value-of select="subtitle"/>
            </subtitle>
            <canonical>
                <xsl:value-of select="canonical"/>
            </canonical>
            <template>
                <name>
                    <xsl:value-of select="eventCalendar/address"/>
                </name>
                <xsl:if test="related/softobject[@type='eventHeader']/softmember[@name='image']/img">
                    <notitle/>
                </xsl:if>
            </template>
            <id>
                <xsl:value-of select="id"/>
            </id>
            <summary>
                <xsl:value-of select="when/human"/> &#8901;
                <xsl:value-of select="description"/>
            </summary>
            <content type="xhtml">
                <xsl:if test="related/softobject[@type='eventHeader']/softmember[@name='image']/img">
                    <img class="header">
                        <xsl:attribute name="src">
                            <xsl:value-of
                                    select="related/softobject[@type='eventHeader']/softmember[@name='image']/img/@src"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="name"/>
                        </xsl:attribute>
                    </img>
                </xsl:if>
                <section itemprop="description">
                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                </section>
                <section>
                    <h2>Details</h2>
                    <table>
                        <tr>
                            <td>When:</td>
                            <td>
                                <span itemprop="startDate">
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="when/startDate/text()"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="when/human"/>
                                </span>
                                <span itemprop="endDate">
                                    <xsl:attribute name="content">
                                        <xsl:value-of select="when/endDate/text()"/>
                                    </xsl:attribute>
                                </span>
                            </td>
                        </tr>
                        <xsl:if test="location/name != ''">
                            <tr itemprop="location" itemscope="" itemtype="http://schema.org/Place">
                                <td>Where:</td>
                                <td itemprop="name">
                                    <xsl:value-of select="location/name"/>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="related/softobject[@type='sermon']/softmember[@name='passage']">
                            <tr>
                                <td>Passage:</td>
                                <td>
                                    <xsl:apply-templates
                                            select="related/softobject[@type='sermon']/softmember[@name='passage']"/>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="related/softobject[@type='sermon']/softmember[@name!='speaker']">
                            <tr>
                                <td>Speaker:</td>
                                <td itemprop="performer">
                                    <xsl:for-each
                                            select="related/softobject[@type='sermon']/softmember[@name='speaker']">
                                        <xsl:apply-templates select="*[1]"/>
                                        <xsl:for-each select="*[position() > 1]">
                                            <br/>
                                            <xsl:apply-templates select="*/.."/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="related/softobject[@type='sermon']/name">
                            <tr>
                                <td>Topic:</td>
                                <td>
                                    <xsl:value-of select="related/softobject[@type='sermon']/name"/>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="owner/person/name/first != ''">
                            <tr>
                                <td>Coordinator:</td>
                                <td>
                                    <xsl:apply-templates select="owner"/>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="eventStatus != 'confirmed'">
                            <tr>
                                <td>Status:</td>
                                <td>
                                    <xsl:value-of select="eventStatus"/>
                                    <xsl:value-of select="eventStatusReason"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </table>
                    <xsl:if test="eventStatus = 'cancelled'">
                        <meta itemprop="eventStatus" content="http://schema.org/EventCancelled"/>
                    </xsl:if>
                    <xsl:if test="eventStatus = 'confirmed'">
                        <meta itemprop="eventStatus" content="http://schema.org/EventScheduled"/>
                    </xsl:if>
                </section>
                <xsl:if test="children/event[@tense='present']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Happening Now</h2>
                        <xsl:for-each select="children/event[@tense='present']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">//
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <xsl:value-of select="when/human"/>
                                <xsl:if test="location/name != ''">
                                    &#8901;
                                    <xsl:value-of select="location/name"/>
                                </xsl:if>
                                &#8901;
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>//</xsl:text>
                                        <xsl:value-of  select="canonical" />
                                    </xsl:attribute>
                                    details...
                                </a>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
                <xsl:if test="children/event[@tense='future']/eventStatus != 'cancelled'"><!-- TODO Replace with something cleaner. -->
                    <section>
                        <h2>Upcoming</h2>
                        <xsl:for-each select="children/event[@tense='future']">
                            <xsl:if test="eventStatus != 'cancelled'">
                                <h3>
                                    <xsl:value-of select="name"/>
                                    <xsl:if test="subtitle != ''">//
                                        <xsl:value-of select="subtitle"/>
                                    </xsl:if>
                                </h3>
                                <xsl:value-of select="when/human"/>
                                <xsl:if test="location/name != ''"> &#8901;
                                    <xsl:value-of select="location/name"/>
                                </xsl:if>
                                &#8901;
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>//</xsl:text>
                                        <xsl:value-of  select="canonical" />
                                    </xsl:attribute>
                                    details...
                                </a>
                                <xsl:if test="description[@type='xhtml'] != $topMostDescription">
                                    <xsl:copy-of select="description[@type='xhtml']/*"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="person">
        <a itemscope="" itemtype="http://schema.org/Person">
            <xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>
            <b itemprop="name"><xsl:value-of select="name/preferred" />&#160;<xsl:value-of select="name/last" /></b>
        </a>
    </xsl:template>

    <xsl:template match="scripture">
        <!--<a>-->
        <!--<xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>-->
        <b><xsl:value-of select="name" /></b>
        <!--</a>-->
    </xsl:template>
</xsl:stylesheet>