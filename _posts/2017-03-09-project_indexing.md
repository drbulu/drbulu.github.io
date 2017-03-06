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

Now that we have the project html layouts sorted, the next challenge is to populate them seamlessly. Seamlessly, being the operative word due to the fact that the degree of content linkage precludes manual linking. Why? As more content is added, updating and relinking content becomes quickly impractical.

The simple answer to that in the Jekyll framework is the [includes](http://jekyllrb.com/docs/includes/) functionality. 

## Includes Project Index

This file is included in the **`project_index_page.html`** layout file within a div element as follows:

{% highlight liquid %}
{% raw %}{% include project_index.html %}{% endraw %}
{% endhighlight %}

The basic logic is:

1. Iterate through all of the pages on the site
2. Select pages that match the following criteria:
* pages with the project layout 
* pages that do not match the project assigned to **`project_index_page.html`**.
3. Extract the page title and URL
4. Include the abstract within the project index entry

## Includes project abstract

In the process outlined in the section [above](#includes-project-index), step 4 proved the most challenging. This is because the inclusion of the abstract file was more complicated than expected.

Inclsion of the project abstract within [project pages]({{ site.baseurl }}{% post_url 2017-03-07-project-mgt-page-layouts %}#project-pages) was a simple matter, as both files are intended to exist in the same subdirectory, hence the simple includes call in the project page layout:

{% highlight liquid %}
{% raw %}{% include abstract.html %}{% endraw %}
{% endhighlight %}

However, when including a file that is not in the same directory or within the **`_includes`** subdirectory it needs to be included with an [includes relative](http://jekyllrb.com/docs/includes/#including-files-relative-to-another-file) Liquid tag. This essentially extracts the file from the chosen path, which is relative to the **`projects/`** directory, which is the parent of the directory where all the abstracts <u>should</u> exist.

{% highlight liquid %}
{% raw %}{% include_relative project_dir/abstract.html %}{% endraw %}
{% endhighlight %}

This was NOT as simple as it first seemed :alien:. However, after some searching I was able to find a useful solution. This essentially involved splitting of each selected project page path in order to obtain the <u>project directory</u> path segment so that it could be captured and prefixed to the **`abstract.html`** path segment. I got my inspiration [here](http://stackoverflow.com/questions/27433649/reuse-file-path-in-jekyll#27434079) and basically cribbed the entire solution, tweaking it to exclude first path element (the project parent dir) from the reconstructed path, using a [minus](https://help.shopify.com/themes/liquid/filters/math-filters#minus) subtraction filter, to properly locate each file. The code section that delivered the completed solution was this: 

{% highlight liquid %}
{% raw %}{% include_relative {{path}}/{{page.abstract}} %}{% endraw %}
{% endhighlight %}

## Styling

Now that the index page was laid out, it was time to add some styling. I fiddled with the styling of [borders](https://www.w3schools.com/cssref/pr_border-top_style.asp) (and [here](https://www.w3schools.com/cssref/pr_border-style.asp)); text [indentation](https://www.w3schools.com/cssref/pr_text_text-indent.asp) and [alignment](https://www.w3schools.com/cssref/css3_pr_text-justify.asp); font [weight](https://www.w3schools.com/cssref/pr_font_weight.asp) and [styling](https://www.w3schools.com/cssref/pr_font_font-style.asp); and CSS [padding](https://www.w3schools.com/CSS/css_padding.asp) and [margin](https://www.w3schools.com/CSS/css_margin.asp).

At the moment, the styles are implemented in **project_overview_page.html** based on html elements created and defined in the **project_index.html** includes fragment. Once I am finished with the styling, I will include the final styling in the main CSS file, as previously done in an [earlier post]({{ site.baseurl }}{% post_url 2016-11-08-setup-us-the-blog-part4-in-series %}).

## Conclusion

This was an important milestone to accomplish, because I now have a mechanism to automatically cataloque, build and showcase all the projects by simply building a project page to summarise its content and supply a brief abstract :smile::smile:.