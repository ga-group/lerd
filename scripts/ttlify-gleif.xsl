<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:str="http://exslt.org/strings"
  xmlns:fn="http://exslt.org/functions"
  xmlns:lei="http://www.leiroc.org/data/schema/leidata/2014"
  xmlns:tt="http://schema.ga-group.nl/xmlttl"
  extension-element-prefixes="fn"
  version="1.0">

  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <fn:function name="tt:ttlesc">
    <xsl:param name="str"/>
    <xsl:variable name="q">"</xsl:variable>
    <fn:result
      select="str:replace(
              str:replace(
              str:replace($str, '\', '\\'
              ), $q, concat('\', $q)
              ), '&#0160;', ' ')"/>
  </fn:function>

  <fn:function name="tt:urlesc">
    <xsl:param name="str"/>
    <fn:result
      select="str:replace(
              str:replace(
              str:replace($str, '&lt;', '%3C'
              ), '&gt;', '%3E'
              ), ' ', '%20')"/>
  </fn:function>

  <xsl:template match="lei:LEIRecord">
    <xsl:variable name="lei">
      <xsl:text>http://openleis.com/legal_entities/</xsl:text>
      <xsl:value-of select="lei:LEI"/>
    </xsl:variable>

    <xsl:text>&lt;</xsl:text>
    <xsl:value-of select="$lei"/>
    <xsl:text>&gt;&#0010;</xsl:text>
    <xsl:text>    fibo-fnd-rel-rel:hasLegalName "</xsl:text>
    <xsl:value-of select="tt:ttlesc(normalize-space(lei:Entity/lei:LegalName))"/>
    <xsl:text>" ;&#0010;</xsl:text>
    <xsl:if test="string-length(lei:Entity/lei:LegalForm) &gt; 0">
      <xsl:text>    rov:orgType &lt;http://openleis.com/legal_entities/search/legal_form/</xsl:text>
      <xsl:value-of select="tt:urlesc(lei:Entity/lei:LegalForm)"/>
      <xsl:text>&gt; ;&#0010;</xsl:text>
    </xsl:if>
    <xsl:text>    rov:orgStatus "</xsl:text>
    <xsl:value-of select="lei:Entity/lei:EntityStatus"/>
    <xsl:text>" ;&#0010;</xsl:text>
    <xsl:text>    fibo-be-le-lei:isRecognizedIn </xsl:text>
    <xsl:text>&lt;http://schema.ga-group.nl/jurisdictions#</xsl:text>
    <xsl:value-of select="lei:Entity/lei:LegalJurisdiction"/>
    <xsl:text>&gt; ;&#0010;</xsl:text>
    <xsl:text>    a fibo-be-le-lei:LegalEntityIdentifier , fibo-be-le-lei:ContractuallyCapableEntity .&#0010;</xsl:text>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
