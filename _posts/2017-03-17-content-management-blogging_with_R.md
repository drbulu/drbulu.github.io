---
layout: post
title: Content Management - knitr and RMarkdown integration
series: Content Strategy
published: true
math_symbols: false
categories: [blogging, web design, web development]
tags: [web design, content management, resources, reproducible research]
---
## Introduction

Sometime back I covered how to highligh code via [syntax highlighting]({{site.baseurl}}{% post_url 2016-11-25-content-generation-tools-overview-part4-syntax-highlighting %}), which proved quite useful for my first MySQL series. However, I am now at the point where I need to cover topics in R to explore data analysis concepts. The best way to do this is to interactively produce blog posts in R using Knitr and Rmarkdown. This means that I need to work out a way of integrating reproducible research into my blogging framework to me achieve my [reproducible research goals]({{site.baseurl}}{% post_url 2016-11-16-content-management-part2-toolkit1 %}#rmarkdown) for this blog. I did a bit of digging around and found that there are basically two main ways to achieve this aim. The following classification is mine, but it should hopefully make sense:

1. **[Custom scripts](#custom-scripts)**: Custom helper functions to semi-automate the conversion of RMarkdown posts and pages to Markdown or HTML.
2. **[Processing frameworks](#processing-frameworks)**: Organised frameworks that fully automate the processing of RMarkdown files into Markdown or HTML in the same kind of way that Jekyll constructs websites from Markdown and HTML content.

Before I continue, I need to mention that one of the major complications is the proper handling of image content, which need to be linked into the markdown content at the appropriate place using your blog or website's core URL as part of this link. Naturally, attempting to do so is fraught with painful peril. I felt that I needed to specify this to give a context for the considerable energy invested in the various solutions reviewed here.

## Custom Scripts

This section highlights the options that I have encountered, which I have attempted to cover in chronological order to capture any progression of ideas. The first concept I came across was [contributed to R-bloggers](https://www.r-bloggers.com/using-r-markdown-jekyll-github-for-a-website/) in December 2012 by [Jason Bryer](http://jason.bryer.org/posts/2012-12-10/Markdown_Jekyll_R_for_Blogging.html). In his work, Jason provides two basic options to processing Rmd files to produce Jekyll-compatible markdown files. Basically, option 1 uses a Ruby plugin to call **`knitr::knit2html()`** to process RMarkdown content. However, option 2 goes around the Github pages plugin restrictions using a combination of a custom R function and a bash script to pre-process the content to markdown files. This converted markdown content is then handled by Jekyll automatically when pushed to Github.

Later, in June 2013 [Adam Duncan](http://gtog.github.io/workflow/2013/06/12/rmarkdown-to-rbloggers/) proposed a fairly simple option to [R-bloggers](https://www.r-bloggers.com/creating-jekyll-blog-posts-from-r/) that consisted of a simple function **`KnitPost()`**. This is a bit more "manual" than the previous solution but still constitutes an elegant solution that one can expand upon and more automated using approaches like those in the previous paragraph.

The last approach that I covered in my investigation of custom script options was published in December 2014 by [Andy South](http://andysouth.github.io/blog-setup/), who also covered this subject [at R-bloggers](https://www.r-bloggers.com/blog-with-rstudio-r-rmarkdown-jekyll-and-github/). His ideas are built upon previous work by others (including Jason Bryer) as part of the inspiration for his approach, which was implemented as the [**rmd2md()**](https://github.com/AndySouth/andysouth.github.io/blob/master/rmd2md.r) function.

## Processing frameworks

The [frameworks](https://en.wikipedia.org/wiki/Software_framework) described in this section represent systematic approaches to tackling our problem. The **knitr-jekyll** and **Blogdown** packages are the only systematic integrations of RMarkdown content into blogging that I could find and, interestingly, are linked by a common author.

### Knitr-jekyll

The Github user [Yihui](https://github.com/yihui/), who is notable for a number of R packages including [knitr](https://github.com/yihui/knitr), was also primary contributor to the [knitr-jekyll](https://github.com/yihui/knitr-jekyll/graphs/contributors) project. From initial inspection, this framework builds upon one of default Jekyll layouts and uses the [servr](https://cran.r-project.org/web/packages/servr/README.html) package (which yihui also helped to author) and a build script to process RMarkdown (&#42;.Rmd) files to markdown (&#42;.md). This process in described in further detail in this [tutorial](https://jekyll.yihui.name/2014/09/jekyll-with-knitr.html) and in [this post](https://github.com/yihui/knitr-jekyll/blob/gh-pages/_source/2014-09-28-jekyll-with-knitr.Rmd) (covers the use of the **`_sources`** subdirectory). Incidentally, this work seems to have started in about September 2014 (more or less).

Almost a year later, in October 2015, [Brendan Rocks](https://brendanrocks.com/blogging-with-rmarkdown-knitr-jekyll/) (apparently his [real name](https://brendanrocks.com/about/)) has an [interesting solution](https://www.r-bloggers.com/blogging-with-rmarkdown-knitr-and-jekyll/)
based on knitr-jekyll. Brendan's commentary is an interesting look into one of the ways to personalise the power of knitr-jekyll for one's own purposes.

### Blogdown

[Blogdown](https://github.com/rstudio/blogdown) is build upon the [Hugo](https://gohugo.io/) platform, which itself is built (coded) in [Go](https://golang.org/). Based on the Github [contributor analysis](https://github.com/rstudio/blogdown/graphs/contributors) of this project, [Yihui](https://github.com/yihui) is the primary contributor to Blogdown (as at Feb 2017). 

This year (Feb 2017), Yihui updated the knitr-jekyll [readme](https://github.com/yihui/knitr-jekyll), recommending the [Blogdown project](https://github.com/rstudio/blogdown/blob/master/README.md), as superior to knitr-jekyll (which still works). Interestingly, Blogdown is an RStudio repo, but is not yet locatable on their webpage (as at 17 March 2017). This, in addition to the note in the Blogdown repo readme, indicates that this package may still be in development. In apparent agreement with this sentiment, there was a blog post [here](http://kevinfw.com/post/blogging-with-r-markdown/) in Dec 2016 indicated that blogdown is still in development. There are other bloggers who have delved into Blogdown, which seems to be reasonably solid at this point. Among other blogs that I could find is a pretty detailed and nicely laid out post [here](https://proquestionasker.github.io/blog/Making_Site/) about how to set things up. Overall, it looks achievable but reasonably involved. There is more information [here](http://applyr.blogspot.com.au/2017/01/blogging-about-r-from-r-studio.html) about how to setup blogdown.

## Proposed solution

### Overview

In the previous sections, I have given a reasonably comprehensive (though possibly incomplete) round up of common solutions to the subject of this post. The question for me now is simple, "which path will I chose"? This will largely be dependent on factors such as:

1. How easy is it to incorporate into my current workflow?
2. If not, what is the migration cost of adopting such a proposed solution?

In order to judiciously appropriate a workable solution I first need to get a handle on my workflow. How else can I figure out what I should adopt if I don't know what my process is? Well, my strategy is simple:

1. Draft posts locally in the `_drafts` folder.
2. Preview the Jekyll website with drafts locally.
3. Move completed drafts into the `_posts` folder, 
    * renaming the file with an appropriate date stamp prefix.
    * deleting the associated draft file
4. Let Jekyll handle processing of the completed post.

The challenging thing is that I haven't worked much with images, and I'm still trying to figure out where to put them. I am not completely convinced that the `images` folder is the place to put it, neither am I fully sold on using the `_posts` folder either. This has ramifications on Rmd file processing, as mentioned above, which is important to keep in mind but not a great issue.

Now that we have an idea of our process, let's evaluate our possible solutions :smile:.

### Blogdown solution

Let's first have a look at [Blogdown](#blogdown), which seems to be the most modern, comprehensive and powerful option. This is something to consider from a longterm perspective, particularly when this package completely matures, as is the base for the related [Bookdown](https://github.com/rstudio/bookdown). The obvious catch here is the migration cost. As it typical, Hugo has a [quickstart](http://gohugo.io/overview/quickstart) as well as a Hugo has a section on migrating from [Jekyll](https://gohugo.io/tutorials/migrate-from-jekyll/). However, some of the posts reviewed above indicate that publishing Hugo-powered websites to Github pages is not quite as straightforward as is the case of Jekyll. There are solutions, obviously, but this is an important consideration.

In addition, while it would be nice to move, one complication is the high degree of cross linking between the various posts that I have written. Presumably, since Hugo doesn't feature or support Liquid tags, this will be a painful process of transition. It is also nice that the templating can be switched across, however, this will likely come with more complication, and time investment, than I am prepared for at the moment. Basically, I feel that a transition would have to be a condidered process, with a substatial time dedication and significant, purppseful motivation. 

As a result, blogdown is a good potential option for the future, but not what I am lookng at now.

### Custom script solution

This general approach brings with it a great degree of freedom, but also requires the largest amount of premeditation and maintenance effort. This is natural, given that we would be building a system from scratch. There are a number of options to [learn from](#custom-scripts), however, I would want to figure a lot of this out myself. Typically, one feels more responsible for one's own code, which is more understandable and amenable to one's requirements. 

All of the options that I have seen so far rely on the [knitr](https://cran.r-project.org/web/packages/knitr/index.html) package, however, the [RMarkdown](https://cran.r-project.org/web/packages/rmarkdown/index.html) package uses knitr to process markdown files. Another interesting note is that while the custom solutions described earlier parse the entire file and manually process the YAML front matter, RMarkdown seems to rely on the [yaml](https://cran.r-project.org/web/packages/yaml/index.html) package for this purpose.

Essentially, I could use additional tools to help me to create good custom scripts for RMarkdown file processing. I have a keen interest in RMarkdown conversion as I see the value in advancing my understanding of R document knitting and the programmatic production of customisable reports based on parameterisable input. I started thinking about this when looking for a neat solution to create question and answer files from the same Rmd source when creating [BURGr nibblR](https://github.com/AU-BURGr/data_exercises/blob/master/README.md#burgr_nibblrs) excercises. Question files have exactly the same content as the Answers, except that the solution code is hidden by an `echo = FALSE` flag. My idea, which is still a work in progress, is to have a single file whose solution code chunks are set by a variable linked to the YAML front matter that is set during the RMarkdown conversion of the source file into appropriately named markdown file outputs. I am also thinking about semi-automating the production of the outputs of my [exploratory analyses](https://github.com/drbulu/healthyAir_DSc_proj#2-exploratory-data-analysis) (and potentially other sections) of my **healthyAir** project. This would also prove useful towards the exploration of any large datasets that I would need to understand, particularly those with many large groups.

This potential path also has long term merit due to what I can learn during the development process, but it might be tricky to get off the ground.

### knitr-jekyll solution

The [knitr-jekyll](#knitr-jekyll) option seems reasonably appealing upon reflection. For some reason I previously thought that I would have to port my blog to knitr-jekyll in order to take advantage of its features. The simple truth is that knitr-jekyll is built on a pretty standard Jekyll framework with all of the standard components. This framework is also exceedingly simple to understand, given how long I have now been working with Jekyll. Basically, I can instead import the Rmd processing code, that is specific to knitr-jekyll, into my existing Jekyll setup.

The main things to do would be to:

1: Install the **[servr](https://cran.r-project.org/web/packages/servr/index.html)** package. Which is simple in the R console via:

{% highlight r %}
install.packages('servr')
{% endhighlight %}

2: Create the `_source` directory

3: Import the [build.R](https://github.com/yihui/knitr-jekyll/blob/gh-pages/build.R) file and make any modifications as necessary.

4: Possibly import the [makefile](https://github.com/yihui/knitr-jekyll/blob/gh-pages/_source/Makefile)? I will see how this fits into my workflow.

From what I can see... this is what I would need to do to get started :smile:

Note: There is an interesting discussion [here](https://brendanrocks.com/htmlwidgets-knitr-jekyll/) about the integration of html widgets. This will come in handy later, no doubt.

## Summary

Essentially, I have canvased some of the options that are available to facilitate the conversion of RMarkdown files to Markdown content. At this stage, knitr-jekyll is probably the winner here based on my web authoring requirements, with the creation of suitable custom scripts a close second. Blogdown seems to be one of the big bids for the future, and the processing of RMarkdown looks to be well integrated. This means that I can afford to wait for the full release of Blogdown, using the time to get going with R-based blogging. I can also get to grips with the Hugo framework in order to work out how I can make the transition in future if required.

This was an enlightening and enjoyable exercise, and one that has taught me a lot... now to get going with a solution :smile:!

What's my solution then?

