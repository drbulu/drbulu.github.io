---
layout: post
title: Content Management - Useful Tools 1
series: Content Strategy
published: true
categories: [blogging, web design, web development]
tags: [web design, content management, resources]
---

From manifesto to toolkit!

## Intro
The previous post covered the principles that I hope to govern the content that I put up on this site. Now that this ground work has been laid out, the next logical step for me was to gather together some of the basic tools that I will need to rely upon in order to effectively produce said content.

## Markdown 
### Overview
The Jekyll documentation website gives a [good overview](http://jekyllrb.com/docs/home/#so-what-is-jekyll-exactly) of what Jekyll is and basically how it works to generate websites from simple text files. Naturally, Jekyll can handle HTML content, however one of the benefits of the Jekyll system is its capacity to handle Markdown-formatted text files. Markdown has a good (i.e. accessible to understand) [Wikipedia page](https://en.wikipedia.org/wiki/Markdown), as always, and a decent page at [Daring Fireball](http://daringfireball.net/projects/markdown/), which is run by one of Markdown's creators. This tool basically converts specially formatted text files to HTML (or other formats) using a processing program that recognises selected combinations of basic, easy to use, keyboard characters as its syntax.

### Kramdown
Markdown seems to have a number of variants, one of which is [**kramdown**](http://kramdown.gettalong.org/parser/kramdown.html). Jekyll seems to be flexible regarding the [markdown processor](https://jekyllrb.com/docs/configuration/#markdown-options) that can be used, in order to host a Jekyll website on Github, kramdown is the only supported Markdown processor according to their [help site](https://help.github.com/articles/updating-your-markdown-processor-to-kramdown/). Incidentally, for those who haven't spotted this, kram is mark in reverse ;).

Given that the **Ruby**-based kramdown is the way forward with Jekyll (also Ruby-based), it is a good idea to have the kramdown [quick reference guide](http://kramdown.gettalong.org/quickref.html) handy for easy reference. The kramdown [syntax guide](http://kramdown.gettalong.org/syntax.html) provides a more indepth coverage of the capabilities of this markdown variant. I will be looking at these useful resources to avoid being tripped up unecessarily by syntax misuse, that can intruduce hillarious and frustrating bugs into ones processed HTML source pages.

### RMarkdown

[RMarkdown](http://rmarkdown.rstudio.com/) is a variant of the Markdown language adapted for use with the [R programming language](http://r-project.org/), which has [comprehensive network](https://cran.r-project.org/) that supports its user base. RMarkdown is maintained by RStudio and their project page gives an overview of the multitude of applications and outputs that it facilitates including the creation of [Word](http://rmarkdown.rstudio.com/word_document_format.html), [HTML](http://rmarkdown.rstudio.com/html_document_format.html) and [interactive web apps](http://rmarkdown.rstudio.com/authoring_shiny.html) to name a few from the growing list. For example, RStudio have an amazing [gallery](http://shiny.rstudio.com/gallery/) of links to examples of interactive web apps powered by their [**Shiny**](http://shiny.rstudio.com/) platform. Closer to home, I made a shiny app called [**Stats Tutorial**](https://drbulu.shinyapps.io/stats_tutorial/) as part of a course on developing [Data Products](https://www.coursera.org/learn/data-products) that I did on Coursera.

I have used RMarkdown, in conjunction with the [RStudio](https://www.rstudio.com/) IDE, often to write and compile data analyses to write reports that seamlessly integrate text (markdown), R code excerpts (RMarkdown integration) and analysis outputs (tables, graphs and inline text output). This has allowed me to interactively analyse my data and write up my findings as I go, making refinements to my analysis and documenting my progress. Needless to say, RMarkdown is a great tool for [reproducible research](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research), which is a concept that I first came to grips with [here](https://www.coursera.org/learn/reproducible-research).

Getting RMarkdown to work with Jekyll is going to be quite important for me, as many of the topic and project pages that I intend to create. However, there is much more to consider when setting up for RMarkdown integration and I want to do a bit more reading while I contemplate which path to tread.

### Python integration

I haven't used [Python](https://www.python.org/) in the wild, and haven't touched it since my [Codecademy](https://www.codecademy.com/) days of yore. This is another widely used language and, like R, has data science integration via the [Pandas](http://pandas.pydata.org/) package, with [iPython](http://ipython.org/) for similar interactive data analysis. Python also seems to have support for Markdown via its [Notebook](https://en.wikipedia.org/wiki/IPython#Notebook), which is helpful for reproducible research. In combination, this seems to be a comparable toolkit to RMarkdown and Rstudio, with added functionality available via projects such as [webpy](http://webpy.org/) for web document creation.

I have included this section on Python because I want to get into this language in the near future, and this fits well in the overall theme and strategy of this series.

## Conclusion
In this part of the series, I have started to overview important content development and management tools that I am (or intend) to use in my future professional development. Consequently, I will be making much use of them in the creation of this site.

In subsequent parts, I will be:

* **i)**   covering more of the tools that I use.
* **ii)**  going into more depth about RMarkdown and, specifically, how I want to integrate it into content development
* **iii)** expanding upon the principles that I laid out in **part 1** as I implement my content management strategy.

Thanks for reading this post, I hope that you are edified by what I have shared and find use for it on your journey.

