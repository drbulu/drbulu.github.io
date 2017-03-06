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

Once the layouts were ready, the next stage was to code up the includes fragments responsible for integrating project-related blog post content. However, before we start a comment about comments. To help me through this process I found it useful to use liquid comments to help me organise my thoughts, which came quite useful wnen trying to navigate the logic of working with series posts. Interestingly, trying to add html comments to files in the **`_includes`** subdir (probably generalises to other liquid-heavy types) played havoc with the proper processing of such files. As it turned out, [this](http://stackoverflow.com/questions/27007323/how-do-you-comment-out-in-liquid) is how comments in Liquid should be added :smile:. In  addition to the judicious use of liquid comments, I started to to make a habit, where possible, of separating the liquid code blocks and HTML elements.

## Including individual posts

In order to include individual posts as a simple custom navigation entity, I used the following general strategy:

**1)** Loop through all of the posts to check if a related post exists. 
    * One where the post's project post YAML variable matches the project of the current page.
    * We want to loop from the latest post backwards to the earliest post, exiting as soon as a matching post is found. The following loop syntax will help us:
     
{% highlight liquid %}{% raw %}{% for post in site.posts %}{% endraw %}{% endhighlight %}
     
Note that adding the word "reversed" will start the loop from the <u>first</u> post:
     
{% highlight liquid %}{% raw %}{% for post in site.posts reversed %}{% endraw %}{% endhighlight %}
     
**2)** Loop through all of the posts again and checking for matching posts. This stage only excecutes if at least one project-related post was found and does the main work of extracting the titles and URLs of matching posts using them to populate list elements as follows:

{% highlight html %}
{% raw %}<li><a href="{{ post.url }}">{{ post.title }}</a></li>{% endraw %}
{% endhighlight %}

Overall, logic here is pretty simple and the [continue](https://help.shopify.com/themes/liquid/tags/iteration-tags#continue) came in very handy. I wasn't happy about having to loop twice through **`site.posts`**, but this works out ok. The first loop helped to simplify the downstream logic. This work was done in the **`project_related_posts.html`** includes file.

## Including series posts

The next, and more challenging phase was the creation of the **`project_related_series.html`** includes file. This proved infuriating at more than one point and required much more libation (Liquid) than one might have expected.

### Array create... what?

One of the first things that I did was to avail myself of more Liquid to refresh myself (pun intended) on how [variable](https://help.shopify.com/themes/liquid/tags/variable-tags) assignments and [data types](https://help.shopify.com/themes/liquid/basics/types) worked. Oddly, you can't [initialise](https://help.shopify.com/themes/liquid/basics/types#initializing-arrays) arrays in liquid?! well... ooookay then :alien:. I am sure that there is a good reason for that... surely?

Consequently, drawing further inspiration from [here](http://stackoverflow.com/questions/27433649/reuse-file-path-in-jekyll#27434079) and the fact that arrays can be created by [string splitting](https://help.shopify.com/themes/liquid/basics/types#initializing-arrays), I decided to create arrays, where needed, by a combination of concatination ([capture](https://help.shopify.com/themes/liquid/tags/variable-tags#capture) tags) and fragmentation ([split](https://help.shopify.com/themes/liquid/filters/string-filters#split) filter). First irritation resolved :smirk:!

### Strategy

Now I could strategise about how to construct a list of blog post series that were associated with a particular project:

**1)** Loop through all of the posts and process blog posts and obtain information about each series
    * get the first post URL and Series Title of each series 
    * this meant that I had to loop through the series posts from <u>oldest</u> to newest (as discussed [here](#including-individual-posts))
    * <b style="color:red;">Note:</b> I also needed to filter out non-project posts using conditional logic.

**2)** Construct a nav list from the info extracted from step 1.

### I'll non-break your space alright!

Enter the second, more frustrating irritation. In order to facilitate the [strategy](#strategy) in step 1 above, I figured that I would be smart and use the caret (&#94;) as the split character for both URLs and Series titles... what a disaster that turned out to be! On the bright side, I am glad that I didn't hard code the split character variable, making the problem relatively simple to find.

After attempting [whitespace management](https://help.shopify.com/themes/liquid/basics/whitespace) and [string filtering](https://help.shopify.com/themes/liquid/filters/string-filters) with little initial success I was stumped. Extra spaces " " were simple to remove, however, whatever whitespace was responsible for producing the %A0 character in the final URL would not go away. I suspected that this string of characters (%A0) cropped up <u>after</u> the Liquid had done its work but somewhere <u>before</u> or during formatting of the final html link. This, I figured, would explain why using a [remove](https://help.shopify.com/themes/liquid/filters/string-filters#remove) filter to get rid of it would have been pointless.

As it turned out, the %A0 character combination (reference [here](https://www.w3schools.com/tags/ref_urlencode.asp)), is a [non-breaking space](https://en.wikipedia.org/wiki/Non-breaking_space) character, according to a search of the UTF-8 variant [%C2%A0](http://www.fileformat.info/info/unicode/char/a0/index.htm).

Upon reflection, possible Liquid solutions to this problem may lie in the string filters: [url_encode](https://help.shopify.com/themes/liquid/filters/string-filters#url_encode), [url_escape](https://help.shopify.com/themes/liquid/filters/string-filters#url_escape) and [url_param_escape](https://help.shopify.com/themes/liquid/filters/string-filters#url_param_escape). These are worth keeping in mind for later, as they would simplify the code and come in handy in other situations. I suspect that this functionality was made for "such a time as this". *Sigh*, more reading and less "casting of lots" would have been far more beneficial :alien:.

At the time, I took the simplest solution, and made two characer splitting variables to replace **`split_char`** for series title text (**`split_char_title`**) and associated post URLs (**`split_char_url`**). This was after finding out that using a standard empty space (" ") in the creation and splitting of individual post URLs. Obviously, this wasn't possible for the processing of title text, where the title split character needed to be more exotic, i.e. not likely to be seen under normal circumstances in a valid series title string. Therefore, I chose the three character combination "&#124;&#94;&#124;" of caret and vertical bar (&#124;) which seemed too odd to ever occur in a valid series title.

## Visibility

The following code snippet was included in both the **project_overview_page.html** and **project_page.html** layout files:

{% highlight html %}
{% raw %}
  <div id="related_series">{% include project_related_series.html %}</div>
  <div id="related_posts">{% include project_related_posts.html %}</div>
{% endraw %}
{% endhighlight %}

However, there was a slight problem. What would I do if:

1. I only wanted to include one, or neither of these elements?
2. There were no project-related posts that existed either as a series or individually?

The first scenario was resolved by the use of the following YAML variables to control whether the included content:

{% highlight yaml %}
---
# project or index page YAML variable section
show_project_posts: true
show_project_series: true
# ...
---
{% endhighlight %}

The second scenario required the use of conditional statements that only attempted to create and populate the required HTML infrastructure when at least ONE relevant post existed.

Also on the topic of visibility, the heading of these list are located above them as &lt;h2&gt; elements, which should be the right level. This, however, means hardwiring the heading into the includes fragment, but I am happy to live with that.

## Conclusion

### Summary to date
At this point we have covered the integration of blog post content into project pages. This is really useful, but there is room for greater improvement. For example, [this](http://stackoverflow.com/questions/22539150/iterate-over-arrays-in-liquid-templates) might prove quite useful later on as getting the index of elements during iteration would be rather handy. In addition, I just realised that the control flow based on the YAML variables should be housed in the layout files. Otherwise, situations may arise where code could be included HTML document but would not be visible, thus silently bloating the page.

<b style="color:red;">Note:</b> 

* Thanks to the [ascii HTML character reference](http://www.ascii.cl/htmlcodes.htm) for valid HTML symbols to include that Jekyll won't process :alien:.
* Incidentally, I constructed multi-line liquid tags to make my complex if statements for loop input validation step readable... good to know :smile:. Somehow, I didn't think that it was possible.

### Future ideas

Some potentially important things to do in future:

* Move finalised CSS from **`project_index_page.html`** to a separate style in the **`_sass/`** folder and included in **`style.scss`**

* Consider an improved implementation within a single panel class &lt;div&gt; with subdivisions for:
    * Series posts (by project)
    * Standalone posts (by project)
    * other related posts (by category and tag) (seems safer than just by tag)

* Collapsable Project index: Shows project titles, but hides description unless highlighted by user
title

* Searchable Project index: basically, apply CSS to non-matching entries to hide them.

<b style="color:red;">Note:</b> At least some of the ideas above probably require the use of unique IDs to make selection work