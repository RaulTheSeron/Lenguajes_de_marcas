<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>


    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Liga Fútbol Profesiona</title>
                <link rel="stylesheet" href="Liga.css"/>
            </head>
            <body>
                <h1>Liga Fútbol Profesional</h1>
                <!-- Bucle para las temporadas y establecer el id para el div -->
                <!--Variable con el id de la division-->
                <xsl:for-each select="//temporada"> 
                    <xsl:variable name="id" select="@id" />
                
                    <div id="{$id}" class="seccion">
                        <!-- Selección para el título del año de la temporada -->
                        <h2>TEMPORADA <xsl:value-of select="substring(@inicio,0,5)"/> - <xsl:value-of select="substring(@fin,0,5)"/>
                        </h2>
                        <br/>
                        <!-- Aquí  vendría la tabla para los partidos-->
                        <table>
                            <xsl:for-each select="partido"> 
                                <xsl:variable name="imagen" select="*/imagen" />
                                <!--Equipos-->
                                <tr>
                                    <!--condicional para imagen de equipo local-->
                                    <xsl:if test="local/imagen">
                                        <xsl:variable name="imagenLocal" select="local/imagen"/>
                                        <td><img src="{$imagenLocal}"/></td>
                                    </xsl:if>
                                    <xsl:if test="not(local/imagen)">
                                        <td><img src="imagenes/noimagen.jpeg"/></td>
                                    </xsl:if>
                                  
                                    <td><xsl:value-of select="local/@nombre"/></td>
                                    <td><xsl:value-of select="visitante/@nombre"/></td>
                                    
                                    <!--condicional para imagen de equipo visitante-->
                                    <xsl:if test="visitante/imagen">
                                        <xsl:variable name="imagenVisitante" select="visitante/imagen"/>
                                        <td><img src="{$imagenVisitante}"/></td>
                                    </xsl:if>
                                    <xsl:if test="not(visitante/imagen)">
                                        <td><img src="imagenes/noimagen.jpeg"/></td>
                                    </xsl:if>
                                </tr>
                                <!--Goles-->
                                <tr>
                                    <td><h2><xsl:value-of select="count(local/goles/jugador)"/></h2></td>
                                    <td>
                                        <xsl:for-each select="local/goles/jugador">
                                            <xsl:value-of select="."/>
                                            (<xsl:value-of select="@min"/>)
                                            <br/>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="visitante/goles/jugador">
                                            <xsl:value-of select="."/>
                                            (<xsl:value-of select="@min"/>)
                                            <br/>
                                        </xsl:for-each>
                                    </td>
                                    <td><h2><xsl:value-of select="count(visitante/goles/jugador)"/></h2></td>
                                </tr>
                            </xsl:for-each>        
                        </table>
                    </div>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
