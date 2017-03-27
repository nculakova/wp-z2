<?xml version="1.0" encoding="windows-1250"?>
<!-- $Id: thesis.xsl,v 1.3 2006/04/22 09:47:10 jkj Exp $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

<!-- Import p�vodn�ch styl� -->
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/profile-docbook.xsl"/>
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/autoidx-ng.xsl"/>

<!-- Na�ten� definice tituln�ch stran -->
<xsl:import href="thesis-tp-fo.xsl"/>

<!-- �pravy parametr� -->

<!-- Velikost pap�ru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor m��e pou��vat roz���en� pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<!-- Roz���en� specifick� pro dan� FO procesor -->
<xsl:param name="fop1.extensions" select="1"/>

<!-- Roz���en� specifick� pro dan� FO procesor -->
<!--<xsl:param name="xep.extensions" select="1"/> -->

<!-- Velikost okraj� -->
<xsl:param name="page.margin.inner" select="'1in'"/>
<xsl:param name="page.margin.outer" select="'1in'"/>
<xsl:param name="page.margin.top">20mm</xsl:param>
<xsl:param name="page.margin.bottom">15mm</xsl:param>

<!-- Velikost p�sma textu -->
<xsl:param name="body.font.master">12</xsl:param>

<!-- Pou�it� p�sma -->
<xsl:param name="body.font.family" select="'Palatino,serif'"/>
<xsl:param name="title.font.family" select="'Palatino,serif'"/>
<xsl:param name="monospace.font.family" select="'monospace'"/>
<xsl:param name="symbol.font.family" select="'Symbol,ZapfDingbats,LucidaUnicode'"/>

<!-- popisek form�ln�ho obr�zku a� pod obr�zkem -->
<xsl:param name="formal.title.placement">
figure after
example before
equation before
table before
procedure before
task before
</xsl:param>

<!-- ��slov�n� sekc� a kapitol -->
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="chapter.autolabel" select="1"/>
<xsl:param name="appendix.autolabel" select="'A'"/>
<xsl:param name="part.autolabel" select="1"/>
<xsl:param name="preface.autolabel" select="0"/>

<!-- Nechceme obr�zek -->
<xsl:param name="draft.watermark.image" select="''"/>

<!-- Nadpisy jsou zarovn�ny s textem, jak je zvykem v evropsk� typografii -->
<xsl:param name="body.start.indent" select="'0pt'"/>

<!-- odsazen� odstavc� - v prvn�m odstavci neodsazeno (evropsk� konvence), jinak ano -->
<xsl:attribute-set name="normal.para.spacing"> 
  <xsl:attribute name="text-indent">
    <xsl:choose>
      <xsl:when test="preceding-sibling::para">1.5em</xsl:when>
      <xsl:otherwise>0em</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="space-before.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.3em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
</xsl:attribute-set>

<!-- odkazy budeme generovat jako pozn�mky pod �arou -->
<xsl:param name="ulink.show" select="1"/>
<xsl:param name="ulink.footnotes" select="1"/>
<xsl:param name="ulink.footnote.number.format" select="'1'"/>
<xsl:param name="ulink.hyphenate" select="'&#x200b;'"/>

<!-- V pozn�mk�ch pod �arou nejsou odstavce odsazeny -->
<xsl:attribute-set name="footnote.properties">
  <xsl:attribute name="text-indent">0pt</xsl:attribute>
</xsl:attribute-set>

<!-- �prava zobrazen� n�kter�ch element� -->
<xsl:template match="varname">
  <xsl:call-template name="inline.italicseq"/>
</xsl:template>

<xsl:template match="guimenu|guisubmenu|guibutton|guilabel|guimenuitem|guiicon">
  <fo:inline font-weight="bold">
    <xsl:apply-imports/>
  </fo:inline>
</xsl:template>

<xsl:param name="menuchoice.menu.separator" select="'&#x25BB;'"/>

<!-- <xsl:param name="header.column.widths" select="'1 4 1'"/> -->

<!-- Z��en� neproporcion�ln�ho p�sma -->
<xsl:attribute-set name="monospace.properties">
  <!--
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master * 0.95"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
    -->
  <xsl:attribute name="font-stretch">narrower</xsl:attribute>
</xsl:attribute-set>

<!-- Dlouh� v�pisy k�du se mohou zalomit, zalomen� bude indikov�no �ipkou -->
<xsl:param name="hyphenate.verbatim" select="1"/>

<xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
  <xsl:attribute name="wrap-option">wrap</xsl:attribute>
  <xsl:attribute name="hyphenation-character">&#x25BA;</xsl:attribute>
  <xsl:attribute name="space-before.minimum">1.2em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.6em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.6em</xsl:attribute>
  <!--
  <xsl:attribute name="padding-top">.5em</xsl:attribute>
  -->
  <xsl:attribute name="padding-left">1.5em</xsl:attribute>
  <!--
  <xsl:attribute name="padding-right">1em</xsl:attribute>
  <xsl:attribute name="padding-bottom">.5em</xsl:attribute>
  <xsl:attribute name="background-color">#ffffbb</xsl:attribute>
  -->
  <xsl:attribute name="margin-left">0em</xsl:attribute>
  <xsl:attribute name="margin-right">0em</xsl:attribute>
  <xsl:attribute name="keep-together.within-column">
    <xsl:choose>
      <xsl:when test="@role = 'nobreak'">always</xsl:when>
      <xsl:otherwise>auto</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!-- odkazy na literaturu budeme ��slovat a nikoliv odkazovat textov�mi zkratkami -->
<xsl:param name="bibliography.numbered" select="1"/>

<!-- Mezi polo�kami bude mezera -->
<xsl:template match="bibliomixed|biblioentry">
 <fo:block space-after="6pt">
   <xsl:apply-imports/>
 </fo:block>
</xsl:template>

<!-- mus�me opravit odkazy z textu, kter� i p�esto st�le vypisuj� textov� zkratky a ne ��sla -->
<xsl:template match="citation">
    <xsl:variable name="citation.abbrev.text" select="."/>
    <xsl:apply-templates select="//bibliomixed[abbrev=$citation.abbrev.text] | //biblioentry[abbrev=$citation.abbrev.text]" 
                         mode="citation.biblioentry.label"/>
</xsl:template>

<xsl:template match="bibliomixed|biblioentry" mode="citation.biblioentry.label">
    <xsl:text>[</xsl:text>
    <xsl:number from="bibliography"
                count="biblioentry|bibliomixed"
                level="any"
                format="1"/>
    <xsl:text>]</xsl:text>
</xsl:template>

<!-- na za��tku budeme vypisovat jen obsah, ��dn� seznamy obr�zk�, tabulek, p��klad� apod. -->
<xsl:param name="generate.toc">
book      figure,table,title,toc
</xsl:param>

<!-- v�t�� okraje kolem form�ln�ch nesmysl� -->
<xsl:attribute-set name="formal.object.properties">
    <xsl:attribute name="space-before.minimum">1.0em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">1.4em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">2em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">1.0em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">1.4em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">2em</xsl:attribute>
    <xsl:attribute name="keep-together.within-column">
      <xsl:choose>
	<xsl:when test="@role = 'nobreak'">always</xsl:when>
	<xsl:otherwise>auto</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
</xsl:attribute-set>

<!-- obr�zky zarovn�me na st�ed -->
<xsl:attribute-set name="figure.properties" use-attribute-sets="formal.object.properties">
    <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- vzorce zarovn�me na st�ed -->
<xsl:attribute-set name="equation.properties" use-attribute-sets="formal.object.properties">
    <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- neodsadzuj abstract -->
<xsl:attribute-set name="abstract.properties" use-attribute-sets="formal.object.properties">
    <xsl:attribute name="text-indent">0em</xsl:attribute>
</xsl:attribute-set>

<!-- titulky u form�ln�ch obr�zk� apod. -->
<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">
      <xsl:choose>
	<xsl:when test="self::abstract">
	  <xsl:value-of select="$body.font.master * 2"/>
	  <xsl:text>pt</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$body.font.master"/>
	  <xsl:text>pt</xsl:text>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="margin-top">
      <xsl:choose>
	<xsl:when test="self::abstract">4cm</xsl:when>
	<xsl:otherwise>0pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="text-indent">0em</xsl:attribute>
</xsl:attribute-set>

<!-- nadpisy u sekc� -->
<xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="text-align">start</xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.7em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">1.5em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">1.7em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level1.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master * 1.44"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level2.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master * 1.2"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level3.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level4.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level5.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level6.properties">
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<!-- Speci�ln� form�tov�n� kapitol a p��loh -->
<xsl:template name="chapappendix.title">
  <xsl:param name="node" select="."/>
  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$node"/>
    </xsl:call-template>
  </xsl:variable>
  <fo:block id="{$id}"
	    xsl:use-attribute-sets="chap.label.properties">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="local-name(..)"/>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="$node" mode="label.markup"/>
  </fo:block>
  <fo:block xsl:use-attribute-sets="chap.title.properties">
    <xsl:apply-templates select="$node" mode="title.markup"/>
  </fo:block>
</xsl:template>

<xsl:template name="bibliography.title">
  <xsl:param name="node" select="."/>
  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$node"/>
    </xsl:call-template>
  </xsl:variable>
  <fo:block id="{$id}"
	    xsl:use-attribute-sets="chap.label.properties">
    <xsl:apply-templates select="$node" mode="title.markup"/>
  </fo:block>
</xsl:template>

<xsl:attribute-set name="chap.label.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 2"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="margin-top">2em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1.2em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.8em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="chap.title.properties" use-attribute-sets="chap.label.properties">
  <xsl:attribute name="margin-top">0.5em</xsl:attribute>
</xsl:attribute-set>

<!-- ve variablelist bude term na jednom ��dku a listitem na dal��m -->
<xsl:param name="variablelist.as.blocks" select="1"/>

<!-- uprav�me z�hlav�, aby se do n�j vypisoval jen n�zev kapitoly -->
<xsl:template name="header.table">
    <xsl:param name="pageclass" select="''"/><!-- titlepage lot body back -->
    <xsl:param name="sequence" select="''"/><!-- first odd even blank -->
    <xsl:param name="gentext-key" select="''"/><!-- popisek dan� ��sti -->

    <!-- z�hlav� nebude na tituln� stan� a na prvn� stran� ka�d� kapitoly -->
    <xsl:if test="($pageclass!='titlepage') and ($sequence!='first')">
        <fo:block>
            <xsl:attribute name="border-bottom-width">0.5pt</xsl:attribute>
            <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
            <xsl:attribute name="border-bottom-color">black</xsl:attribute>
            <xsl:attribute name="text-align">right</xsl:attribute>

            <!-- vybereme text z�hlav� podle typu str�nky -->
            <xsl:choose>
                <xsl:when test="$pageclass='lot'">
                    <xsl:call-template name="gentext">
                        <xsl:with-param name="key" select="$gentext-key"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$gentext-key='bibliography'">
                    <xsl:text>Literature</xsl:text>
                </xsl:when>
		<!--
                <xsl:when test="ancestor::book">
                    <fo:retrieve-marker retrieve-class-name="section.head.marker"
                        retrieve-position="first-including-carryover"
                        retrieve-boundary="page-sequence"/>
                </xsl:when>
		-->
                <xsl:otherwise>
		  <xsl:variable name="label">
		    <xsl:apply-templates select="." mode="label.markup"/>
		  </xsl:variable>
		  
		  <xsl:if test="$label != ''">
		    <xsl:value-of select="$label"/>
		    <xsl:text>. </xsl:text>
		  </xsl:if>
		  
		  <xsl:apply-templates select="." mode="titleabbrev.markup"/>
                </xsl:otherwise>
            </xsl:choose>

        </fo:block>
    </xsl:if>
</xsl:template>

<!-- z�pat� nebudeme odd�lovat ��rou -->
<xsl:param name="footer.rule" select="0"/>

<!-- ��slov�n� bude kontinu�ln� a arabsk�mi ��slicemi -->
<xsl:template name="page.number.format">
  <xsl:param name="element" select="local-name(.)"/>

  <xsl:text>1</xsl:text>
</xsl:template>

<xsl:template name="initial.page.number">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>
  
  <xsl:text>auto</xsl:text>
</xsl:template>

<!-- Speci�ln� instrukce pro ru�n� vertik�ln� a horizont�ln� posun -->
<xsl:template match="processing-instruction('vskip')">
  <fo:block space-after="{.}">
    <fo:leader/>
  </fo:block>
</xsl:template>

<xsl:template match="processing-instruction('hskip')">
  <fo:leader leader-length="{.}" leader-pattern="space"/>
</xsl:template>

</xsl:stylesheet>
