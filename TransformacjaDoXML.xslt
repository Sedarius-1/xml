<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xd="http://www.xD.com/WarhammerRepo"
                xmlns:xn="http://www.xD.com/Author">
    <xsl:key name="types" match="xd:types/xd:type" use="@id" />
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:variable name="avg" select="avg(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
        <xsl:variable name="min" select="min(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
        <xsl:variable name="max" select="max(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:unitData/xd:pointCost)"/>
        <xsl:element name="Miniatures">
            <xsl:element name="Author">
                <xsl:element name="Name">
                    <xsl:value-of select="xd:Main/xd:author/xn:name"/>
                </xsl:element>
                <xsl:element name="Surname">
                    <xsl:value-of select="xd:Main/xd:author/xn:surname"/>
                </xsl:element>
                <xsl:element name="Index">
                    <xsl:value-of select="xd:Main/xd:author/xn:index"/>
                </xsl:element>
            </xsl:element>
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
                    <xsl:attribute name="Is_compulsory">
                        <xsl:value-of select="@compulsory" />
                    </xsl:attribute>
                    <xsl:element name="Unit_type">
                        <xsl:value-of select="key('types', @idref)"/>
                    </xsl:element>
                    <xsl:element name="Unit_name">
                        <xsl:value-of select="xd:name"/>
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
                    <xsl:variable name="cost" select="xd:pointCost"/>
                    <xsl:element name="Difference_from_avg">
                        <xsl:value-of select="abs($avg - $cost)"/>
                    </xsl:element>
                    <xsl:element name="Difference_from_min">
                        <xsl:value-of select="abs($min - $cost)"/>
                    </xsl:element>
                    <xsl:element name="Difference_from_max">
                        <xsl:value-of select="abs($max - $cost)"/>
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
                    <xsl:value-of select="$avg"/>
                </xsl:element>
                <xsl:element name="Minimal_point_cost">
                    <xsl:value-of select="$min"/>
                </xsl:element>
                <xsl:element name="Maximal_point_cost">
                    <xsl:value-of select="$max"/>
                </xsl:element>
                <xsl:element name="Miniatures_Count">
                    <xsl:value-of select="count(xd:Main/xd:warhammerRepo/xd:army/xd:unit/xd:miniature)"/>
                </xsl:element>
                <xsl:element name="Unit_Count">
                    <xsl:value-of select="count(xd:Main/xd:warhammerRepo/xd:army/xd:unit)"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>