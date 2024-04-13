<?xml version="1.0" encoding="UTF-8"?>
<!--
Extract text from a xml alto and create a xhtml one.

@copyright Daniel Berthereau, 2022
@license CeCILL 2.1 https://cecill.info/licences/Licence_CeCILL_V2.1-fr.txt
-->
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:alto2="http://www.loc.gov/standards/alto/ns-v2#"
    xmlns:alto3="http://www.loc.gov/standards/alto/ns-v3#"
    xmlns:alto4="http://www.loc.gov/standards/alto/ns-v4#"

    exclude-result-prefixes="xsl alto2 alto3 alto4"
    >

    <xsl:output
        method="html"
        omit-xml-declaration="yes"
        standalone="yes"
        indent="yes"
        />

    <!-- End of line (the Linux one, because it's simpler and smarter). -->
    <xsl:param name="end_of_line"><xsl:text>&#x0A;</xsl:text></xsl:param>

    <!-- Create a div for the document. -->
    <xsl:template match="/">
        <!-- The html is not needed for browsers, but more clean for a conversion. -->
        <html>
            <head>
            </head>
            <body>
                <xsl:apply-templates select="//alto2:TextBlock | //alto3:TextBlock | //alto4:TextBlock"/>
                <xsl:value-of select="$end_of_line"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alto2:TextBlock | alto3:TextBlock | alto4:TextBlock">
        <p>
            <xsl:value-of select="$end_of_line"/>
            <xsl:apply-templates select="alto2:TextLine | alto3:TextLine | alto4:TextLine"/>
        </p>
        <xsl:value-of select="$end_of_line"/>
    </xsl:template>

    <xsl:template match="alto2:TextLine | alto3:TextLine | alto4:TextLine">
        <xsl:apply-templates select="alto2:String | alto3:String | alto4:String"/>
        <xsl:value-of select="$end_of_line"/>
        <xsl:if test="position() != last()">
            <br/>
            <xsl:value-of select="$end_of_line"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="alto2:String | alto3:String | alto4:String">
        <xsl:value-of select="@CONTENT"/>
        <xsl:if test="position() != last()">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
