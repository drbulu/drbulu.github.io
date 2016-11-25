---
layout: post
title: Maths
published: false
categories: [blogging, web design, web development]
tags: [web design, content management, resources]
---

Math time!

## Intro

[Mathematical notation](https://en.wikipedia.org/wiki/Mathematical_notation) is another tool that I expect to make use of, particularly for my continued study in statistics. I have thought much about how to implement this in my site, and I decided to learn from the [**series panel**]({{ site.baseurl }}{% post_url 2016-11-08-setup-us-the-blog-part4-in-series %}) setup blog post. For this strategy, I need the following components

* an **```_includes```** file that embodies the code needed to implement the math functionality.

* modification of the content layout template pages with the appropriate Liquid tag.

* a YAML variable in the front matter to control the activation of the math functionality.

##  Implementation

The idea is to use [MathJax](https://www.mathjax.org/) functionality to enable me to easily construct complex mathematical equations. This is a superior approach to using raw HTML [entities](HTML_character_entity_reference) and [symbols](http://www.w3schools.com/html/html_symbols.asp), "which seemeth frighteningly tedious unto me!".

### Includes

Jekyll has an example of what I want to achieve in the [extras page](https://jekyllrb.com/docs/extras/#math-support) of the documentation. Essentially, I am creating a file **```mathjax.html```** in the **```_includes```** directory that contains an HTML script tag to import MathJax functionality when this fragment file is included. I could have downloaded the MathJax JavaScript file and linked to that, but linking out is good for now, since I don't have to manage version updates.


<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

###

y = mx + c

sum of squares
    		<p>$$SS = \sum_{i=1}^n (X_i - X_C)^2$$</p>