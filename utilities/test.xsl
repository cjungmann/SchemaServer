<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="html">

  <xsl:variable name="nl"><xsl:text>
</xsl:text></xsl:variable>

  <xsl:output method="text" encoding="utf-8"/>

  <xsl:template match="resultset">
    Unknown resultset type <xsl:value-of select="@mode-type" />
  </xsl:template>

  <xsl:template match="resultset[@mode-type='table']">
    <xsl:text>--list</xsl:text>
    <xsl:value-of select="$nl" />
    <xsl:apply-templates select="result" mode="list-heads" />
    <xsl:apply-templates select="result" mode="list-data" />
  </xsl:template>

  <xsl:template match="resultset[@mode-type='form-new']">
    <xsl:text>--form</xsl:text>
    <xsl:value-of select="$nl" />
    <xsl:apply-templates select="schema" mode="form-fields" />
  </xsl:template>

  <xsl:template match="resultset[@mode-type='form-submit']">
      Submit-form resultset
  </xsl:template>

  <xsl:template match="field" mode="label">
    <xsl:choose>
      <xsl:when test="@label"><xsl:value-of select="@label" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="@name" /></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Templates for writing a - -list dialog from a mode-type='table' -->
  <xsl:template mode="column-type" match="field">TEXT</xsl:template>
  <xsl:template mode="column-type" match="field[@type='VARCHAR' or @type='CHAR']">TEXT</xsl:template>
  <xsl:template mode="column-type" match="field[@type='DATE']">TEXT</xsl:template>
  <xsl:template mode="column-type" match="field[contains(@type,'INT')]">NUM</xsl:template>
  <xsl:template mode="column-type" match="field[@type='DOUBLE' or @type='FLOAT']">FLT</xsl:template>

  <xsl:template match="field" mode="define-column">
    <xsl:text>--column</xsl:text>
    <xsl:value-of select="$nl" />
    <xsl:apply-templates select="." mode="label" />
    <xsl:text>:</xsl:text>
    <xsl:apply-templates select="." mode="column-type" />
    <xsl:value-of select="$nl" />
  </xsl:template>

  <xsl:template match="field" mode="write_cell">
    <xsl:param name="data" />
    <xsl:variable name="attr" select="$data/@*[local-name()=current()/@name]" />
    <xsl:choose>
      <xsl:when test="$attr"><xsl:value-of select="$attr" /></xsl:when>
      <xsl:otherwise>""</xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$nl" />
  </xsl:template>

  <xsl:template match="row" mode="write_row">
    <xsl:param name="schema" />
    <xsl:apply-templates select="$schema/field" mode="write_cell">
      <xsl:with-param name="data" select="." />
    </xsl:apply-templates>
  </xsl:template>

  <!-- list dialog calls for resultset[@mode-type='table'] -->
  <xsl:template match="result" mode="list-heads">
    <xsl:apply-templates select="schema/field" mode="define-column" />
  </xsl:template>

  <xsl:template match="result" mode="list-data">
    <xsl:apply-templates select="row" mode="write_row">
      <xsl:with-param name="schema" select="schema" />
    </xsl:apply-templates>
  </xsl:template>


  <!-- Templates for writing an form dialog from a mode-type='add' -->
  <xsl:template mode="field-type" match="field"></xsl:template>
  <xsl:template mode="field-type" match="field[@type='DATE']">:DT</xsl:template>
  <xsl:template mode="field-type" match="field[contains(@type,'INT')]">:NUM</xsl:template>
  <xsl:template mode="field-type" match="field[@type='DOUBLE' or @type='FLOAT']">:NUM</xsl:template>
  <xsl:template mode="field-type" match="field[@readOnly]">:RO</xsl:template>
  <xsl:template mode="field-type" match="field[@hidden]">:H</xsl:template>
  
  <xsl:template match="field" mode="define-field">
    <xsl:text>--field</xsl:text>
    <xsl:value-of select="$nl" />
    <xsl:apply-templates select="." mode="label" />
    <xsl:apply-templates select="." mode="field-type" />
    <xsl:value-of select="$nl" />
  </xsl:template>

  <xsl:template match="schema" mode="form-fields">
    <xsl:text>--text="In field-heads!"</xsl:text>
    <xsl:value-of select="$nl" />
    <xsl:apply-templates select="field" mode="define-field" />
  </xsl:template>

</xsl:stylesheet>
