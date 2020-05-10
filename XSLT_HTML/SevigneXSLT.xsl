<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/> <!-- Supprime les espaces non voulus -->
    
    <!-- Les variables utilisées pour les pages html -->
    <xsl:variable name="accueil" select="concat('accueil', '.html')"/>
    <xsl:variable name="indexPers" select="concat('indexpers', '.html')"/>
    <xsl:variable name="indexLieux" select="concat('indexlieux', '.html')"/>
 
    <!-- Template des trois pages HTML -->
    <xsl:template match="TEI">       
        <!-- Page d'accueil -->
        <xsl:result-document href="{$accueil}">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="csssevigne.css"/>
                <meta charset="UTF-8"/>
                <title>Structuration HTML des lettres de Madame de Sévigné</title>       
                <meta name="author" content="R. Bristow"/>
            </head>
            <body>
                <!-- Header -->
                <div class="background">
                    <div class="titres">
                         <h1>
                            <xsl:value-of select="/TEI//titleStmt[1]/title[@type='main']"/>
                        </h1>
                        <h2>
                            <xsl:value-of select="//title[@type='subtitle']"/>
                        </h2>
                    </div>
                </div>
                
                <!-- Sommaire -->
                <nav class="nav">
                    <ul>
                        <li class="nav-link">
                            <a href="{$accueil}">Accueil</a>
                        </li>
                        <li class="nav-link">
                            <a href="{$indexPers}">Index des noms de personnes</a>
                        </li>
                        <li class="nav-link">
                            <a href="{$indexLieux}">Index des noms de lieux</a>
                        </li>
                    </ul>
                </nav>   
                
                <!-- Corps -->
                <xsl:for-each select="/TEI//div">
                    <div class="lettre">
                        <xsl:copy select=".">
                        <br/>
                        <h3>
                            <xsl:value-of select="head"/>
                        </h3>
                        <h4>
                            <xsl:value-of select="opener"/> 
                        </h4>
                        <xsl:for-each select="p">
                            <p>
                                <xsl:apply-templates/>
                            </p>
                        </xsl:for-each>
                    </xsl:copy>
                    </div>
                </xsl:for-each>
                
                <!-- Notes de bas de page -->
                <div class="lettre">
                    <xsl:for-each select="/TEI/text/body/div/p/note">
                    <note class="notesbp">
                        <xsl:attribute name="id">
                            <xsl:number level="any" format="1"/>
                        </xsl:attribute>
                        <a>
                        <xsl:attribute name="href">
                            <xsl:text>#</xsl:text>
                            <text>n</text>
                            <xsl:number level="any" format="1"/>
                        </xsl:attribute>
                        <xsl:number level="any" format="1. "/></a>
                        <xsl:apply-templates/>
                    </note>
                    <br/>
                </xsl:for-each>
                </div>
                
                <!-- Footer -->
                <div class="footer">
                    <xsl:value-of select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Rebecca Bristow')"/>
                    <br/>
                    <br/>
                    <xsl:value-of select="/TEI/teiHeader[1]/fileDesc[1]/publicationStmt[1]/p[1]"/>
                </div>
                
            </body>
        </html>
        </xsl:result-document>
        
        
        <!-- Page d'index des noms de personnes -->
        <xsl:result-document href="{$indexPers}">
            <html>
                <head>
                    <meta charset="UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="csssevigne.css"/>
                    <title>Structuration HTML des lettres de Madame de Sévigné</title>       
                    <meta name="author" content="R. Bristow"/>
                </head>
                <body>
                    <!-- Header -->
                    <div class="background">
                        <div class="titres">
                            <h1>
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type='main']"/>
                            </h1>
                            <h2>
                                <xsl:value-of select="//title[@type='subtitle']"/>
                            </h2>
                        </div>
                    </div>
                    
                    <!-- Sommaire -->
                    <nav class="nav">
                        <ul>
                            <li class="nav-link">
                                <a href="{$accueil}">Accueil</a>
                            </li>
                            <li class="nav-link">
                                <a href="{$indexPers}">Index des noms de personnes</a>
                            </li>
                            <li class="nav-link">
                                <a href="{$indexLieux}">Index des noms de lieux</a>
                            </li>
                        </ul>
                    </nav>   
                    
                    <!-- Corps -->
                    <div class="lettre">
                        <h3>INDEX DES NOMS DE PERSONNES</h3>
                        <xsl:apply-templates select="/TEI//particDesc"/>
                    </div>
                    
                    <!-- Footer -->
                    <div class="footer">
                        <xsl:value-of select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Rebecca Bristow')"/>
                        <br/>
                        <br/>
                        <xsl:value-of select="/TEI/teiHeader[1]/fileDesc[1]/publicationStmt[1]/p[1]"/>
                    </div>
                    
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page d'index des noms de lieux -->
        <xsl:result-document href="{$indexLieux}">
            <html>
                <head>
                    <meta charset="UTF-8"/>
                    <link rel="stylesheet" type="text/css" href="csssevigne.css"/>
                    <title>Structuration HTML des lettres de Madame de Sévigné</title>       
                    <meta name="author" content="R. Bristow"/>
                </head>
                <body>
                    <!-- Header -->
                    <div class="background">
                        <div class="titres">
                            <h1>
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type='main']"/>
                            </h1>
                            <h2>
                                <xsl:value-of select="//title[@type='subtitle']"/>
                            </h2>
                        </div>
                    </div>
                    
                    <!-- Sommaire -->
                    <nav class="nav">
                        <ul>
                            <li class="nav-link">
                                <a href="{$accueil}">Accueil</a>
                            </li>
                            <li class="nav-link">
                                <a href="{$indexPers}">Index des noms de personnes</a>
                            </li>
                            <li class="nav-link">
                                <a href="{$indexLieux}">Index des noms de lieux</a>
                            </li>
                        </ul>
                    </nav>  
                    
                    <!-- Corps -->
                    <div class="lettre">
                        <h3>INDEX DES NOMS DE LIEUX</h3>
                        <xsl:apply-templates select="/TEI//settingDesc"/>
                    </div>
                    
                    <!-- Footer -->
                    <div class="footer">
                        <xsl:value-of select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Rebecca Bristow')"/>
                        <br/>
                        <br/>
                        <xsl:value-of select="/TEI/teiHeader[1]/fileDesc[1]/publicationStmt[1]/p[1]"/>
                    </div>
                    
                </body>
            </html>
        </xsl:result-document>
        </xsl:template>
    
    <!-- Template des notes de bas de page -->
    <xsl:template match="/TEI/text/body/div/p/note">
        <sup>
            <xsl:attribute name="id">
                <text>n</text>
                <xsl:number level="any" format="1"/>
            </xsl:attribute>
            <a>
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:number level="any" format="1"/>
                </xsl:attribute>
                <xsl:number level="any" format="1"/>
            </a>
        </sup>
    </xsl:template>
       
    <!-- Template de l'index des noms de personnes -->
    <xsl:template match="/TEI//particDesc">     
        <xsl:for-each select="//person">
            <person>
                <xsl:attribute name="id">
                    <xsl:value-of select="./[@xml:id]"/>
                 </xsl:attribute>
            <xsl:choose>
                <xsl:when test=".//roleName">
                    <xsl:value-of select=".//roleName"/>
                    <br/>
                    <xsl:choose>
                        <xsl:when test=".//surname">
                            (<xsl:if test=".//forename">
                                <xsl:value-of select=".//forename"/>
                            </xsl:if>
                            <xsl:value-of select="concat(' ',.//surname)"/>)
                            <br/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test=".//forename">
                                (<xsl:value-of select=".//forename"/>)
                                <br/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test=".//surname">
                        <xsl:if test=".//forename">
                            <xsl:value-of select=".//forename"/>
                        </xsl:if>
                        <xsl:value-of select="concat(' ',.//surname)"/>
                        <br/>
                    </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            <xsl:if test=".//addName">
                Surnom: <xsl:value-of select=".//addName"/>
                <br/>
            </xsl:if>
            <xsl:value-of select="persName/note"/>
            </person>
            <br/>
            <br/>
        </xsl:for-each>
    </xsl:template>
    
    
    <!-- Hyperliens des noms de personnes vers l'index -->
    <xsl:template match="persName">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$indexPers"/>
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a> 
    </xsl:template>
    
    
    <!-- Template de l'index des noms de lieux -->
    <xsl:template match="/TEI//settingDesc">     
        <xsl:for-each select="//place">
            <place>
                <xsl:attribute name="id">
                    <xsl:value-of select="./[@xml:id]"/>
                </xsl:attribute>
                <xsl:value-of select="placeName"/>
            </place>
            <br/>
            <br/>
        </xsl:for-each>
    </xsl:template>
    
    
    <!-- Hyperliens des noms de lieux vers l'index -->
    <xsl:template match="placeName">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$indexLieux"/>
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a> 
    </xsl:template>
    
</xsl:stylesheet>