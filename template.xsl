<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <xsl:if test="brilliant/lang != ''">
                <xsl:attribute name="lang">
                    <xsl:value-of select="brilliant/lang" />
                </xsl:attribute>
            </xsl:if>


            <head>
                <title><xsl:value-of select="brilliant/title" /><xsl:if test="brilliant/title != ''"> | </xsl:if>Drexel Students for Christ</title>
                <link rel="stylesheet" href="screen.css" type="text/css" media="screen" />
                <link rel="stylesheet" href="print.css" type="text/css" media="print" />
                <link rel="shortcut icon" href="static/ico/RGB-icon-Church.ico" />
            </head>


            <body class="discipleship">
                <div class="background">
                    <video autoplay="autoplay" loop="loop" muted="muted" preload="auto" id="videoBackground" style="position: absolute; bottom: 0px; left: 0px; min-width: 100%; min-height: 100%; width: auto; height: auto; z-index: -1000; overflow: hidden; background-color:#002;">
                        <source src="http://drexelforchrist.org/_resources/Blue_Discs.webm" type="video/webm" />
                        <source src="http://drexelforchrist.org/_resources/Blue_Discs.mp4" type="video/mp4" />
                        <!-- KURTZ alternative for browsers which don't support the Video tag -->
                    </video>

                </div>
                <div id="header">
                    <div id="headerColorBar" class="printOnly">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                             viewBox="0 0 600 10" preserveAspectRatio="xMidYMid slice">
                            <rect x="0" y="0" width="600" height="10" style="fill:rgb(248,193,44);" />
                        </svg>
                    </div>
                    <div id="logo">
                        <img src="static/CMYK_community_wide.svg" class="printOnly" id="printLogo" alt="Drexel Students for Christ" />
                        <div class="printOnly printPageTitle"><xsl:value-of select="brilliant/title" />
                            <span id="printPageSubtitle"><xsl:value-of select="brilliant/subtitle" /></span>
                        </div>
                    </div>

                </div>
                <div id="corset">
                    <!--<img class="content" src="static/img.png" />-->
                    <h1 class="noPrint">
                        <span id="pageTitle"><xsl:value-of select="brilliant/title" /></span>
                        <xsl:if test="brilliant/subtitle != ''">
                            &#160;<xsl:value-of select="brilliant/subtitle" />
                        </xsl:if>
                    </h1>
                    <section>
                        <h2>Friday Evening</h2>
                        <p>The material for this session is on the shorter side. I suggest discussion groups take an appropriate amount of time to get to know each other.</p>

                        <p><strong>Primary Text:</strong> Colossians 1:13-20</p>

                        <p><strong>Objective:</strong> General Overview; the Image of the Invisible God; All the Fullness</p>

                        <p><strong>Major Sources:</strong> Tim Keller, John Piper, Gerald Bray</p>

                        <blockquote>
                            <p><strong><sup>13</sup>He [the Father] has delivered us from the domain of darkness and transferred us to the kingdom of his beloved Son, <sup>14</sup>in whom we have redemption, the forgiveness of sins.</strong></p>
                            <p><strong><sup>15</sup>He is the image of the invisible God, the firstborn of all creation. <sup>16</sup>For by him all things were created, in heaven and on earth, visible and invisible, whether thrones or dominions or rulers or authorities—all things were created through him and for him. <sup>17</sup>And he is before all things, and in him all things hold together. <sup>18</sup>And he is the head of the body, the church. He is the beginning, the firstborn from the dead, that in everything he might be preeminent. <sup>19</sup>For in him all the fullness of God was pleased to dwell, <sup>20</sup>and through him to reconcile to himself all things, whether on earth or in heaven, making peace by the blood of his cross. </strong><cite>(Colossians 1:13-20 ESV)</cite></p>
                        </blockquote>

                        <p>This rather short passage specifically lays out 15 attributes of Jesus:
                            <ol>
                                <li>&#8220;In whom we have redemption, the forgiveness of sins&#8221; (v 14)</li>
                                <li>&#8220;The image of the invisible God&#8221; (v 15)</li>
                                <li>&#8220;Firstborn of all creation&#8221; (v 15)</li>
                                <li>&#8220;By Him, all things were created in heaven and on earth, visible and invisible, whether thrones or dominions or rulers or authorities&#8221; (v 16, we’ll be camping out on this one tomorrow night)</li>
                                <li>&#8220;All things were created through Him&#8221; (v 16)</li>
                                <li>&#8220;All things were created for Him&#8221; (v 16)</li>
                                <li>&#8220;He is before all things&#8221; (v 17)</li>
                                <li>&#8220;In Him all things hold together&#8221; (v 17)</li>
                                <li>&#8220;The Head of the body, the church&#8221; (v 18)</li>
                                <li>&#8220;The beginning&#8221; (v 18)</li>
                                <li>&#8220;The firstborn from the dead&#8221; (v 18)</li>
                                <li>&#8220;In everything&#8230; preeminent&#8221; (v 18)</li>
                                <li>&#8220;In Him, all the fullness of God was pleased to dwell&#8221; (v 19)</li>
                                <li>&#8220;reconciles all things to himself whether on earth or in heaven&#8221; (v 20)</li>
                                <li>&#8220;making peace by the blood of His cross.&#8221; (v 20)</li>
                            </ol>
                        </p>
                        <p>While we could probably spend hours picking at any one of these phrases, we don’t have time at the moment.  We’ll thus look at just a few of them in-depth.</p>

                        <h3>The Image of The Invisible God</h3>

                        <p>Focus on verse 15.</p>

                        <blockquote>
                            <strong><sup>15</sup>He is the image of the invisible God, the firstborn of all creation.  </strong>  <cite>(Colossians 1:15 ESV)</cite>
                        </blockquote>

                        <p>As we read this, we almost think this is obvious.  God, who is invisible, came as a man, and became visible.  So why is Paul so explicit here?  Why bother mentioning this?</p>

                        <h4>A Unifying Statement</h4>

                        <p>Bear in mind that when Paul is writing to the churches, he’s always writing to one or both of two different groups: the Jews and the Gentiles. Very often, he has to remind these two groups of Christians that they are supposed to be united as one body under Christ.  In this sentence, Paul is actually doing that. </p>

                        <p>The Jews were very familiar with their invisible God.  The God of the Old Testament never shows a face, but only shadowy or fiery allusions.  The Gentiles, on the other hand, are very familiar with the idea of having an image to worship.  Their temples are full of such images, and these individuals have probably offered sacrifices to these images.  Here, Paul is uniting these two ideas by pointing out that Jesus is the invisible God, and has the properties of the invisible God: he is above and beyond us, and he is completely sovereign over us; and yet he also has properties of a visible god: he’s present among us, he speaks to us, he can relate to us, and we can see him in our own lives.  In a sense, this is tying together heaven and earth.</p>

                        <h3>Creator &amp; Sustainer</h3>
                        <p>Focus on verses 16-17.</p>

                        <blockquote>
                            <strong><sup>16</sup>For by him all things were created, in heaven and on earth, visible and invisible, whether thrones or dominions or rulers or authorities—all things were created through him and for him. <sup>17</sup>And he is before all things, and in him all things hold together.  </strong><cite>(Colossians 1:16-17 ESV)</cite>
                        </blockquote>

                        <p>Jesus is the one who made everything that there is.  His power is manifest in the fact that you exist.  He formed us in his mind and then brought us into being, and we only continue to exist because he wills it.</p>

                        <p>This world has issues.  As sinful people, we’re generally trying to destroy the world. Even when we try to do something good, there’s still something bad that goes with it.  And yet, the creator of this world continues to preserve it by His power.</p>

                        <p><strong>IMPORTANT!</strong> Everything that happens, happens because God wills it to happen. If God did not want these things to happen, he could simply make them cease to exist. Obviously, however, God, chooses to continue sustaining.</p>

                        <h3>Renovator</h3>

                        <p>We’ll be talking about the “authorities” in verse 16 more tomorrow, but Paul is pointing out that these entities that exist to control us, are only here because Christ put them there and keeps them there.  As Christ is in control of these “authorities,” he also controls us.  Perhaps it’d be better phraseology to say that God owns us. </p>

                        <p>When we own a significantly valuable thing, a car, for instance, we want to take care of it, and we look after it.  If, then, God owns us, it is in God’s interest to take care of us because we are his.  Although he owns us, we are not what he wants us to be.  We’re like a ruined mansion that needs rebuilding.  How does he do that?</p>

                        <p>When we renovate houses, we often do it “on the cheap” and aren’t as thorough as we should be.   We patch leaks, rather than replacing the roof.  Fortunately, this is not how God renovates us; God, in redeeming us, does not simply start with who we are and patch up here and there.  Rather, he goes after the problem in the foundations of our lives: our sinfulness.</p>

                        <p>To clarify, being sinful is deeper than committing sins.  It’s part of who you are, and poisons your relationship with God.  It doesn’t matter what you do; everything is tainted by your sinfulness.  The only way to deal with this is to tear everything down—tear your life apart—and rebuild it from the beginning.  This is what Jesus came to do.</p>

                        <p>Jesus came to live our life, to die by taking the burdens of our sins, to put an end to the sinfulness of the life we live.  He then came back again, to show that this is what the new life in him is all about: we are united in him in his resurrection, which has put to death the sin that destroys us.  Consider the well-known 2 Corinthians 5:21:</p>

                        <blockquote>
                            <sup>21</sup>For our sake he made him to be sin who knew no sin, so that in him we might become the righteousness of God. <cite>(2 Corinthians 5:21 ESV)</cite>
                        </blockquote>

                        <h3>All The Fullness [of God]?</h3>

                        <blockquote>
                            <strong><sup>19</sup>For in him all the fullness of God was pleased to dwell  </strong><cite>(Colossians 1:19 ESV)</cite>
                        </blockquote>

                        <p>I should probably mention that in the original Greek, it doesn’t say “all the fullness of God was pleased to dwell”, but rather just “all the fullness was pleased to dwell.”  This raises the question as to why our Bible translators inserted these words.   Most likely, our answer to that comes in chapter 2.</p>

                        <blockquote>
                            <sup>9</sup>For in him the whole fullness of deity dwells bodily <cite>(Colossians 2:9 ESV)</cite>
                        </blockquote>

                        <p>Here in chapter 2, Paul is clearly making a case for the full divinity of Jesus Christ: fully God in human form.  Completely God, but full-bodied man.  Translators and commentators suggest this is the same point Paul is reaching for in Chapter 1.</p>

                        <p>Perhaps that’s the case.  However, although Paul is using similar language in these two passages, he is not using the same language.  Perhaps Paul is trying to say something else.  If so, what is it?</p>

                        <p>Perhaps a better interpretation would look to the immediate context and phrase it more like, “in Christ it pleased God for the fullness of redemption to dwell.”  This would certainly be consistent with the rest of the sentence in v 20.  Jesus does not just provide salvation for some of our problems, but Jesus embodies the entirety of our redemption.</p>

                        <p>I want to point out that these two interpretations are not mutually exclusive.  There is no question that Paul thinks Christ is fully divine and bears the fullness of God; he established that in 2:9.  However, I’m willing to suggest that Paul may also be suggesting here just how complete the redemptive work in Christ.</p>

                        <p>To put this another way, all the fullness of what God is doing in salvation is found in Christ.  It’s not as though some of the work of salvation is done through Christ and other parts are done apart from Christ.  No, all the fullness of what God is doing in salvation, is through Christ.</p>

                        <p>Christ then provides all the salvation that is necessary for all things, and (v 20) is reconciling to himself all things, by the blood of his cross.</p>

                    </section>
                    <section>
                        <h2>Unrelated Music</h2>
                        <table>
                            <tr>
                                <th style="text-align:left">Title</th>
                                <th style="text-align:left">Artist</th>
                            </tr>
                            <xsl:for-each select="brilliant/content/catalog/cd">
                                <tr>
                                    <td><xsl:value-of select="title"/></td>
                                    <td><xsl:value-of select="artist"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </section>
                </div>
                <div id="footer">
                    <div class="noPrint">&#169;  Drexel Students for Christ | connect with us: </div>
                    <span id="printPageNumber" class="printOnly" />
                    <div id="footerColorBar" class="printOnly">
                        <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                             viewBox="0 0 600 10" preserveAspectRatio="xMidYMid slice">
                            <rect x="0" y="0" width="600" height="10" style="fill: #4fc2ff;" />
                        </svg>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>