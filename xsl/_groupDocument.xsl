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

    <xsl:template match="doxolo/group">
        <document>
            <title><xsl:value-of select="name" /></title>
            <canonical><xsl:value-of select="canonical" /></canonical>
            <id><xsl:value-of select="id" /></id>
            <content type="xhtml">
                <section>
                    <p>This group is a thing.</p>
                </section>
                <xsl:if test="members">
                    <section>
                        <h2>Members</h2>
                        <table>
                        <xsl:for-each select="members/member">
                            <tr>
                                <td><xsl:value-of select="person/name/preferred/text()" /></td>
                                <td><xsl:value-of select="substring(person/name/last/text(),1,1)" />.</td>
                            </tr>
                        </xsl:for-each>
                        </table>
                    </section>
                </xsl:if>
            </content>
        </document>
    </xsl:template>

</xsl:stylesheet>