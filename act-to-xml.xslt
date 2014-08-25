<xsl:stylesheet version = '1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns='http://www.w3.org/1999/xhtml'
  xmlns:xhtml='http://www.w3.org/1999/xhtml'
  xmlns:xsi="http://www.w3.orgOBOB/2001/XMLSchema-instance">

  <xsl:output method="xml" />

  <xsl:template match="@*|node()">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>

  <xsl:template match="/">
    <akomaNtoso xsi:schemaLocation="http://www.akomantoso.org/2.0 ./akomantoso20.xsd">
      <xsl:apply-templates />
      <!-- <act contains="singleVersion"> -->
        <!--   <meta> -->
          <!--   </meta> -->
        <!--   <preface> -->
          <!--     <p> -->
            <!--       <docTitle id="ActTitle"></docTitle> -->
            <!--       <docDate data=""></docDate> -->
            <!--     </p> -->
          <!--   </preface> -->
        <!-- </act> -->
    </akomaNtoso>
  </xsl:template>

  <!-- <xsl:template match="*"> -->
  <!--   <xsl:message terminate="no"> -->
  <!--     WARNING: Unmatched element: <xsl:value-of select="name()"/> -->
  <!--   </xsl:message> -->
  <!--   <xsl:apply-templates/> -->
  <!-- </xsl:template> -->

  <xsl:template match="//*[class='section-e']">
    <docTitle>
      <xsl:value-of select='./b'/>
    </docTitle>
  </xsl:template>

  <xsl:template match="//*[class='chapter-e']">
    <chapter>
      <xsl:value-of select="."/>
    </chapter>
  </xsl:template>
</xsl:stylesheet>
