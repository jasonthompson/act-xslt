<xsl:stylesheet version = '1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns='http://www.w3.org/1999/xhtml'
  xmlns:xhtml='http://www.w3.org/1999/xhtml'
  xmlns:xsi="http://www.w3.orgOBOB/2001/XMLSchema-instance"
  xmlns:akn="http://www.akomantoso.org/2.0">

  <xsl:output method="xml" />

  <xsl:template match="@*|node()">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>

  <xsl:template match="/">
    <akn:akomaNtoso xsi:schemaLocation="http://www.akomantoso.org/2.0 ./akomantoso20.xsd">
      <xsl:call-template name="act-preface" />
      <xsl:call-template name="act-body"/>
    </akn:akomaNtoso>
  </xsl:template>

  <!-- Preface Templates -->
  <xsl:template name="act-preface">
    <akn:preface>
      <xsl:call-template name="act-title"/>
      <xsl:call-template name="act-chapter"/>
      <xsl:call-template name="act-consolidation-date" />
    </akn:preface>
  </xsl:template>

  <xsl:template name="act-title">
    <akn:docTitle>
      <xsl:value-of select="//xhtml:p[@class='shorttitle-e c2']"/>
    </akn:docTitle>
  </xsl:template>

  <xsl:template name="act-chapter">
    <akn:chapter>
      <xsl:value-of select="//xhtml:p[@class='chapter-e']"/>
    </akn:chapter>
  </xsl:template>

  <xsl:template name="act-consolidation-date">
    <p>
      <xsl:value-of select="//*[@class='ConsolidationPeriod-e']"/>
    </p>
  </xsl:template>

  <!-- body templates -->

  <xsl:template name="act-body">
    <xsl:for-each select="//xhtml:p[@class='section-e']">
      <xsl:call-template name="act-section"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="act-section">
    <akn:section>
      <akn:num>
        <xsl:value-of select="node()"/>
      </akn:num>
      <xsl:call-template name="act-section-heading"/> 

      <xsl:if test="not(preceding-sibling::xhtml:p[@class='section-e'][2])">
        <xsl:call-template name="act-section-content"/>
      </xsl:if>
    </akn:section>
  </xsl:template>

  <xsl:template name="act-section-heading">
    <xsl:if test="preceding-sibling::xhtml:p[2][@class='headnote-e c2']">
      <akn:heading>
        <xsl:value-of select="preceding-sibling::xhtml:p[2]/node()"/>
      </akn:heading>
    </xsl:if>
    <akn:heading>
      <xsl:value-of select="preceding-sibling::xhtml:p[@class='headnote-e c2'][1]/node()"/>
    </akn:heading>
  </xsl:template>

  <xsl:template name="act-section-content">
    <akn:content>
      <p>
        <xsl:value-of select="node()[2]"/>
      </p>
        
        <akn:clause>
          <xsl:for-each select="//xhtml:p[@class='clause-e']">
            <xsl:value-of select="."/>
            <xsl:for-each select="//xhtml:p[@class='subclause-e']">
              <xsl:value-of select="."/>
            </xsl:for-each>
          </xsl:for-each>
        </akn:clause>
    </akn:content>
  </xsl:template>
</xsl:stylesheet>

