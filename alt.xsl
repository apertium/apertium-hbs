<?xml version="1.0" encoding="UTF-8"?> <!-- -*- nxml -*- -->
<!--
Copyright (C) 2005 Universitat d'Alacant / Universidad de Alicante

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output encoding="UTF-8"/>
  <xsl:param name="alt"/>
  <xsl:param name="var"/>

  <xsl:template match="/">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>
  
  <xsl:template match="e">
    <e>
      <xsl:apply-templates select="@*[name()!='lang']" /><!-- Ignore the e/@lang attribute, it's metadix only -->
      <xsl:apply-templates select="node()" />
    </e>
  </xsl:template>
  
  <xsl:template match="group">
    <xsl:if test="(./@var and @var=$var) or (./@alt and @alt=$alt)">
      <xsl:apply-templates select="node()"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
