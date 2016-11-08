---
layout: post
title: Setup us the blog 4 - draft series
series: Setup Us the BLOG!
published: true
categories: [blogging, web design, web development]
tags: [blogging, landing page, home page, web design, content management]
---

## Intro

This is the last post in the setup series. looking at the website so far, the core infrastructure is complete.  

* The site has a basic but decent landing page that gives users an idea of why the site exists.  
* The blog is functional and today's work, setting up drafts and series, will be helpful towards both generating new content (drafts) and making it valuable to users by adding better context (series).  
* The about page is still basic, but achieves its purpose quite well for now.  
* The bio page that I adopted from my previous project, being the most mature component of the site, serves its purpose for now in its current form. It will naturally evolve as I do.  

This may seem an arbitrary transition point, however, I would like to make the distinction between site setup and content management. I believe that I now have a fully functional site that I would be happy to share with others in its current form, therefore, I feel that the site is sufficiently setup. Reviewing some of upcoming work that I would like to do on the site, I realised that this was predominantly content management, as that is what the next set of features aim to achieve.

## Strategy
1. Add the capacity to write drafts. This is something that I have a great need to setup, and is quite simple to do. I often draft ideas with pen and paper as I find it a flexible and intuitive platform for idea creation and linkage (brainstorming). However, I frequently misplace the random scraps of paper upon which I stash my ideas. Further, even when I have dedicated notebooks for segregating topics into manageable spaces, I find that older (but still useful) ideas get lost in the clutter of newer ideas, and linking ideas across pages can be frustrating. I feel that the ability to write drafts will be a valuable staging point for generating and organising coherent content for future posts.

2. Implement the ability to connect related drafts as a series. This is something that I have been keen to do from the beginning. I have found it a most useful feature of many of the blogs that I have visited, particularly tutorials, and it will serve as a great way for me to connect and build upon the diffuse ideas that I expect to blog about. This will also help to generate other forms of content for this site (more of that in future :) ).  

## Implementation


1. Adding drafts  

* As per the [drafts page](https://jekyllrb.com/docs/drafts/) of the Jekyll documentation, I simply created a **```_drafts```** subdirectory in the main web project directory. Now I am able to add draft files without being concerned that they will be inadvertently published.   
* When I am ready to post a draft, all I need to do is to rename the draft using an [acceptable naming format](https://jekyllrb.com/docs/posts/) and move it to the **```_posts```** subdirectory for automatic publishing.  

2. Series posts

I basically followed the instructions of the [blog series setup article](http://digitaldrummerj.me//blogging-on-github-part-13-creating-an-article-series) on the digitaldrummerj.me set of tutorials.

* Series table of contents creation: I setup the **```series.html```** file in the **```_includes```** subdirectory as per the tutorial. However, I renamed the **```idx```** variable to **```articleID```** to better reflect its purpose. I am not a fan of arbitrary variable names, I find that if not properly throught through they induce untold and unecessary grief. For the curions, the original series.html is [here](https://github.com/digitaldrummerj/jekyllforblogseries/blob/master/_includes/series.html) if one wants to adopt it verbatim. I opted to include the series code insert at the top and bottom of each article in the series, and I changed the text template from "This article is Part X in a Y-Part Series called." to "This article is Part X in a Y-Part Series called series-name.". I originally copied and pasted the formatting code **```{% raw %}{% include series.html %}{% endraw %}```** into each article of a given series, however, since nothing is displayed in articles that are **not** part of a series, I included it in the **```posts.html```** file of the **```_layouts```** subdirectory, which defines the layout of all blog posts. This will be highly efficient as much copy-paste action will be avoided. Also, manually copied series formatting tags showed up in the main blog reel, which seemed a good idea initially, but would be undesirable for posts in long series.

* Series table of contents styling: I used the code excerpt provided by the tutorial's [CSS styling section](http://digitaldrummerj.me//blogging-on-github-part-13-creating-an-article-series/#section-3-adding-css), however, I was not happy with simply dumping the code into the **```style.scss```** file, as it seemed an act of pollution. Instead, I followed the example of some style code that is stored in the **```_sass```** subdirectory. I created a new file to this subdirectory called **```_panel-bootstrap-excerpt.scss```**, and added the following import statement to the end of the **```style.scss```** file: **```@import "panel-bootstrap-excerpt";```** file. I was inspired by [this](https://veithen.github.io/2015/03/26/jekyll-bootstrap.html) tutorial, which is also going to be handy should I want to have full bootstrap integration in future :). This was a great lesson that taught me how to seamlessly integrate custom CSS styling that I need to be accessible throughout the entire project. For more background, check the [assets section](https://jekyllrb.com/docs/assets/) of the Jekyll docs.

## Conclusion
Now that I have the ability to manage draft posts and seamlessly create blog series, the transition from site setup to ongoing content management is complete :).
