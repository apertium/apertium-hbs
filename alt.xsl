﻿<?xml version="1.0" encoding="UTF-8"?> <!-- -*- nxml -*- -->
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
<xsl:output method="text" encoding="UTF-8"/>
<xsl:param name="alt"/>
<xsl:param name="var"/>

<xsl:template match="/">
  <xsl:value-of select="string('&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;&#xA;')"/>
  <xsl:apply-templates select="*|text()"/>
</xsl:template>

<xsl:template match="*"> <!-- match all tags -->
  <xsl:if test="( (not(count(./@alt)=1) and (not(count(./@var)=1) or ./@var=$var)) or ./@alt=$alt)"> <!-- if there is no attribute alt or there exists one with the parameter input (i.e. sh) -->
    <xsl:if test="not(local-name(.)=string('group'))"> <!-- if the current tag is not group -->
      <xsl:value-of select="string('&lt;')"/> <!-- -->
      <xsl:value-of select="local-name(.)"/> <!-- --> 
      <xsl:for-each select="./@*"> <!-- for each of the attributes? --> 
          <xsl:if test="not(local-name(.)=string('lang') and name(..)=string('e')) and not(local-name(.)=string('alt')) and not(local-name(.)=string('var'))"> <!-- if the attribute is not alt/var, and not e/@lang -->
          <xsl:value-of select="string(' ')"/> <!-- -->
          <xsl:value-of select="local-name(.)"/> <!-- -->
          <xsl:value-of select="string('=&quot;')"/> <!-- -->
          <xsl:value-of select="string(.)"/> <!-- -->
          <xsl:value-of select="string('&quot;')"/> <!-- -->
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="count(text()[normalize-space(.)] | *)=0">  <!-- if the contents of the tag are null -->
        <xsl:if test="not(local-name(.)=string('group'))"> <!-- if the current tag is not group -->
          <xsl:value-of select="string('/&gt;')"/> <!-- -->
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="not(local-name(.)=string('group'))">  <!-- if the current tag is not group -->
          <xsl:value-of select="string('&gt;')"/>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if test="not(local-name(.)=string('group'))">  <!-- if the current tag is not group -->
          <xsl:value-of select="string('&lt;/')"/>
          <xsl:value-of select="local-name(.)"/>
          <xsl:value-of select="string('&gt;')"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template match="text()">
  <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>
