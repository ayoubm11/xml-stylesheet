<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>Liste des codes HTTP</head>
            <body>
                <h1> CODE HTTP </h1>
                <table border="1">
                    <tr>
                        <th>Code</th>
                        <th>Message</th>
                        <th>Descreption</th>
                    </tr>
                    <xsl:for-each select="//http-code">
                        <tr>
                            <td><xsl:value-of select="@code"/></td>
                            <td>
                                <xsl:if test="message">
                                    <xsl:value-of select="/message"/>
                                </xsl:if>
                                <xsl:if test="not(message)">
                                    <xsl:text>🚫</xsl:text>
                                </xsl:if>    
                            </td>
                            <td><xsl:value-of select="signification"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>