---
layout: post
title: Data Science Portfolio - Content - Project Indexing
project: overview
series: Project Organisation
published: true
categories: [data science, project, content management]
tags: [strategy]
---

## Introduction

## Project Index

The structure of this file extends that of **`page.html`** with the addition of three div elements that each contain a single Liquid [includes tags](http://jekyllrb.com/docs/includes/) pertaining to the desired content to include. Below the content, the following content sections will be included in order:


{% highlight yaml %}
---
# project or index page YAML variable section
show_project_posts: true
show_project_series: true
# ...
---
{% endhighlight %}


## Conclusion

With this overview of the layouts that we need, let's move on to defining the different includes files that give life to these layouts.