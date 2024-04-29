<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />

                <link rel="stylesheet" type="text/css" href="stile_pag.css" />
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
                <!-- Font awesome -->
                <script src="https://kit.fontawesome.com/631a8dead6.js" crossorigin="anonymous"></script>
            </head>
            <body>
                <a class= "statua" href="index.html">
                    <img src="img_ciano1.jpeg" />
                </a>
                <main>
                    <nav id="info">
                        <div class="card">
                            <div class="container">
                                <a href="fascicolo1.html">
                                    <img src="statua1_ciano_pag1.jpeg" alt="fascicolo1" style="width:100%" />
                                    <h4><b>Fascicolo 1</b></h4> 
                                    <p>Descrizione Fascicolo 1</p> 
                                </a>
                            </div>
                            
                            <div class="container">
                                <a href="fascicolo2.html">
                                    <img src="statua2_ciano_pag1.jpeg" alt="fascicolo2" style="width:100%" />
                                    <h4><b>Fascicolo 2</b></h4> 
                                    <p>Descrizione Fascicolo 2</p> 
                                </a>
                            </div>
                            
                            <div class="container">
                                <a href="fascicolo3.html">
                                    <img src="statua3_ciano_pag1.jpeg" alt="fascicolo3" style="width:100%" />
                                    <h4><b>Fascicolo 3</b></h4> 
                                    <p>Descrizione Fascicolo 3</p> 
                                </a>
                            </div>
                        </div>
                        <ul class="navbar">
                            <h2>Informazioni sui documenti</h2>
                            <li><a href="index.html">Torna alla Home Page</a></li>
                            <li><a href="pagina_persone.html">Vai alla lista delle persone</a></li>
                            <li><a href="pagina_organizzazioni.html">Vai alla lista delle organizzazioni</a></li>
                            <li><a href="pagina_oggetti.html">Vai alla lista delle navi</a></li>
                          
                        </ul>
                    </nav>
                    
                    <div id="listaLuoghi">
                        <h2>Lista Luoghi</h2>
                        <div>
                            <xsl:apply-templates select="//tei:listPlace" />
                            <xsl:element name="br"></xsl:element>
                        </div>
                    </div>
                    
                </main>
                <!-- footer -->
                <a class= "statua" href="index.html">
                    <img src="img_ciano2.jpeg" />
                </a>
                <footer class="riferimenti">
                    <section>
                        <div>
                            <h2>Credits</h2>
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt" />
                        </div>
                        <div>
                            <h2>Il progetto</h2>
                            <p>
                            Il progetto nasce dal corso magistrale di Storia Pubblica Digitale della facoltà Informatica Umanistica dell'università di Pisa.
                            <a href="https://www.unipi.it/"> </a>
                            </p>
                        </div>
                        <div id="logo">
                            <img src="cherubino_white.png" />
                        </div>
                    </section>
                    
                </footer>
                <!-- javaScript -->
                <script src="ciano.js"></script>
            </body>
        </html>
    </xsl:template>

    
    <xsl:template match="tei:listPlace">
        <xsl:for-each select="tei:place">
            <xsl:element name="li">
                <xsl:attribute name="class">ord_list</xsl:attribute>
                <xsl:element name="b">
                    <xsl:value-of select="tei:settlement | tei:country | tei:region | tei:geogName" />
                </xsl:element>
            </xsl:element>    
        </xsl:for-each> 
    </xsl:template>

    <!--lista Organizzazioni-->

    <!--crediti Footer-->
    <xsl:template match="tei:editionStmt">
        <p><xsl:value-of select="tei:origin"/></p>
        <xsl:for-each select="tei:respStmt"> 
            <p><xsl:value-of select="tei:resp"/></p>
            <ul>
            <xsl:for-each select="tei:name">
                <li><xsl:apply-templates/></li>
            </xsl:for-each> 
            </ul>
        </xsl:for-each> 
    </xsl:template>

    
</xsl:stylesheet>