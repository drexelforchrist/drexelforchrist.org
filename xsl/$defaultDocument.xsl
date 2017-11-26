<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;?xml-stylesheet type="text/xsl" href="/_formatting/xsl/default.xsl"?&gt;&#xa;</xsl:text>
        <doxolo>
            <xsl:if test="lang != ''">
                <lang><xsl:value-of select="doxolo/lang" /></lang>
            </xsl:if>
            <xsl:apply-templates />
        </doxolo>
    </xsl:template>

    <xsl:template match="doxolo/softclass">
        <document>
            <title><xsl:value-of select="name" /></title>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <id><xsl:value-of select="id" /></id>
            <content type="xhtml">
                <section>
                    <table>
                        <tr>
                            <th />
                            <xsl:for-each select="softmember">
                                <th><a><xsl:attribute name="href"><xsl:value-of select="concat('?_sort:+',@name)" /></xsl:attribute><xsl:value-of select="@title" /></a></th>
                            </xsl:for-each>
                        </tr>
                        <xsl:for-each select="softobject">
                            <tr>
                                <td>
                                    <xsl:if test="name != ''">
                                        <a>
                                            <xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>
                                            <b><xsl:value-of select="name/text()" /></b>
                                        </a>
                                    </xsl:if>
                                </td>
                                <xsl:for-each select="softmember" >
                                    <td>
                                        <xsl:apply-templates select="*[1]" />
                                        <xsl:for-each select="*[position() > 1]">
                                            <br /><xsl:apply-templates select="*/.." />
                                        </xsl:for-each>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </table>
                </section>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="doxolo/softobject">
        <document>
            <title><xsl:value-of select="name" /></title>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <id><xsl:value-of select="id" /></id>
            <content type="xhtml">
                <section>
                    <table>
                        <xsl:for-each select="softmember">
                            <tr>
                                <td><xsl:value-of select="@title" /></td>
                                <td><xsl:apply-templates select="*" /></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </section>
            </content>
        </document>
    </xsl:template>

    <xsl:template match="event">
        <a>
            <xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>
            <b><xsl:value-of select="name/text()" /></b>
            <xsl:if test="subtitle/text() != ''">
                : <xsl:value-of select="subtitle/text()" />
            </xsl:if>
        </a>
        <xsl:if test="when/human">
            <br /><xsl:value-of select="when/human/text()" />
        </xsl:if>
    </xsl:template>

    <xsl:template match="person">
        <a>
            <xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>
            <b><xsl:value-of select="name/preferred" />&#160;<xsl:value-of select="name/last" /></b>
        </a>
    </xsl:template>

    <xsl:template match="scripture">
        <!--<a>-->
            <!--<xsl:attribute name="href">//<xsl:value-of select="canonical/text()" /></xsl:attribute>-->
            <b><xsl:value-of select="name" /></b>
        <!--</a>-->
    </xsl:template>

    <xsl:template match="img">
        <xsl:copy-of select=".." />
    </xsl:template>

</xsl:stylesheet>