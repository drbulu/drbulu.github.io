---
layout: post
title: Content Management - Useful Tools 3 - No Mr Hyde!
series: Content Strategy
published: true
categories: [blogging, web design, web development]
tags: [web design, content management, resources]
---

Introducing Dr Jekyll...

## Intro
In the first blog post series, [**Setup Us the BLOG**]({{ site.baseurl }}{% post_url 2016-11-04-setup-us-the-blog-part1-preamble %}), I gave an overview of why I chose to use the Jekyll website generation framework and how I setup the foundation of this site. Therefore, Jekyll is the next obvious tool to master, and this post is a culmination of my initial attempt to come to grips with the features of this framework, to enable me to make the best use of to generate good content.

Incidentally, I have also taken to using [RStudio](https://www.rstudio.com/) as my Markdown IDE, since it handles the task quite well and has good overall features.

## Jekyll
As I have been setting up this blog and adding blog content, I have found myself looking up the [docs](http://jekyllrb.com/) to make it easier and more efficient to create content. There is a lot of rich content in these pages, much of which I won't need to use frequently.

Thus far, I have been [creating site pages](http://jekyllrb.com/docs/pages/), [using variables](http://jekyllrb.com/docs/variables/) and [cross-referencing posts](http://jekyllrb.com/docs/templates/#post_url) as part of routine content generation. More advanced content that I expect to regularly use are [templates](http://jekyllrb.com/docs/templates/), [permalinks](http://jekyllrb.com/docs/permalinks/) and [pagination](http://jekyllrb.com/docs/pagination/).

## YAML
From what I have experienced so far, the [YAML](http://yaml.org/) section (or [front matter](http://jekyllrb.com/docs/frontmatter/)) provides configuration information to guide the processing of site content by Jekyll and Liquid. For example, what layout should be used to format the Markdown file content, post or page? [Wikipedia](https://en.wikipedia.org/wiki/YAML) has a nice article on the subject, but frankly, I don't really too much about it at the moment.

## Liquid
Jekyll makes use of [Liquid](https://shopify.github.io/liquid/) to "auto-fill" or "auto-complete" different parts of the website into a coherent, well formatted, whole in a way that eliminates as much repetitive manual labour as possible.

I liken it to how a mail merge function extracts specific parts from an information source to produce a product, e.g. customised label or set of emails. For those of you who are familiar with RMarkdown, [knitr](https://en.wikipedia.org/wiki/Knitr) performs a similar function to produce formatted documents based on data processed by specially embedded R code.

Basically, Jekyll uses Liquid and YAML to faithfully write and construct the boring and tedious parts of the website so that the user (you) can focus on writing interesting, unique content in a reproducible and manageable way. For example, writing Markdown is easier than having to write HTML and wrap content properly in [HTML elements](http://www.w3schools.com/html/html_elements.asp) (links are a big one for me), but one can still "HTML it up" (sic) whenever one wants or needs to.

The best motivating example for me was the setup of the [**blog series**]({{ site.baseurl }}{% post_url 2016-11-08-setup-us-the-blog-part4-in-series %}) panel layout. The constant effort of updating a series table of contents every time I write a post to add to an existing (or new) series has been replaced by a set of recyclable tools.

## Conclusion
This post isn't an exhaustive look into these subjects, so much as a useful primer to familiarise myself with the useful properties of these tools that I will make must use of. It has been an interesting look into how these important pieces work together to help me effect the production and management of my site's content. 

I am glad to have made this detour to understand these topics a bit more (particularly Liquid) as I use them to manage this site. I hope that you, dear reader, found this post useful!