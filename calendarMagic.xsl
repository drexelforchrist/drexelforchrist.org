<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">
    <xsl:import href="xslTemplates/date.add.template.xsl" />
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <xsl:variable name="today" select="date:date-time()" />





    <xsl:template name="calendar">
        <xsl:param name="year" />
        <xsl:param name="month" />
        <xsl:param name="this-day" />

        <xsl:param name="relative-day">

            <xsl:choose>
                <xsl:when test="$year &gt;= 1 or $month &gt;= 1">
                    <xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month ,'00'),'-',$this-day)" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$today" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>


        <!-- Calculate the offset to the first day in this month -->
        <xsl:variable name="first-day-offset">
            <xsl:text>-P</xsl:text>
            <xsl:value-of select="date:day-in-month($relative-day) - 1" />
            <xsl:text>D</xsl:text>
        </xsl:variable>

        <xsl:variable name="first-of-month">
            <xsl:call-template name="date:add">
                <xsl:with-param name="date-time" select="$relative-day" />
                <xsl:with-param name="duration" select="$first-day-offset" />
            </xsl:call-template>
        </xsl:variable>

        <!-- Calculate the offset to the first Sunday before or on the
        first of this month -->

        <xsl:variable name="first-sunday-offset">
            <xsl:text>-P</xsl:text>
            <xsl:value-of select="date:day-in-week($first-of-month) - 1" />
            <xsl:text>D</xsl:text>
        </xsl:variable>
        <xsl:variable name="start-of-calendar" >
            <xsl:call-template name="date:add">
                <xsl:with-param name="date-time" select="$first-of-month" />
                <xsl:with-param name="duration" select="$first-sunday-offset" />
            </xsl:call-template>
        </xsl:variable>

        <table id="cal"	summary="Calendar for {date:month-name($relative-day)} {date:year($relative-day)}">

            <!-- generate caption with name of month plus links to preceding
            and following months -->
            <tr>
                <th class="month-nav" colspan="7">
                    <!--<xsl:call-template name="preceding-month">-->
                    <!--<xsl:with-param name="date" select="$relative-day"/>-->
                    <!--</xsl:call-template>-->

                    <xsl:value-of select="date:month-name($relative-day)"/>
                    <xsl:text>&#xa0;</xsl:text>
                    <xsl:value-of select="date:year($relative-day)"/>

                    <!--<xsl:call-template name="following-month">-->
                    <!--<xsl:with-param name="date" select="$relative-day"/>-->
                    <!--</xsl:call-template>-->
                </th>
            </tr>
            <tr>
                <th>Sunday</th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
            </tr>

            <!-- Call the template with two parameters: where to start and
            when to end -->

            <xsl:call-template name="calendar-week">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="start-date" select="$start-of-calendar" />
                <xsl:with-param name="for-month" select="date:month-in-year($relative-day)" />
            </xsl:call-template>
        </table>
    </xsl:template>




    <!-- calendar-week recursively calls itself until the month of the Sunday of the following week differs from for-month, at which point it exits. It may have been slightly more efficient (in terms of memory) to do tail-recursion; however, the cost would have been excessive copying of the result tree. As the depth of this recursion will never exceed 6, the danger of overflowing the stack is small. Note that calendar-week does not let calendar-day perform the recursion; since the number of iterations is fixed and small, unrolling the loop seemed to be the obvious optimization.

Note: if Mia has a year-long dry spell, this template is screwed. -->

    <xsl:template name="calendar-week">
        <xsl:param name="relative-day" />
        <xsl:param name="start-date" />
        <xsl:param name="for-month" />

        <tr>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" select="$start-date" />
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P1D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P2D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P3D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P4D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P5D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
            <xsl:call-template name="calendar-day">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="day" >
                    <xsl:call-template name="date:add">
                        <xsl:with-param name="date-time" select="$start-date" />
                        <xsl:with-param name="duration" select="'P6D'" />
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="for-month" select="$for-month" />
            </xsl:call-template>
        </tr>

        <xsl:variable name="next-week" >
            <xsl:call-template name="date:add">
                <xsl:with-param name="date-time" select="$start-date" />
                <xsl:with-param name="duration" select="'P7D'" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$for-month = date:month-in-year($next-week)">
            <xsl:call-template name="calendar-week">
                <xsl:with-param name="relative-day" select="$relative-day" />
                <xsl:with-param name="start-date" select="$next-week"/>
                <xsl:with-param name="for-month" select="$for-month"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>





    <!-- Most of calendar-day is elided here, as it is specific to Condensed Comics. Note that since the recursion was unrolled in calendar-week above, the template is straightforward: -->


    <xsl:template name="calendar-day">
        <xsl:param name="relative-day" />
        <xsl:param name="day" />
        <xsl:param name="for-month" />

        <td>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="$for-month != date:month-in-year($day)">
                        <xsl:text>other-month</xsl:text>
                    </xsl:when>
                    <xsl:when test="$today = $day">
                        <xsl:text>this-day</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>this-month</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="$relative-day" />
            </xsl:attribute>

            <!-- Generate either a link or just a text node
            containing date:day-of-month($day) -->
            <xsl:call-template name="optional-hyperlink-to-date">
                <xsl:with-param name="day" select="$day" />
            </xsl:call-template>
        </td>
    </xsl:template>


    <!-- override this to change what goes in the td -->
    <xsl:template name="optional-hyperlink-to-date">
        <xsl:param name="day" />
        <xsl:value-of select="$day" />
        <!--<xsl:call-template name="format-date">-->
        <!--<xsl:with-param name="date" select="$day"/>-->
        <!--<xsl:with-param name="format" select="'D'"/>-->
        <!--</xsl:call-template>-->
        <!--<ul>-->
        <!--&lt;!&ndash;<xsl:apply-templates select="/data/*[starts-with(name(), 'schedule')]" mode="events">&ndash;&gt;-->
        <!--&lt;!&ndash;<xsl:with-param name="day" select="$day" />&ndash;&gt;-->
        <!--&lt;!&ndash;</xsl:apply-templates>&ndash;&gt;-->
        <!--</ul>-->
    </xsl:template>


    <xsl:template match="/">
        yo.
        <xsl:call-template name="calendar">
            <xsl:with-param name="month">6</xsl:with-param>
            <xsl:with-param name="year">2015</xsl:with-param>
            <xsl:with-param name="this-day">16</xsl:with-param>
        </xsl:call-template>
    </xsl:template>


</xsl:stylesheet>
