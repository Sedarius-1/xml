<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="1600" height="2100" font-family="Tahoma ">
            <defs>
                <linearGradient id="unitbar">
                    <stop offset="0%" stop-color="#004FFF" />
                    <stop offset="100%" stop-color="#050505"/>
                </linearGradient>
                <linearGradient id="statbar" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" stop-color="white" />
                    <stop offset="100%" stop-color="gold" />
                </linearGradient>
            </defs>

            <rect x="0" y="0" width="{1600}" height="{2100}" fill="black"/>
            <rect x="{20}" y="{20}" width="{1560}" height="{2060}" style="fill:purple; stroke-width:4; stroke:black; radius:5px;"/>
            <image x="{40}" y="{40}" width="{1520}" height="{920}" href="svg_big.jpg"/>

            <text x="50%" y="{140}" text-anchor="middle" font-size="{100}">Miniatures index statistics</text>
            <text x="{50}" y="{50}" text-anchor="left" font-size="{20}"><xsl:value-of select="Miniatures/Author/Name"/></text>
            <text x="{50}" y="{70}" text-anchor="left" font-size="{20}"><xsl:value-of select="Miniatures/Author/Surname"/></text>
            <text x="{50}" y="{90}" text-anchor="left" font-size="{20}"><xsl:value-of select="Miniatures/Author/Index"/></text>

            <text x="{900}" y="{240}" text-anchor="center" font-size="{50}">Amount of compulsory units:</text>
            <rect x="{40}" y="{270}" width="{1520}" height="{60}" style="fill:#b0b0b0; stroke-width:4; stroke:black;"/>

            <xsl:variable name="miniamc">
                <xsl:value-of select="Miniatures/stats/Unit_Count"/>
            </xsl:variable>
            <xsl:variable name="minicc">
                <xsl:value-of select="count(Miniatures/Unit[@Is_compulsory='true'])"/>
            </xsl:variable>

            <rect x="{40}" y="{270}" height="{60}" style="fill:url(#unitbar) ;stroke-width:4; stroke:black;">
                <animate attributeName="width" attributeType="XML" begin="0s" dur="4s" fill="freeze" from="0" to="{round(((1520 * $minicc) div $miniamc))}"/>
            </rect>
            <text x="{50}" y="{320}" text-anchor="left" font-size="{50}"><xsl:value-of select="$minicc"/>/<xsl:value-of select="$miniamc"/></text>
            <text x="{1075}" y="{460}" text-anchor="left" font-size="{50}">Point costs of units:</text>

            <xsl:variable name="minimin">
                <xsl:value-of select="Miniatures/stats/Minimal_point_cost"/>
            </xsl:variable>
            <xsl:variable name="miniavg">
                <xsl:value-of select="Miniatures/stats/Average_point_cost"/>
            </xsl:variable>
            <xsl:variable name="minimax">
                <xsl:value-of select="Miniatures/stats/Maximal_point_cost"/>
            </xsl:variable>

            <xsl:for-each select="Miniatures/Unit">
                <xsl:variable name="unitname">
                    <xsl:value-of select="Unit_name"/>
                </xsl:variable>
                <text x="{730}" y="{400+200*position()}" text-anchor="center" font-size="{50}"><xsl:value-of select="$unitname"/></text>
                <rect x="{40}" y="{420+200*position()}" width="{1520}" height="{60}" style="fill:#b0b0b0; stroke-width:4; stroke:black;"/>
                <rect x="{40}" y="{420+200*position()}" height="{60}" style="fill:url(#unitbar) ;stroke-width:4; stroke:black;">
                    <animate attributeName="width" attributeType="XML" begin="0s" dur="4s" fill="freeze" from="0" to="{round(((1520 * Point_cost) div $minimax))}"/>
                </rect>
                <text x="{50}" y="{470+200*position()}" text-anchor="left" font-size="{50}"><xsl:value-of select="Point_cost"/>/<xsl:value-of select="$minimax"/></text>

            </xsl:for-each>

            <text x="{730}" y="{1450}" text-anchor="center" font-size="{50}">Minimal point cost/Max point cost:</text>
            <rect x="{40}" y="{1470}" width="{1520}" height="{60}" style="fill:#b0b0b0; stroke-width:4; stroke:black;"/>
            <rect x="{40}" y="{1470}" height="{60}" style="fill:url(#statbar) ;stroke-width:4; stroke:black;">
                <animate attributeName="width" attributeType="XML" begin="0s" dur="4s" fill="freeze" from="0" to="{round(((1520 * $minimin) div $minimax))}"/>
            </rect>

            <text x="{50}" y="{1520}" text-anchor="left" font-size="{50}"><xsl:value-of select="$minimin"/>/<xsl:value-of select="$minimax"/></text>

            <text x="{710}" y="{1650}" text-anchor="center" font-size="{50}">Average point cost/Max point cost:</text>
            <rect x="{40}" y="{1670}" width="{1520}" height="{60}" style="fill:#b0b0b0; stroke-width:4; stroke:black;"/>
            <rect x="{40}" y="{1670}" height="{60}" style="fill:url(#statbar) ;stroke-width:4; stroke:black;">
                <animate attributeName="width" attributeType="XML" begin="0s" dur="4s" fill="freeze" from="0" to="{round(((1520 * $miniavg) div $minimax))}"/>
            </rect>
            <text x="{50}" y="{1720}" text-anchor="left" font-size="{50}"><xsl:value-of select="$miniavg"/>/<xsl:value-of select="$minimax"/></text>

            <text x="{800}" y="{1850}" text-anchor="center" font-size="{50}">Max point cost/Max point cost:</text>
            <rect x="{40}" y="{1870}" width="{1520}" height="{60}" style="fill:#b0b0b0; stroke-width:4; stroke:black;"/>
            <rect x="{40}" y="{1870}" height="{60}" style="fill:url(#statbar) ;stroke-width:4; stroke:black;">
                <animate attributeName="width" attributeType="XML" begin="0s" dur="4s" fill="freeze" from="0" to="{round(((1520 * $minimax) div $minimax))}"/>
            </rect>
            <text x="{50}" y="{1920}" text-anchor="left" font-size="{50}"><xsl:value-of select="$minimax"/>/<xsl:value-of select="$minimax"/></text>

        </svg>
    </xsl:template>
</xsl:stylesheet>