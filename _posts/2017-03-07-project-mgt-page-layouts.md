---
layout: post
title: Data Science Portfolio - Content - Laying It Out
project: overview
series: Project Organisation
published: true
categories: [data science, project, content management]
tags: [strategy]
---

## Introduction

Now that we have an idea of what the strategy is, we can get to work. The first components to setup are the layout files, which define how the content relating to a specific type of page is put together. It was fairly obvious to me that conscripting the default layout for "standard" pages on this site, **```page.html```**, would be highly undesireable. Basically, I had a vision for a collection of simple, well defined (also well named), templates that served an easily discernible role in the website.

## Project Index

This page provides both an introduction to its purpose, as an index of my various data science project matter, but also organises said content in a readily perusable way. Given the unique role in which this page would function, I decided to give it a different layout from other that of project pages. This unique layout lives in the **`project_index_page.html`** file of the **`_layouts`** subfolder. Originally, this layout was called **`project_overview_page.html`** which is semantically similar but slightly more vague in my opinion.

The structure of this file extends that of **`page.html`** with the addition of three div elements that each contain a single Liquid [includes tags](http://jekyllrb.com/docs/includes/) pertaining to the desired content to include. Below the content, the following content sections will be included in order:

* [project index]({{ site.baseurl }}{% post_url 2017-03-09-project_indexing %}): a list of project pages including title and abstract info.
* [related series]( 2017-03-12 post ): a list of the blog post series that share the same project name
* [related posts]( 2017-03-12 post ): a more detailed list of the individual posts, both series and standalone, related to a particular project.

The project index is unique to the project content sphere, and is only featured in the index page. Therefore, the project index includes file will only be called here. However, the post-related includes files will also provide content to the pages of individual projects.

Posts and series, such as this one, that are related to the project index are of a strategic nature, and are therefore given the project name "overview" in order to display them on the index page. This allows me to be able to use the post-related includes infrastructure in both the **`project_index_page.html`** layout, as well as in the project page layout]. The inclusion of sections related to blog posts are included into the document based on the following variables:

{% highlight yaml %}
---
# project or index page YAML variable section
show_project_posts: true
show_project_series: true
# ...
---
{% endhighlight %}

## Project Pages 

These pages will host all of the content relating to specific, individual projects and will collate information from disparate sources such as Github, Kaggle or other places where project-specific content is held. Conceivably, this would also relate to individual projects on each page. This information constitutes the project page's default content section and are manually constructed according to project-specific requirements.

The structure of this file, like the [project index](#project-index) above, extends that of **`page.html`** with specific includes files. After the project content, the **related series** and **related posts** includes sections are listed [as above](#project-index).

The most interesting includes item is actually a custom, simple type of included content... the abstract. This file is a very basic synopsis of a particular project and has the following properties:

* Resides in the same subfolder as the project page's **`index.html`**
* Is included in the project page via the YAML variable **`page.abstract`** as follows:

{% highlight yaml %}
---
# project or index page YAML variable section
abstract: abstract.html
# ...
---
{% endhighlight %}

Interestingly, the **`abstract.html`** includes file is itself also included in the project_index.html file that is included in the project overview page. More on this in the next post :smile:. 

## Conclusion

With this overview of the layouts that we need, let's move on to defining the different includes files that give life to these layouts.