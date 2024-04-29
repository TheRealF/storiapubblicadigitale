<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />

                <link rel="stylesheet" type="text/css" href="stile_pag.css" />
                
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

                <!-- Font awesome -->
                <script src="https://kit.fontawesome.com/631a8dead6.js" crossorigin="anonymous"></script>
            </head>
            <body>

         
                <a class= "statua" href="index.html">
                    <img src="img_ciano1.jpeg" />
                </a>
                <main>
                    <div class="card_descrizione">
                        <xsl:apply-templates select="//tei:sourceDesc[@xml:id='intero_documento']" />
                    </div>
                    <section class="descrizione">
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:physDesc[@xml:id='fascicoli12']" />
                        </div>
                    </section>
                    <section class="descrizione"> 
                        <div class="card_descrizione">
                            <xsl:apply-templates select="//tei:history[@xml:id='intero_doc']" />
                        </div>                 
                    </section>
                    
                    <nav id="info">
                        <h2> I documenti</h2>
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
                            <li><a href="pagina_persone.html">Vai alla lista delle persone</a></li>
                            <li><a href="pagina_posti.html">Vai alla lista dei posti</a></li>
                            <li><a href="pagina_organizzazioni.html">Vai alla lista delle organizzazioni</a></li>
                            <li><a href="pagina_oggetti.html">Vai alla lista delle navi</a></li>
                          
                        </ul>
                    </nav>
                   
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
                            Il progetto nasce dal corso magistrale in Informatica Umanistica per l'esame di Storia Pubblica Digitale, dell'università di Pisa.
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


    <!-- Caratteristiche fascicoli-->
    <xsl:template match="tei:sourceDesc[@xml:id='intero_documento']">
        <xsl:for-each select="tei:msDesc">  
            <h2>Caratteristiche</h2>
            <h3>Titolo:</h3>
            <p><xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/></p>
            <p><xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/></p>
            <h3>Conservazione:</h3>
            <p><xsl:value-of select="//tei:msIdentifier/tei:repository[@xml:id='doc_int']"/></p>
            <h3>Data:</h3>
            <p><xsl:value-of select="//tei:editionStmt/tei:edition/tei:date"/></p>
        </xsl:for-each>   
    </xsl:template>

    <!--Descrizione fisica-->
    <xsl:template match="tei:physDesc[@xml:id='fascicoli12']">
        <xsl:for-each select="tei:objectDesc/tei:supportDesc">
            <h2>Descrizione fisica</h2>
            <h3>Supporto:</h3>
            <p><xsl:value-of select="//tei:support[@xml:id='fasc123']"/></p>
            <h3>Estensione:</h3>
            <p><xsl:value-of select="//tei:extent/tei:measureGrp/tei:measure"/></p>
            <h3>Condizioni:</h3>   
            <p><xsl:value-of select="//tei:condition[@xml:id='condiz_doc']"/></p>
            <h3>Pagine:</h3>
            <p><xsl:value-of select="//tei:layoutDesc/tei:layout"/></p>
        </xsl:for-each>
        <h3>Mani:</h3>
            <p><xsl:value-of select="//tei:handDesc[@xml:id='firma_docint']"/></p>
    </xsl:template>
    
    <!--Storia-->
    <xsl:template match="tei:history[@xml:id='intero_doc']">
        <h2>Storia digitale:</h2>
        <p><xsl:value-of select="tei:origin"/></p>
    </xsl:template>
    
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

