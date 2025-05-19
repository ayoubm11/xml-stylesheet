
# ✅ XSLT Transformation for HTTP Status Codes

This tutorial explains how to use **XSLT (eXtensible Stylesheet Language Transformations)** to convert an XML document (`http.xml`) into an HTML table displaying HTTP status codes.

## 📚 Prerequisites

Before starting, you should be familiar with:

- 🧾 **HTML** (HyperText Markup Language)  
- 📄 **XML** (eXtensible Markup Language)

> 📘 **Note**: XSL is a family of technologies used for transforming and formatting XML documents. XSLT is its transformation component.

---

## 🎯 Objective

Create an **XSLT file** that transforms an XML document (`http.xml`) into an HTML page showing HTTP status codes in a table.

## ✅ Requirements

1. **Display the HTTP codes** in a table with **three columns**:
   - 🔢 `Code`
   - 💬 `Message`
   - 📄 `Description`

2. If a code has **no message**, show the symbol **🚫** instead.

---

## 🧩 Sample XSLT Code

Here is a basic XSLT stylesheet to achieve the transformation:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>HTTP Status Codes</title>
        <style>
          table { border-collapse: collapse; width: 100%; font-family: Arial; }
          th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>HTTP Status Codes</h2>
        <table>
          <tr>
            <th>🔢 Code</th>
            <th>💬 Message</th>
            <th>📄 Description</th>
          </tr>
          <xsl:for-each select="httpstatuses/status">
            <tr>
              <td><xsl:value-of select="code"/></td>
              <td>
                <xsl:choose>
                  <xsl:when test="message">
                    <xsl:value-of select="message"/>
                  </xsl:when>
                  <xsl:otherwise>🚫</xsl:otherwise>
                </xsl:choose>
              </td>
              <td><xsl:value-of select="description"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
```

---

## 🧪 Sample XML Input (`http.xml`)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<httpstatuses>
  <status>
    <code>200</code>
    <message>OK</message>
    <description>The request has succeeded.</description>
  </status>
  <status>
    <code>404</code>
    <description>The requested resource was not found.</description>
  </status>
  <status>
    <code>500</code>
    <message>Internal Server Error</message>
    <description>An unexpected condition was encountered.</description>
  </status>
</httpstatuses>
```

---


