---
layout: post
---
## Helpful backgorund



https://help.shopify.com/themes/liquid/tags/control-flow-tags#multiple-conditions-and-or

https://help.shopify.com/themes/liquid/tags/variable-tags#capture

used jekyll docs a little

cribbed series.html code before realising that it was wrong for the task at hand

### Layout

1. Project Overview Page

The layout of the main project page: projects is
_layouts/project_overview_page.html

This is the overall structure of the main project page.

All of the necessary customisation elements will be included here for

* project glossary --> as includes

* related posts - which should be generalisable to all projects

2. Project Page

Wanted to feature the project description in both the project page and in the 

project_page.html

has an includes_relative file in order to include a description.html file that is located in the **same** dir as the index.html of the projects directory :smile:




### Included items

* Project glossary/index

some inspiration from [here](http://stackoverflow.com/questions/25506491/jekyll-loop-pages-by-parent-directory) and [here](http://stackoverflow.com/questions/9110803/make-custom-page-based-loop-in-jekyll#16057087). Simpler logic than series.html, and more what I am looking for.

_includes/project_index.html

* Related posts

same strategy as project glossary

_includes/related_posts.html

* Project descriptions/abstracts

https://jekyllrb.com/docs/includes/#including-files-relative-to-another-file

https://jekyllrb.com/docs/includes/#using-variables-names-for-the-include-file


### Include relative

This was initially because I couldn't get Liquid capture tags (or any other idea) to do this for me.

The following snippet should hopefully allow a project page's description to 

Note: changed the YAML variable from description to abstract to better communicate the kind of text that it should contain

{% raw %}{% include_relative {{ page.abstract }} %}{% endraw %}

so far, only working for the project page.

* for project page:
    * have abstract.html in same folder as specific project's index.html (i.e. in the project folder)
    * set the includes relative liquid tag in project_page.html
    * defined the description variable in each project's index.md YAML. 
        * else Jekyll build error
        * it is possible to have defaults in [config.yaml](http://jekyllrb.com/docs/configuration/#front-matter-defaults) worth considering in case a global change is made to the naming of description.html (which has a long name) ... now changed to abstract.html.
* for project overview page.
    * need to modify the project_glossary 
        * enable splitting of page path so that the project directory path segment can be captured and merged with the description.html prefix.
        * got some inspiration [here](http://stackoverflow.com/questions/27433649/reuse-file-path-in-jekyll). Basically cribbed the entire solution, but tweaked it so that the first path element was excluded from the reconstructed path. Couldn't find inspiration in Jekyll docs
        * then needed to concat strings
        
        {% raw %}{% include_relative {{path}}/{{page.abstract}} %}{% endraw %}

https://help.shopify.com/themes/liquid/filters/math-filters#minus


Note: trying to add html comments to _includes files i.e. liquid template files seemed to kill proper file processing... interestiong. As I kept finding when trying to put comments in **project_glossary.html**. [This](http://stackoverflow.com/questions/27007323/how-do-you-comment-out-in-liquid) is how comments should be done


## Now for styling

puttng a nice line ... above

https://www.w3schools.com/cssref/pr_border-top_style.asp
https://www.w3schools.com/cssref/pr_border-style.asp
https://www.w3schools.com/cssref/pr_text_text-indent.asp 
https://www.w3schools.com/cssref/css3_pr_text-justify.asp
https://www.w3schools.com/cssref/pr_font_weight.asp
https://www.w3schools.com/cssref/pr_font_font-style.asp

implementing styling in **project_overview_page.html** based on html elements created and defined in the **project_glossary.html** includes fragment.

Once finished with the styling, will include in main CSS as previously done in an earlier post

## Related content

possibly also extend this to building a subpage nav if need be? For each project, the main page already has a specialised navbar in the Index

### posts

in _includes

project_related_posts.html

tested using the latest project post: added "project: overview" to YAML

### post series

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



## Proposed project defaults

add to config.yaml?
pages with **project_page.html** layout

show_project_posts: true
show_project_series: true

in order to allow this, needed to only execute if one or more entries were.
Otherwise 

## Proposed workflow ... evaluation


## Future ideas

Outline some of the design decisions behind my project content infrastructure so that I can confirm its utility as I go.

Collapsable Project index: Shows project titles, but hides description unless highlighted by user
title

Searchable Project index: basically, apply CSS to non-matching entries to hide them.

Reimagined related posts:
A single tab:
* 2 main sections: series, standalone
* series is collapsable and looks like the current series_includes file
* has a linked div with the individual series entries listed in as in **series.html**

The ideas above probably require the use of unique IDs to make selection work