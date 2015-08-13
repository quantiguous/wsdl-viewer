<xsl:stylesheet xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:local="http://www.quantiguous.com/xml/inline_schemas" version="1.0" exclude-result-prefixes="local">

<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="no" media-type="text/xml"/>

<xsl:template match="node()|@*">
  <xsl:copy>
  <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsd:group[@ref]">
  <xsl:variable name="groupName" select="substring-after(@ref,':')"/>
  <xsl:copy-of select="//xsd:group[@name = $groupName]/*"/>
</xsl:template>

</xsl:stylesheet>
