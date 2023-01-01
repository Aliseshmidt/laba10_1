<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
        <table class="table table-hover">
            <tr>
              <th>№</th>
              <th>Number</th>
            </tr>
            <xsl:for-each select="arrays/array">
            <tr>
              <td>
                <xsl:value-of select="array/index"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="array/number"></xsl:value-of>
              </td>
            </tr>
             </xsl:for-each>
        </table>
  </xsl:template>
</xsl:stylesheet>