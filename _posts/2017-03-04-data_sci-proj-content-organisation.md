---
layout: post
title: Data Science Portfolio - Content Management Intro
project: overview
series: Project Organisation
published: true
categories: [data science, project, content management]
tags: [strategy]
---

## Introduction

I this series we will work through the process to implement the project organisation strategy outlines in the [previous post]({{ site.baseurl }}{% post_url 2017-03-02-data_sci-proj-strategy %}). This series can be considered to be a specialised [content management]({{ site.baseurl }}{% post_url 2016-11-14-content-management-part1-intro %}) series, if you will.

The main goal of the work that I am describing was to prototype and implement the **project glossary** page and **project overview pages** defined in the previous post. To achive this, I sought to construct the templates and components such that:

1. There is a useful degree of connectivity between the glossary page, individual project pages, drbulu blog posts and other external materials (as defined [elsewhere]({{ site.baseurl }}{% post_url 2017-03-02-data_sci-proj-strategy %}#organisation)).

2. This interconnected synergy is enabled in a way that minimises the quantity of repetitive work that I need to perform in order to maintain and expand it... this is why I moved to jekyll in the [first place]({{ site.baseurl }}{% post_url 2016-11-04-setup-us-the-blog-part1-preamble %}#preamble))!

## Basic idea

After a brief dig into my existing code, I realised that I would need a combination of specialised page layouts and includes components. Given that project-related pages were not ordinary pages, I wanted to separate this complexity from more simple page types without going overboard. Essentially, the basic structure that I settled on was as follows:

1. <b id="proj-layouts">layout templates</b>

These entities lay out the general structure that defines pages that will be made from them, as specified in the page's YAML. Will give uniformity to the general look of pages made using the same template. This also makes it much easier to modify a particular type (subset) of page without accidentally breaking other page types. Naturally, these live in the **```_layouts/```** subfolder.

* **project_overview_page.html**: This is a "singleton" template in that it (for the foreseable future) relates <u>only</u> to the [main project page]({{ site.baseurl }}{% post_url 2017-03-02-data_sci-proj-strategy %}#proj-glossary)).

* **project_overview_page.html**: This is the general template for the landing page that "coordinates" the various content pertaining specifically to [individual projects]({{ site.baseurl }}{% post_url 2017-03-02-data_sci-proj-strategy %}#proj-pages)). Basically, one overview page per project.

2. <b id="proj-includes">content inclusion fragments</b>

These fragments abide in the **```_includes/```** subfolder and are a mixture of the Liquid templating and html/css code that are needed to automatically source specific information and add it to a particular place in a particular layout under particular conditions. Usefully, included fragments can embed the same content in multiple layouts :cool:!

* **project_index.html**: Formerly project_**glossary**_.html, this entity lives primarily (if not solely) to serve the project index page. The aim, is to automatically catalogue new projects as pages are made for them by extracting each project's links and abstract info and placing it into a convenient summary of all of my projects.

* **abstract.html**: a fairly short, <u>lightly</u> formatted document that describes the project that it is related to. This is meant to be a [research paper-style](http://onlinelibrary.wiley.com/doi/10.1111/pbi.12650/abstract) synopsis of the project's background <u>without</u> any figures or tables, which belong elsewhere in the project. Tt is for this reason that this html file was renamed. This is a special includes fragment because one fragment persits in the project's main folder, next to the project's **index.html** file. Uniquely, each abstract file will be included in at least two places: **project_name/index.html** and **projects.html** (the main index/glossary page for all projects). This has the welcome benefit of avoiding any cut and paste shenanigans from project pages to populate the index and avoiding tedious prospect of me writing another abstract and linking it to the project.

* **project_related_posts.html**: The ability to seamlessly connect topical blog posts with project content has been a [long-standing goal]({{ site.baseurl }}{% post_url 2016-11-14-content-management-part1-intro %}) of mine. This is particuarly important to me due to the potential for cross-pollination between blogs and projects. For example, I can write one post about a topic of interest that may soon expand into a fully fledged project. Or learning outcomes (new ideas and challenges) obtained from working on projects can be further examined in isolation as blog posts to tackle specific ideas.

* **project_related_series.html**: This file represents a natural expansion of the related blog idea. Essentially, this fragment allows for the separate grouping of blog posts according to the [**series**]({{ site.baseurl }}{% post_url 2016-11-08-setup-us-the-blog-part4-in-series %}) that they belong to. To avoid duplication and facilitate compactness, the link associated with a series name is that of the <u>first</u> post in that series.

## Conclusion

Now that we have an idea of what we are in for... let's get into it :smile:

**Note:** all of the described layouts and includes fragments (except for **abstract.html**) feature the **project_** prefix. This is quite useful, in part because it means that we can locate these files for modification reasonably easily without jamming more subfolders in (not always useful).

**Note:** Naturally, all of the abovementioned project content is housed in the **```projects/```** subfolder.