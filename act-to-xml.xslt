<xsl:stylesheet version = '1.0'
xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="/">
  <xsl:for-each select="//*[@class='section-e']">
  <h1>
    <xsl:value-of select="."/>
  </h1>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet> 
