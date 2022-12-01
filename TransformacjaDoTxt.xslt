<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="no"/>
    <xsl:template match="/">
        <xsl:value-of select="Miniatures/Author/Name"></xsl:value-of>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Miniatures/Author/Surname"></xsl:value-of>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Miniatures/Author/Index"></xsl:value-of>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Miniatures/Date"></xsl:value-of>
        <xsl:text>&#xD;</xsl:text> <!-- przejście do nowej linii -->
        <xsl:text>Miniatures: </xsl:text>
        <xsl:value-of select="Miniatues/stats/Miniatures_count"/>
        <xsl:text>&#xD;</xsl:text>
        <xsl:text>Miniature name                               </xsl:text>
        <xsl:text>Assembly date                   </xsl:text>
        <xsl:text>Paint date     </xsl:text>
        <xsl:text>&#xD;</xsl:text>
        <xsl:for-each select="Miniatures/Miniature">
            <xsl:call-template name="pad">
                <xsl:with-param name="length" select="45"/>
                <xsl:with-param name="value" select="normalize-space(Miniature_name)"/>
            </xsl:call-template>
            <xsl:call-template name="pad">
                <xsl:with-param name="length" select="30"/>
                <xsl:with-param name="value" select="normalize-space(Assembly_date)"/>
            </xsl:call-template>
            <xsl:call-template name="pad">
                <xsl:with-param name="length" select="15"/>
                <xsl:with-param name="value" select="normalize-space(Paint_date)"/>
            </xsl:call-template>
            <xsl:text>&#xD;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="pad">
        <xsl:param name="value"/>
        <xsl:param name="length"/>
        <xsl:variable name="padding"
                      select="'                                             '"/>
        <xsl:value-of select="concat($value,substring(substring($padding,1,$length),string-length($value)))"/>
    </xsl:template>
</xsl:stylesheet>