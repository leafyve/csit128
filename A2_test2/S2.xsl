<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Weather Forecast</title>
        <style>
          body {
            font-family: 'Times New Roman', Times, serif;
            margin: 20px;
          }
          h2 {
            padding-left: 160px;
          }
          table {
            margin: 0 auto;
            border: 2px solid black;
          }
          th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
          }
          th {
            background-color: orange;
            font-weight: bold;
            padding: 0px;
          }
          .date-column {
            background-color: orange;
            font-weight: normal;
          }
          .weather-cell {
            width: 90px;
            height: 100px;
            font-size: 15px;
          }
          .weather-img {
            width: 50px;
            height: 50px;
          }
          .cloudy {
            color: blue;
          }
          .rain, .thunderstorm {
            color: orange;
          }
          .sunny, .partlySunny {
            color: red;
          }
        </style>
      </head>
      <body>
        <h2>
          <xsl:value-of select="forecast/@queryLocation"/> 
          [<xsl:value-of select="forecast/@queryTime"/>]
        </h2>
        
        <table>
          <!-- Header Row -->
          <tr>
            <th>Date</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
            <th>Sun</th>
          </tr>
          
          <!-- Sort weather entries by date in descending order -->
          <xsl:for-each select="forecast/weather">
            <xsl:sort select="@yyyymmdd" order="descending"/>
            
            <xsl:variable name="dayOfWeek" select="dayOfWeek"/>
            <xsl:variable name="overallCode" select="overallCode"/>
            <xsl:variable name="dateNum" select="date"/>
            <xsl:variable name="monthNum" select="month"/>
            
            <!-- Determine color class based on weather code -->
            <xsl:variable name="colorClass">
              <xsl:choose>
                <xsl:when test="$overallCode = 'cloudy'">cloudy</xsl:when>
                <xsl:when test="$overallCode = 'rain'">rain</xsl:when>
                <xsl:when test="$overallCode = 'thunderstorm'">thunderstorm</xsl:when>
                <xsl:when test="$overallCode = 'sunny'">sunny</xsl:when>
                <xsl:when test="$overallCode = 'partlySunny'">partlySunny</xsl:when>
                <xsl:otherwise>black</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            
            <!-- Determine image file based on weather code -->
            <xsl:variable name="imageFile">
              <xsl:choose>
                <xsl:when test="$overallCode = 'cloudy'">cloudy.jpeg</xsl:when>
                <xsl:when test="$overallCode = 'rain'">rain.png</xsl:when>
                <xsl:when test="$overallCode = 'thunderstorm'">thunderstorm.png</xsl:when>
                <xsl:when test="$overallCode = 'sunny'">sunny.jpeg</xsl:when>
                <xsl:when test="$overallCode = 'partlySunny'">partlySunny.jpeg</xsl:when>
                <xsl:otherwise>default.png</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            
            <tr>
              <!-- Date column (yellow background) -->
              <td class="date-column">
                <xsl:value-of select="$dateNum"/>
                <xsl:text> </xsl:text>
                <xsl:choose>
                  <xsl:when test="$monthNum = 1">Jan</xsl:when>
                  <xsl:when test="$monthNum = 2">Feb</xsl:when>
                  <xsl:when test="$monthNum = 3">Mar</xsl:when>
                  <xsl:when test="$monthNum = 4">Apr</xsl:when>
                  <xsl:when test="$monthNum = 5">May</xsl:when>
                  <xsl:when test="$monthNum = 6">Jun</xsl:when>
                  <xsl:when test="$monthNum = 7">Jul</xsl:when>
                  <xsl:when test="$monthNum = 8">Aug</xsl:when>
                  <xsl:when test="$monthNum = 9">Sep</xsl:when>
                  <xsl:when test="$monthNum = 10">Oct</xsl:when>
                  <xsl:when test="$monthNum = 11">Nov</xsl:when>
                  <xsl:when test="$monthNum = 12">Dec</xsl:when>
                </xsl:choose>
              </td>
              
              <!-- Monday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Mon'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Tuesday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Tues'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Wednesday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Wed'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Thursday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Thur'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Friday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Fri'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Saturday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Sat'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
              
              <!-- Sunday -->
              <td class="weather-cell">
                <xsl:if test="$dayOfWeek = 'Sun'">
                  <xsl:call-template name="displayWeather">
                    <xsl:with-param name="imageFile" select="$imageFile"/>
                    <xsl:with-param name="colorClass" select="$colorClass"/>
                    <xsl:with-param name="lowest" select="lowest"/>
                    <xsl:with-param name="highest" select="highest"/>
                    <xsl:with-param name="overall" select="overall"/>
                  </xsl:call-template>
                </xsl:if>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <!-- Template to display weather information -->
  <xsl:template name="displayWeather">
    <xsl:param name="imageFile"/>
    <xsl:param name="colorClass"/>
    <xsl:param name="lowest"/>
    <xsl:param name="highest"/>
    <xsl:param name="overall"/>
    
    <!-- Temperature range (lowest to highest with degree symbol) -->
    <div>
      <xsl:value-of select="$lowest"/>&#176; - <xsl:value-of select="$highest"/>&#176;
    </div>
    
    <!-- Weather icon -->
    <div>
      <img src="{$imageFile}" alt="weather icon" class="weather-img"/>
    </div>
    
    <!-- Weather description with color -->
    <div class="{$colorClass}">
      <xsl:value-of select="$overall"/>
    </div>
  </xsl:template>
  
</xsl:stylesheet>