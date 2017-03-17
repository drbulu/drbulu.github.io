---
layout: post
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



### Knitr-jekyll

was also primary contributor to Blogdown's predecessor [knitr-jekyll](https://github.com/yihui/knitr-jekyll/graphs/contributors).
Notabily, [knitr](https://github.com/yihui/knitr)

[tutorial](https://jekyll.yihui.name/2014/09/jekyll-with-knitr.html) here

Brendan Rocks has an [interesting solution](https://brendanrocks.com/blogging-with-rmarkdown-knitr-jekyll/) based on [knitr-jekyll](https://github.com/yihui/knitr-jekyll/graphs/contributors).

### Blogdown

[Blogdown](https://github.com/rstudio/blogdown) is build upon the [Hugo](https://gohugo.io/) platform, which itself is built (coded) in [Go](https://golang.org/).

Based on the Github [contributor analysis](https://github.com/rstudio/blogdown/graphs/contributors) of this project, [yihui](https://github.com/yihui) is the primary contributor to Blogdown (as at Feb 2017) 

blog post [here](http://kevinfw.com/post/blogging-with-r-markdown/) in Dec 2016 indicated that blogdown is still in dev. Which makes sense given that Blogdown is not yet featured at RStudio. pretty detailed and nicely laid out post [here](https://proquestionasker.github.io/blog/Making_Site/) about how to set things up. Looks achievable, but seems reasonably involved. And there is more information [here](http://applyr.blogspot.com.au/2017/01/blogging-about-r-from-r-studio.html) on how to setup blogdown.


As it typical, Hugo has a [quickstart](http://gohugo.io/overview/quickstart) as well as a Hugo has a section oMigrating from [Jekyll](https://gohugo.io/tutorials/migrate-from-jekyll/)

While it would be nice to move, one complication is the high degree of cross linking between the various posts that I have written. Presumably, since Hugo doesn't feature Liquid tags, this will be a painful process of transition. It is nice that the templating can be switched across, however, this will likely come with more complication than I am prepared for, at the moment. Basically, I feel that a transition would have to be a condidered process, with a substatial time dedication and significant, purppseful motivation.

## Proposed solution:


Knitr-Jekyll is probably the winner here...

What's my solution then?

