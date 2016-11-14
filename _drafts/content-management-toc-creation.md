---
layout: post
title: Content Management - more linking
published: false
categories: [blogging, web design, web development]
tags: [web design, content management]
---

This post/post series is all about navigation
1) TOC
2) Pagination support
3) intra-page navigation (top/home) - series table helps solve the problem for series posts
    design a custom includes element that can be used to create custom heading elements
    example javadocs.com/se/tutorial
4) digitaldrummerj posts for organising content by category/tag (after framework discussion)

Note: Wary of sidebars - occluding content and mobile nightmare!

TOC

change blog URL to "/blog/post-name"

? add to a series: Content Management

Discuss the different ways of implementing a table of contents
1) Standard kramdown toc attribute
http://stackoverflow.com/questions/9721944/automatic-toc-in-github-flavoured-markdown

2) Step 1 + Custom CSS
http://stackoverflow.com/questions/9602936/how-to-create-a-table-of-contents-to-jekyll-blog-post

3) Adding TOC to layout
http://stackoverflow.com/questions/13481572/jekyll-automatic-table-of-contents

3) Custom element to be included like the series panel in previous post

e.g. wrap basic TOC in a <div> that contains a text title
<div name="custom-toc">Contents
    {:toc}
</div>
<style>
    control div style
    control TOC style
</style>

SO - incidentally, this is how to cross reference a Stack Overflow post.
http://stackoverflow.com/questions/5319754/cross-reference-named-anchor-in-markdown#7335259

Show case code and output (might be hard, given that only ONE toc will show per page (I think)

ensure that TOC (and series panels) autohide when not in use or if series = invalid ( e.g. NULL or empty string )
