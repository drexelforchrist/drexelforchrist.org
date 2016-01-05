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

    <xsl:template match="brilliant/soft">
        <document>
            <title><xsl:value-of select="name" /></title>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <id><xsl:value-of select="id" /></id>
            <content type="xhtml">
                <section>
                    <table>
                        <xsl:for-each select="softmember">
                            <tr>
                                <td><xsl:value-of select="@type" /></td>
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
            <xsl:attribute name="href">http://dev.<xsl:value-of select="canonical/text()" /></xsl:attribute><!-- TODO remove dev. -->
            <b><xsl:value-of select="name/text()" /></b>
            <xsl:if test="subtitle">
                : <xsl:value-of select="subtitle/text()" />
            </xsl:if>
        </a>
        <xsl:if test="when/human">
            <br /><xsl:value-of select="when/human/text()" />
        </xsl:if>
    </xsl:template>
    <xsl:template match="person">
        <a>
            <xsl:attribute name="href">http://dev.<xsl:value-of select="canonical/text()" /></xsl:attribute><!-- TODO remove dev. -->
            <b><xsl:value-of select="name/preferred" />&#160;<xsl:value-of select="name/last" /></b>
        </a>
    </xsl:template>

</xsl:stylesheet>