<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date">
    <xsl:output method="html" encoding="utf-8" indent="yes" />

    <!--<xsl:param name="relative-day">-->
        <!--<xsl:choose>-->
            <!--<xsl:when test="$year &gt;= 1 or $month &gt;= 1">-->
                <!--<xsl:value-of select="concat(format-number($year,'0000'),'-',format-number($month ,'00'),'-',$this-day)" />-->
            <!--</xsl:when>-->
            <!--<xsl:otherwise>-->
                <!--<xsl:value-of select="$today" />-->
            <!--</xsl:otherwise>-->
        <!--</xsl:choose>-->
    <!--</xsl:param>-->


    <!-- Calculate the offset to the first day in this month -->
    <xsl:variable name="first-day-offset">
        <xsl:text>-P</xsl:text>
        <!--<xsl:value-of select="date:day-in-month($relative-day) - 1" />-->
        <xsl:text>D</xsl:text>
    </xsl:variable>

    <!--<xsl:variable name="first-of-month"	select="date:add($relative-day, $first-day-offset)" />-->




    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>

            <style>
                div.week {
                    display:table-row;
                    height: 100px;
                    width:100%;
                }
                div.weekLabel {
                    display: table-cell;
                    width: 12.5%;
                }
                div.weekContent {
                    display:table;
                    width: 87.5%;
                }
                div.day {
                    display: table-cell;
                    width: 12.5%;
                }
            </style>


            <xsl:for-each select="calendar/week">
                <div class="week">
                    <div class="weekLabel">
                        <xsl:value-of select="@name" />
                    </div>
                    <div class="weekContent">
                        <xsl:for-each select="day">
                            <div class="day">
                                <xsl:value-of select="@number" />
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </xsl:for-each>


        </html>
    </xsl:template>
</xsl:stylesheet>
