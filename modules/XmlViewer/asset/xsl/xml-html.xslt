<?xml version="1.0" encoding="UTF-8"?>
<!--
Convert a xml file into a xhtml one to be processed by a browser and used in a iframe.

@copyright Daniel Berthereau, 2021
@license CeCILL 2.1 https://cecill.info/licences/Licence_CeCILL_V2.1-fr.txt
-->
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    >

    <xsl:output
        method="html"
        omit-xml-declaration="yes"
        standalone="yes"
        indent="yes"
        />

    <!-- Copy every nodes (not attributes and elements). -->
    <xsl:template match="node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Create a div for the document. -->
    <xsl:template match="/">
        <!-- The html is not needed for browsers, but more clean for a conversion. -->
        <html>
            <head>
                <!-- The stylesheet is not included as a link to avoid issue with base path. -->
                <!--
                <link rel="stylesheet" type="text/css" href="/modules/XmlViewer/asset/css/xml-html.css"/>
                -->
                <style>
                    .tag .name {
                        font-family: monospace;
                        color: purple;
                    }
                    .tag .attr .name {
                        font-family: monospace;
                        color: chocolate;
                    }
                    .tag .attr .value {
                        color: blue;
                    }
                    .tag .tag {
                        margin-left: 1em;
                    }
                    .tag.comment {
                        color: gray;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="node()"/>
            </body>
        </html>
    </xsl:template>

    <!-- Create a div for the root and the namespace. -->
    <xsl:template match="/*">
            <div class="tag">
            <xsl:text>&lt;</xsl:text>
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="/namespace::*[name() != 'xml']">
                <xsl:text> xmlns:</xsl:text>
                <xsl:text>="</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"</xsl:text>
            </xsl:for-each>
            <xsl:text>&gt;</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text>&lt;/</xsl:text>
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:text>&gt;</xsl:text>
        </div>
    </xsl:template>

    <!-- Create a span element around each tag. -->
    <xsl:template match="*" priority="10">
        <div class="tag">
            <xsl:text>&lt;</xsl:text>
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:apply-templates select="@*"/>
            <xsl:text>&gt;</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text>&lt;/</xsl:text>
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:text>&gt;</xsl:text>
        </div>
    </xsl:template>

    <!-- Create a span element around each attribute key/value. -->
    <xsl:template match="@*" priority="10">
        <xsl:text> </xsl:text>
        <span class="attr">
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:text>="</xsl:text>
            <span class="value">
                <xsl:value-of select="."/>
            </span>
            <xsl:text>"</xsl:text>
        </span>
    </xsl:template>

    <!-- Create a div for the proocessing instructions. -->
    <xsl:template match="processing-instruction()" priority="10">
        <div class="tag processing-instruction">
            <xsl:text>&lt;?</xsl:text>
            <span class="name">
                <xsl:value-of select="name()"/>
            </span>
            <xsl:text> </xsl:text>
            <span class="value">
                <xsl:value-of select="."/>
            </span>
            <xsl:text> ?&gt;</xsl:text>
        </div>
    </xsl:template>

    <!-- Don't display stylesheet. In most of cases, the current one is the only one, so it is removed. -->
    <xsl:template match="processing-instruction()[name() = 'xml-stylesheet']" priority="10">
    </xsl:template>

    <!-- Create a div for the comment. -->
    <xsl:template match="comment()" priority="10">
        <div class="tag comment">
            <xsl:text>&lt;-- </xsl:text>
            <xsl:value-of select="."/>
            <xsl:text> --&gt;</xsl:text>
        </div>
    </xsl:template>

</xsl:stylesheet>
