<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xd="http://www.xD.com/WarhammerRepo">
    <xsl:key name="types" match="xd:types/xd:type" use="@id" />
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:element name="Miniatures">
            <xsl:element name="Date">
                <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
            </xsl:element>
            <xsl:for-each select="xd:Main/xd:warhammerRepo/xd:army">
                <xsl:element name="Army">
                    <xsl:element name="Army_name">
                        <xsl:value-of select="xd:armyData/xd:name"/>
                    </xsl:element>
                    <xsl:element name="Allegiance">
                        <xsl:value-of select="xd:armyData/xd:allegiance"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData">
                <xsl:element name="Unit">
                    <xsl:element name="Unit_name">
                        <xsl:value-of select="xd:name"/>
                    </xsl:element>
                    <xsl:element name="Unit_type">
                        <xsl:value-of select="key('types', @idref)"/>
                    </xsl:element>
                    <xsl:element name="Is_compulsory">
                        <xsl:value-of select="@compulsory" />
                    </xsl:element>
                    <xsl:element name="Movement">
                        <xsl:value-of select="xd:movement"/>
                    </xsl:element>
                    <xsl:element name="WS">
                        <xsl:value-of select="xd:WS"/>
                    </xsl:element>
                    <xsl:element name="BS">
                        <xsl:value-of select="xd:BS"/>
                    </xsl:element>
                    <xsl:element name="Strength">
                        <xsl:value-of select="xd:S"/>
                    </xsl:element>
                    <xsl:element name="Toughness">
                        <xsl:value-of select="xd:T"/>
                    </xsl:element>
                    <xsl:element name="Leadership">
                        <xsl:value-of select="xd:Ld"/>
                    </xsl:element>
                    <xsl:element name="Save">
                        <xsl:value-of select="xd:Save"/>
                    </xsl:element>
                    <xsl:element name="Point_cost">
                        <xsl:value-of select="xd:pointCost"/>
                    </xsl:element>
                    <xsl:element name="Battlefield_role">
                        <xsl:value-of select="xd:role"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:miniature">
                <xsl:element name="Miniature">
                    <xsl:element name="Miniature_name">
                        <xsl:value-of select="xd:name"/>
                    </xsl:element>
                    <xsl:element name="Assembly_date">
                        <xsl:value-of select="xd:assemblyDate"/>
                    </xsl:element>
                    <xsl:element name="Paint_date">
                        <xsl:value-of select="xd:paintDate"/>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            <xsl:element name="stats">
                <xsl:element name="Average_point_cost">
                    <xsl:value-of select="avg(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
                </xsl:element>
                <xsl:element name="Minimal_point_cost">
                    <xsl:value-of select="min(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
                </xsl:element>
                <xsl:element name="Maxmial_point_cost">
                    <xsl:value-of select="max(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>