<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/">
        <html xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>DZIAŁA</title>
                <link rel="stylesheet" href="html-css.css"/>
                <script type="text/javascript" src="scripts.js"/>
            </head>
            <body onload="JavaScript: all();">
                <div id="headerDiv">
                    <img src="eagle.png" alt="eagle"></img>
                    <h1>Miniature index</h1>
                </div>
                <table>
                    <tr class="firstRow">
                        <th>Army</th>
                        <th>Allegiance</th>
                    </tr>
                    <xsl:for-each select="Miniatures/Army">
                        <tr>
                            <td>
                                <xsl:value-of select="Army_name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Allegiance" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr class="firstRow">
                        <th>Unit</th>
                        <th>Unit Type</th>
                        <th>Is Compulsory?</th>
                        <th>Movement</th>
                        <th>WS</th>
                        <th>BS</th>
                        <th>S</th>
                        <th>T</th>
                        <th>Ld</th>
                        <th>Save</th>
                        <th>Role</th>
                        <th>Point Cost</th>
                        <th>Diff from avg cost</th>
                        <th>Diff from min cost</th>
                        <th>Diff from max cost</th>
                    </tr>
                    <xsl:for-each select="Miniatures/Unit">
                        <tr>
                            <td>
                                <span class="replaceme">
                                    <xsl:value-of select="Unit_name"/>
                                </span>
                            </td>
                            <td>
                                <span class="id">
                                    <xsl:value-of select="Unit_type" />
                                </span>
                            </td>
                            <td>
                                <span class="compulsory">
                                    <xsl:value-of select="@Is_compulsory" />
                                </span>
                            </td>
                            <td><xsl:value-of select="Movement"/></td>
                            <td><xsl:value-of select="WS"/></td>
                            <td><xsl:value-of select="BS"/></td>
                            <td><xsl:value-of select="Strength"/></td>
                            <td><xsl:value-of select="Toughness"/></td>
                            <td><xsl:value-of select="Leadership"/></td>
                            <td><xsl:value-of select="Save"/></td>
                            <td><xsl:value-of select="Battlefield_role"/></td>
                            <td><xsl:value-of select="Point_cost"/></td>
                            <td>
                                <xsl:value-of select="Difference_from_avg"/>
                            </td>
                            <td>
                                <xsl:value-of select="Difference_from_min"/>
                            </td>
                            <td>
                                <xsl:value-of select="Difference_from_max"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr class="firstRow">
                        <th>Miniature</th>
                        <th>Date of assembling</th>
                        <th>Date of painting</th>
                    </tr>
                    <xsl:for-each select="Miniatures/Miniature">
                        <tr>
                            <td>
                                <span class="replaceme">
                                    <xsl:value-of select="Miniature_name"/>
                                </span>
                            </td>
                            <td>
                                <span class="reverseDate">
                                    <xsl:value-of select="Assembly_date"/>
                                </span>
                            </td>
                            <td>
                                <span class="reverseDate">
                                    <xsl:value-of select="Paint_date"/>
                                </span>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <th>Amount of units</th>
                        <th>Minimal unit point cost</th>
                        <th>Average unit point cost</th>
                        <th>Maximal unit point cost</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="Miniatures/stats/Unit_Count"/>
                        </td>
                        <td>
                            <xsl:value-of select="Miniatures/stats/Minimal_point_cost"/>
                        </td>
                        <td>
                            <xsl:value-of select="Miniatures/stats/Average_point_cost"/>
                        </td>
                        <td>
                            <xsl:value-of select="Miniatures/stats/Maximal_point_cost"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>