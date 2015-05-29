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
  <!-- For the e element ignore the lang attribute, output everything else -->
  <!-- Do not output the e element if it has c="sub" -->
  <xsl:template match="e">
    <xsl:if test="(./@c and @c!='sub') or not(./@c)">
    <e>
      <xsl:apply-templates select="@*[name()!='lang']" />
      <xsl:apply-templates select="node()" />
    </e>
    </xsl:if>
  </xsl:template>

  <!-- Do not output the group tag, output contents only if it has the right var/alt parameter -->
  <xsl:template match="group">
    <xsl:if test="(./@var and @var=$var) or (./@alt and @alt=$alt)">
      <xsl:apply-templates select="node()"/>
    </xsl:if>
  </xsl:template>

  <!-- Identity transform -->
  <xsl:template match="/|@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
