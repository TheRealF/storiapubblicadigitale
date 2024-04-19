<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="/">
    <html>
      <head>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">⠀</script>
        <script src="map.js">⠀</script>
        <script src="main.js">⠀</script>
        <script src="references.js">⠀</script>
        <script src="magnifier.js">⠀</script>
        <script src="jquery.maphilight.js">⠀</script>
      </head>
      <body>

        <header>
          <h1><xsl:value-of select="//tei:title"/></h1>
          <ul>
            <li></li>
            <li></li>
          </ul>
        </header>
        <section id="info">
          <div class="col-1">⠀</div>
          <div id="accordionBtn_1" class="container col-4-5 accordion">
            <ul>
              <li>
                <h1>Informazioni sulla lettera</h1>
                <span id="frecciaUp_1" class="freccia up">⠀</span>
                <span id="frecciaDown_1" class="freccia down">⠀</span>
                <ul id="accordionUl_1"><xsl:apply-templates select="//tei:sourceDesc"/></ul>
              </li>
            </ul>
          </div>
          <div class="col-1">⠀</div>
          <div id="accordionBtn_2" class="container col-4-5 accordion">
            <ul>
              <li>
                <h1>Informazioni sul contenuto della lettera</h1>
                <span id="frecciaUp_2" class="freccia up">⠀</span>
                <span id="frecciaDown_2" class="freccia down">⠀</span>
                <ul id="accordionUl_2"><xsl:apply-templates select="//tei:profileDesc"/></ul>
              </li>
            </ul>
          </div>
          <div class="col-1">⠀</div>
        </section>



        <main class="col-12">

          <div class="col-1">⠀</div>

          <div class="container col-10">
            <div class="gradient_wrapper">
              <div id="toolbar" class="gradient_border">
                <div>
                  <input type="checkbox" id="checkbox_magnifier"/>
                  <label for="checkbox_magnifier"> Lente di ingrandimento </label>
                </div>
                <div id="list1" class="dropdown">
                  <span class="anchor">Seleziona Tag</span>
                  <ul id="items" class="items">
                    <li><input type="checkbox" id="persontag"/>Person </li>
                    <li><input type="checkbox" id="placetag"/>Place </li>
                    <li><input type="checkbox" id="termtag"/>Term </li>
                    <li><input type="checkbox" id="worktag"/>Work </li>
                  </ul>
                </div>
                <div>
                  <input type="checkbox" id="checkbox_sentences"/>
                  <label for="checkbox_sentences"> Scorrimento frasi </label>
                  <button id="sentence_prev" class="sentenceBtn"> ← </button>
                  <button id="sentence_next" class="sentenceBtn"> → </button>
                </div>
              </div>
            </div>
            <div id="controls">
              <ol id="pages">
                <button id="prev"><div class="freccia sx">⠀</div></button>
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <button id="next"><div class="freccia dx">⠀</div></button>
              </ol>
            </div>
            <div id="slider">
              <ul>
                <!-- Visualizzazione della lettera -->
                <xsl:for-each select="//tei:surface">
                  <li>
                    <xsl:attribute name="id">
                      <xsl:value-of select="concat('_', @n)"/>
                    </xsl:attribute>
                    <div class="img-magnifier-container">
                      <img class="letterPic">
                        <xsl:attribute name="src">
                          <xsl:value-of select="current()/tei:graphic/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">
                          <xsl:value-of select="concat('pic_clone_', current()/@n)"/>
                        </xsl:attribute>
                        <xsl:attribute name="class"><xsl:text>pic_clone</xsl:text></xsl:attribute>
                      </img>
                      <img class="letterPic">
                        <xsl:attribute name="src">
                          <xsl:value-of select="current()/tei:graphic/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="usemap">
                          <xsl:value-of select="concat('#', current()/@n)"/>
                        </xsl:attribute>
                        <xsl:attribute name="id">
                          <xsl:value-of select="concat('pic_', current()/@n)"/>
                        </xsl:attribute>
                      </img>
                    </div>
                    <map>
                      <xsl:attribute name="name">
                        <xsl:value-of select="current()/@n" />
                      </xsl:attribute>
                      <xsl:for-each select="current()/tei:zone">
                        <area shape="rect">
                          <xsl:attribute name="coords">
                            <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                          </xsl:attribute>
                          <xsl:attribute name="href"><xsl:text>#</xsl:text></xsl:attribute>
                          <xsl:attribute name="id">
                            <xsl:value-of select="substring(@xml:id, 12)"/>
                          </xsl:attribute>
                        </area>
                      </xsl:for-each>
                    </map>
                  </li>
                </xsl:for-each>
              </ul>
            </div>
            <div id="text">
              <xsl:apply-templates select="//tei:body"/>
            </div>
          </div>

          <div class="col-1">⠀</div>

        </main>


        <section class="col-12">
          <div id="notes" class="container">
            <xsl:apply-templates select="//tei:back/tei:div[@type='notes']"/>
          </div>
        </section>

        <footer class="col-12">
          <div><xsl:apply-templates select="//tei:titleStmt"/></div><br />
          <div><xsl:apply-templates select="//tei:editionStmt"/></div><br />
          <div><xsl:apply-templates select="//tei:publicationStmt"/></div>
        </footer>
      </body>
    </html>
  </xsl:template>

  <!-- Template che vanno nel main -->
  <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc">
    <xsl:element name="li">
      <xsl:element name="strong"><xsl:text>Locazione: </xsl:text></xsl:element>
      <xsl:value-of select="concat(//tei:settlement, ', ', //tei:country)"/>
    </xsl:element>

    <!--
    <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Città: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:settlement"/>
  </xsl:element> -->

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Id Lettera: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:idno"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Inventario: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:altIdentifier"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Materiale: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:material"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Timbri: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:stamp"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Descrizione: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:support/tei:p"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Dimensioni: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:dimensions"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Condizioni: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:condition"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Seconda mano: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:handNote[@xml:id='h1']"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Sigillo: </xsl:text></xsl:element>
    <xsl:value-of select="//tei:seal"/>
  </xsl:element>
  <!--
  <xsl:element name="li">
  <xsl:element name="strong"><xsl:text>Paese: </xsl:text></xsl:element>
  <xsl:value-of select="//tei:adminInfo/tei:note"/>
</xsl:element> -->

<!-- <xsl:element name="li">
<xsl:element name="strong"><xsl:text>Paese: </xsl:text></xsl:element>
<xsl:value-of select="//tei:citedRange"/>
</xsl:element> -->

</xsl:template>

<xsl:template match="tei:TEI/tei:teiHeader/tei:profileDesc">

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Mittente: </xsl:text></xsl:element>
    <xsl:apply-templates select="//tei:correspAction[@type='sent']"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Destinatario: </xsl:text></xsl:element>
    <xsl:apply-templates select="//tei:correspAction[@type='received']"/>
  </xsl:element>

  <xsl:element name="li">
    <xsl:element name="strong"><xsl:text>Lingue: </xsl:text></xsl:element>
    <xsl:element name="ul">
      <xsl:for-each select="//tei:langUsage/tei:language">
        <xsl:element name="li">
          <xsl:value-of select="current()"/>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:element>
</xsl:template>

<!-- Template che vanno nell'aside -->
<xsl:template match="tei:TEI/tei:text/tei:body">
  <xsl:element name="h1">
    <xsl:text>Trascrizione della lettera</xsl:text>
  </xsl:element>
  <br />
  <xsl:apply-templates/>
</xsl:template>

<!-- Template che vanno nella section -->
<xsl:template match="tei:back/tei:div[@type='notes']">
  <xsl:element name="h2">
    <xsl:element name="b">
      <xsl:text>Note e informazioni</xsl:text>
    </xsl:element>
  </xsl:element>
  <br />
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:div[@type='bibliography']">
  <xsl:element name="h2">
    <xsl:text>Elenco bibliografia</xsl:text>
  </xsl:element>
  <xsl:element name="ul">
    <xsl:for-each select="current()//tei:bibl/tei:ref/tei:bibl">
      <xsl:element name="li">
        <xsl:element name="span">
          <xsl:value-of select="tei:author" />
          <xsl:text>, </xsl:text>
          <xsl:value-of select="tei:date" />
          <xsl:text>, pag. </xsl:text>
          <xsl:value-of select="tei:citedRange" />
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:element>
</xsl:template>
<!-- Template che vanno nel footer -->
<xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:respStmt[1]/tei:resp"/>
    </xsl:element>
  </xsl:element>
  <xsl:for-each select="tei:respStmt[1]/tei:name">
    <xsl:element name="p">
      <xsl:value-of select="current()"/>
    </xsl:element>
  </xsl:for-each><br />
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:respStmt[2]/tei:resp"/>
    </xsl:element>
  </xsl:element>
  <xsl:for-each select="tei:respStmt[2]/tei:name">
    <xsl:element name="p">
      <xsl:value-of select="current()"/>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

<xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt">
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:edition"/>
    </xsl:element>
  </xsl:element>
  <br />
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:respStmt[1]/tei:resp"/>
    </xsl:element>
  </xsl:element>
  <xsl:for-each select="tei:respStmt[1]/tei:name">
    <xsl:element name="p">
      <xsl:value-of select="current()"/>
    </xsl:element>
  </xsl:for-each>
  <br />
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:respStmt[2]/tei:resp"/>
    </xsl:element>
  </xsl:element>
  <xsl:for-each select="tei:respStmt[2]/tei:name">
    <xsl:element name="p">
      <xsl:value-of select="current()"/>
    </xsl:element>
  </xsl:for-each>
</xsl:template>

<xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt">
  <xsl:element name="p">
    <xsl:value-of select="tei:publisher"/>
  </xsl:element><br />
  <xsl:element name="p">
    <xsl:element name="b">
      <xsl:value-of select="tei:availability/tei:licence"/>
    </xsl:element>
  </xsl:element>
</xsl:template>


<!-- Template auiliari -->
<xsl:template match="tei:div[@type='fronte-recto'] | tei:div[@type='retro-verso'] | tei:div[@type='retro-recto'] | tei:div[@type='fronte-verso']">
  <xsl:element name="div">
    <xsl:attribute name="id">
      <xsl:value-of select="@type"/>
    </xsl:attribute>
    <xsl:attribute name="class"><xsl:text>folio</xsl:text></xsl:attribute>
    <xsl:element name="h2">
      <xsl:value-of select="concat(position() div 2, '°', ' foglio')"/>
    </xsl:element>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:div[@type='paratext'] | tei:div[@type='opener'] | tei:div[@type='letter-body']">
  <xsl:element name="div">
    <xsl:attribute name="class">
      <xsl:value-of select="@type"/>
    </xsl:attribute>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:ab[@type='paratext']">
  <xsl:element name="p">
    <xsl:attribute name="class">hand</xsl:attribute>
    <xsl:value-of select="tei:fw/tei:idno" />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:s">
  <xsl:element name="span">
    <xsl:attribute name="class">sentence</xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="@n"/>
    </xsl:attribute>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:date ">
  <xsl:value-of select="current()"/>
</xsl:template>

<xsl:template match="tei:lb">
  <br />
  <xsl:element name="span">
    <xsl:attribute name="id">
      <xsl:value-of select="substring(@xml:id, 7)"/>
    </xsl:attribute>
    <xsl:attribute name="class">line</xsl:attribute>
    <xsl:value-of select="@n"/>
  </xsl:element>
</xsl:template>


<xsl:template match="tei:ptr">
  <xsl:element name="sup">
    <xsl:attribute name="class">note</xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="substring(current()/@target, 2)"/>
    </xsl:attribute>
    <xsl:value-of select="substring(current()/@target, string-length(current()/@target))"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:term | tei:placeName | tei:rs | tei:persName">
  <xsl:element name="span">
    <xsl:attribute name="class">
      <xsl:value-of select="name()"/>
    </xsl:attribute>
    <xsl:attribute name="id">
      <xsl:value-of select="substring(current()/@ref, 2)"/>
    </xsl:attribute>
    <xsl:choose>
      <xsl:when test="descendant::tei:choice">
        <xsl:apply-templates />
      </xsl:when>
      <xsl:when test="current()/@ref = '#GG'">
        <xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="current()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
  <xsl:element name="div">
    <xsl:attribute name="class">tooltiptext</xsl:attribute>
    <xsl:choose>
      <xsl:when test="name() = 'term'">
        <xsl:value-of select="//tei:gloss[@target=current()/@ref]" />
      </xsl:when>
      <xsl:when test="name() = 'placeName'">
        <xsl:text>Stato: </xsl:text><xsl:value-of select="//tei:place[concat('#',@xml:id) = current()/@ref]/tei:country" />
      </xsl:when>
      <xsl:when test="name() = 'rs'">
        <xsl:text>Compositore: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id = substring(current()/@ref, 2)]/tei:persName[@role = 'composer']" />
        <br /><xsl:text>Librettista: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id = substring(current()/@ref, 2)]/tei:persName[@role = 'librettist']"/>
        <br /><xsl:text>Teatro: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id = substring(current()/@ref, 2)]/tei:orgName[@type = 'theatre']" />
        <br /><xsl:text>Luogo: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id = substring(current()/@ref, 2)]/tei:placeName" />
        <br /><xsl:text>Data: </xsl:text><xsl:value-of select="//tei:bibl[@xml:id = substring(current()/@ref, 2)]/tei:date" />
      </xsl:when>
      <xsl:when test="name() = 'persName'">
        <xsl:choose>
          <xsl:when test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:p" >
            <xsl:value-of select="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:p" />
          </xsl:when>
          <xsl:when test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName !=''" >
            <xsl:text>Nome: </xsl:text>
            <xsl:choose>
              <xsl:when test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:roleName !=''">
                <xsl:value-of select="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:forename" /><xsl:text> </xsl:text>
                <xsl:value-of select="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:surname" />
                <xsl:if test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:addName != ''">
                  <xsl:value-of select="concat(', ', //tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:addName)" />
                </xsl:if>
                <xsl:if test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:roleName != ''">
                  <xsl:value-of select="concat(', ', //tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/tei:roleName)" />
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="concat(' (', //tei:person[@xml:id = substring(current()/@ref, 2)]/tei:birth/tei:date, ' - ', //tei:person[@xml:id = substring(current()/@ref, 2)]/tei:death/tei:date, ')')"/>
            <br /><xsl:text>Ruolo: </xsl:text>
            <xsl:choose>
              <xsl:when test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/@role = 'composer'">
                <xsl:text>compositore</xsl:text>
              </xsl:when>
              <xsl:when test="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/@role = 'writer'">
                <xsl:text>scrittore</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="//tei:person[@xml:id = substring(current()/@ref, 2)]/tei:persName/@role" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="current()/@ref = //tei:relation/@active" >
            <xsl:text>Relazione: </xsl:text><xsl:value-of select="//tei:relation[@active = current()/@ref]/@name" />
          </xsl:when>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
    <xsl:text> </xsl:text>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:note">
  <xsl:element name="span">
    <xsl:attribute name="id">
      <xsl:value-of select="concat('info_', current()/@xml:id)"/>
    </xsl:attribute>
    <xsl:element name="strong">
      <xsl:value-of select="concat(substring(current()/@xml:id, string-length(current()/@xml:id)), '. ')"/> <!-- Numero della nota -->
    </xsl:element>
    <xsl:apply-templates />
  </xsl:element>
  <br /><br />
</xsl:template>

<!-- <xsl:element name="span">
<xsl:attribute name="id">
<xsl:value-of select="concat('-current()/@ref"/>
</xsl:attribute>
<xsl:for-each select="current()/@**">
<xsl:value-of select=current()"current()/@role"/>
</xsl:for-each> -->

<xsl:template match="//tei:correspDesc/tei:correspAction">
  <xsl:value-of select="tei:persName"/>,
  <xsl:value-of select="tei:placeName"/>,
  <xsl:value-of select="tei:date"/>
</xsl:template>

<xsl:template match="tei:subst">
  <xsl:element name="span">
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="//tei:subst/tei:del">
  <xsl:element name="del">
    <xsl:value-of select="//tei:subst/tei:del"/>
  </xsl:element>
</xsl:template>

<xsl:template match="//tei:subst/tei:add">
  <xsl:element name="sup">
    <xsl:value-of select="concat(' \ ', //tei:subst/tei:add , ' / ')"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:g">
  <xsl:element name="sup">
    <xsl:attribute name="class">sup_g</xsl:attribute>
    <xsl:value-of select="current()"/>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:expan">
  <xsl:element name="span">
    <xsl:attribute name="class">expan</xsl:attribute>
    <xsl:value-of select="concat(' (Exten.: ', current(), ')')" />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:choice">
  <xsl:element name="span">
    <xsl:attribute name="class">abbr_exp</xsl:attribute>
    <xsl:element name="span">
      <xsl:attribute name="class">abbr</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
