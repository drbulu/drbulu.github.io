---
layout: post
title: A focus on design
published: true
series: Content Management
categories: [ ]
tags: [ ]
---

# Web design strategies

## Intro
I believe that an important part of content management is the effective organisation and display of said content. Put simply, this is data visualisation and communication. I understand that these phrases have specific meanings relating to the dissemination of insights derived from data analysis and analytics processes, however, I use the concepts more generally in the context of 

Refer to series on [Content Management](link to first post) and what that is about

## Objectives:

* **Why**? Make page content viewing better by allowing users to quickly navigate to different parts of the page.

* **What**? Create a two section column layout to house the TOC and main page content separately.

* **How**? Use the simplest possible approach, leveraging HTML and CSS with minimal JavaScript. 

* **Where** & **When**? blog posts and pages (topic and/or project) 

I have nothing particular agains JavaScript, however, I want to make the pages as light weight as possible, avoiding the loading of toolkits or libraries (JavaScript or CSS) whose features I won't make effective use of.

## Jekyll layout management

Multiple content sections using Jekyll
https://github.com/jekyll/jekyll/issues/246

focusing on 

some solutions involve jekyll collections, but this isn't a strategy that I think fits my web design aims. I am looking for a really simple solution to have a toc and main content column design. More important, I don't understand Jekyll's content collection enough to want to invest in the attempt to apply it. A brief look at the [relevant Jekyll docs section](https://jekyllrb.com/docs/collections/) would seem to validate my caution.
http://dev-notes.eu/2016/08/page-sections-in-jekyll-seperating-content-from-layout/
https://talk.jekyllrb.com/t/best-way-to-provide-multiple-content-sections-for-a-single-page/1477

An interesting and potentially useful approach is the use of [capture tags](http://www.rubydoc.info/gems/liquid/Liquid/Capture) to break up document content into sections from what I can see in [this](https://github.com/jekyll/jekyll/issues/246#issuecomment-583053) example.

# Responsive web design
http://www.creativebloq.com/responsive-web-design/build-basic-responsive-site-css-1132756

tabbed panels: http://code.stephenmorley.org/html-and-css/tabbed-panels/

https://www.smashingmagazine.com/2011/01/guidelines-for-responsive-web-design/

flexible grids example: http://learn.shayhowe.com/advanced-html-css/responsive-web-design/


## Options

1) A side-panel TOC with main content panel that accomodates smaller screens by either
a) Changes to linear layout with TOC above Content
b) uses tabbed sections to allow the user to switch between TOC and main content.

It would be interesting to demo a couple of the more promising options, however, wisdom dictates the selection of one option for deployment.


