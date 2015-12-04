<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" />
  
  <xsl:template match="/" xml:space="preserve">
<destinations>
    <xsl:for-each select="/tripfinder/destinationpages/destinations[@category='<%=Request.QueryString("cat")%>'and @reg='<%=Request.QueryString("reg")%>']/row">
    <row><xsl:attribute name="locid"><xsl:value-of select="@locid"/></xsl:attribute><xsl:attribute name="lat"><xsl:value-of select="@lat"/></xsl:attribute><xsl:attribute name="long"><xsl:value-of select="@long"/></xsl:attribute>
        <xsl:copy-of select="region" />
        <xsl:copy-of select="location" />
        <xsl:copy-of select="state" />
        <site><xsl:text disable-output-escaping="yes">&lt;!</xsl:text>[CDATA[<xsl:value-of select="site" />]]<xsl:text disable-output-escaping="yes">&gt;</xsl:text></site>
        <description><xsl:text disable-output-escaping="yes">&lt;!</xsl:text>[CDATA[<xsl:value-of select="description" />]]<xsl:text disable-output-escaping="yes">&gt;</xsl:text></description>
        <image><xsl:text disable-output-escaping="yes">&lt;!</xsl:text>[CDATA[<xsl:value-of select="image" />]]<xsl:text disable-output-escaping="yes">&gt;</xsl:text></image>
        <sticker><xsl:text disable-output-escaping="yes">&lt;!</xsl:text>[CDATA[<xsl:value-of select="sticker" />]]<xsl:text disable-output-escaping="yes">&gt;</xsl:text></sticker>
        <xsl:call-template name="getCategories">
          <xsl:with-param name="location" select="location" />
        </xsl:call-template>
        <xsl:call-template name="getPrices">
          <xsl:with-param name="locid" select="@locid" />
        </xsl:call-template>
      </row>
    </xsl:for-each>
  </destinations>
  </xsl:template>
    
  <xsl:template name="getCategories">
    <xsl:param name="location" select="''" />
    <categories><xsl:text disable-output-escaping="yes">&lt;!</xsl:text>[CDATA[
      <xsl:if test="count(/tripfinder/categoryfinder/location[@name=$location]/category[@cat != '<%=Request.QueryString("cat")%>']) > 1">
        <xsl:value-of select="$location" />  is also featured in 
        <xsl:for-each select="/tripfinder/categoryfinder/location[@name=$location]/category[@cat != '<%=Request.QueryString("cat")%>']">
            <xsl:if test="position() > 1">, <xsl:if test="position() = last()"> and </xsl:if></xsl:if>
            <a onmouseover="this.className='priceLinkHover';" onmouseout="this.className='priceLink';" class="priceLink"> <xsl:attribute name="href">finder.asp?category=<xsl:value-of select="@cat"/>&amp;region=<xsl:value-of select="@reg"/>&amp;friendly=<xsl:value-of select="@friendly"/></xsl:attribute><xsl:value-of select="." /></a>
        </xsl:for-each>
      </xsl:if>
      ]]<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
    </categories>
  </xsl:template>
  
  <xsl:template name="getPrices">
    <xsl:param name="locid" select="''" />
    <xsl:for-each select="/tripfinder/soatripfinder/region[@id=$locid]">
        <xsl:if test="position()=1">
        <hotelprice><xsl:value-of select="hotelprice" /></hotelprice>
        <hotellink><xsl:value-of select="hotelprice/@url" /></hotellink>
        <pkgprice><xsl:value-of select="pkgprice" /></pkgprice>
        <pkglink><xsl:value-of select="pkgprice/@url" /></pkglink>
        <price><xsl:value-of select="price" /></price>
        <pricedesc><xsl:value-of select="pricedesc" /></pricedesc>
        </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

