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

    <xsl:template match="brilliant/error">
        <document>
            <title><xsl:value-of select="name/text()" /></title>
            <content type="xhtml">
                <section>
                    <p><xsl:value-of select="message" /></p>
                </section>
            </content>
        </document>
    </xsl:template>

</xsl:stylesheet>