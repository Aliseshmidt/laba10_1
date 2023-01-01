<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>pr</title>
        <style>
        tr,td,th,table {
          border: 1px solid black;
        }
        </style>
      </head>
      <body>
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
        <br/>
        <a href="/task101/input">BACK TO INPUT PAGE</a>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
