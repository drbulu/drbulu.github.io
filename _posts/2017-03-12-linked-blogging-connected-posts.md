---
layout: post
title: Data Science Portfolio - Content - Linking Blogs
project: overview
series: Project Organisation
published: true
categories: [data science, project, content management]
tags: [strategy]
---

## Introduction


## Comments

I found it useful to use liquid comments to help me organise my thoughts, which came quite useful wnen trying to navigate the logic of working with series

Note: trying to add html comments to _includes files i.e. liquid template files seemed to kill proper file processing... interestiong. As I kept finding when trying to put comments in **project_glossary.html**.
[This](http://stackoverflow.com/questions/27007323/how-do-you-comment-out-in-liquid) is how comments should be done

## including individual project posts

in _includes

project_related_posts.html


 the idea of looping through all the posts
    twice: 1. To see if any posts exist with a matching project
           2. To do the actual work
    
    to minimise this: searching from latest post to earliest post
    exit loop with posts_found = true when the first post is found
    
    While not pretty, this might help to neaten up downstream logic.
    This all had to be done because I wasn't prepared to live through
    the night mare that was project_related_series.html!

If at least one project-related post was found, the second stage of the loop could proceed and populate a list element with the post URL and post title

{% highlight html %}
{% raw %}<li><a href="{{ post.url }}">{{ post.title }}</a></li>{% endraw %}
{% endhighlight %}

overall, logic here is pretty simple.

## including project series posts

project_related_series.html

project prefix for organisational clarity 

both included in the **project_overview_page.html** layout and also in the **project_page.html**
{% raw %}{% include project_related_posts.html %}{% endraw %}

{% raw %}
  <div id="related_series">{% include project_related_series.html %}</div>
  <div id="related_posts">{% include project_related_posts.html %}</div>
{% endraw %}

can also restrict related posts to related non-series posts to avoid having a large list if the need arose.

post series code more involved. needed to refresh liquid [variable](https://help.shopify.com/themes/liquid/tags/variable-tags) assignments and [data types](https://help.shopify.com/themes/liquid/basics/types). ... well.... you can't initialise empty lists in liquid... ooookay :alien:

[Continue](https://help.shopify.com/themes/liquid/tags/iteration-tags#continue) will be handy here

Also, starting to make a habit, where possible of separating the liquid code blocks and HTML elements where possible, in addition to the judicious use of liquid comments.



basic logic

* loop through all site.posts from oldest to youngest (first to current)
* if site.posts[i] is part of a series.
    * check if an earlier post of the same series has already been added
    * if no --> add to a seriesPostList variable
    * if yes --> skip
    
constructed a multi line liquid tag in loop input validation step :smile: 
I didn't think that it was possible

https://help.shopify.com/themes/liquid/basics/whitespace

https://help.shopify.com/themes/liquid/filters/string-filters

Thought I was smart and used the ^caret as the split character for both URLs and Series titles... what a disaster! Glad that I didn't hard code the split character variable
Changing it to space made the URLs valid, but obviously messed up the Series titles
... options from here were to:

* have different string splits for Series titles and series post URLs
* use the selected series post URLs to extract the relevant series title - requiring another loop through 

Took simplest solution, made two split_char variables split_char_title for series titles
and split_char_url for the associated post URLs

I could have taken a fancier solution possibly, one which tried to exploit the fact that Liquid is [Ruby-based](http://stackoverflow.com/a/13660352), but... I can't be bothered, and much pain has already been experienced thus far. Further, the present solution, while probably not elegant... is definitely not a hack.

the title split char needed to be exotic, I.e. there would be a very low probability of ever seeing that combination of characters in a valid series title string. Therefore I chose the three character combination "|^|", which seemed too odd to be valid.

## Conclusion
