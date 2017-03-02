

Options

## Assistant Script

However, a simpler path was posted by [Adam Duncan](https://www.r-bloggers.com/creating-jekyll-blog-posts-from-r/) to R-bloggers (originally [here](gtog.github.io/workflow/2013/06/12/rmarkdown-to-rbloggers/)).


Andy South has an interesting [blog setup](http://andysouth.github.io/blog-setup/) where Rmarkdown files are converted to Jekylly-friendly markdown format using code in the [rmd2md.R](https://github.com/AndySouth/andysouth.github.io/blob/master/rmd2md.r) file.

## Knitr-jekyll

was also primary contributor to Blogdown's predecessor [knitr-jekyll](https://github.com/yihui/knitr-jekyll/graphs/contributors).
Notabily, [knitr](https://github.com/yihui/knitr)

[tutorial](https://jekyll.yihui.name/2014/09/jekyll-with-knitr.html) here

Brendan Rocks has an [interesting solution](https://brendanrocks.com/blogging-with-rmarkdown-knitr-jekyll/) based on [knitr-jekyll](https://github.com/yihui/knitr-jekyll/graphs/contributors).

## Blogdown

[Blogdown](https://github.com/rstudio/blogdown) is build upon the [Hugo](https://gohugo.io/) platform, which itself is built (coded) in [Go](https://golang.org/).

Based on the Github [contributor analysis](https://github.com/rstudio/blogdown/graphs/contributors) of this project, [yihui](https://github.com/yihui) is the primary contributor to Blogdown (as at Feb 2017) 

blog post [here](http://kevinfw.com/post/blogging-with-r-markdown/) in Dec 2016 indicated that blogdown is still in dev. Which makes sense given that Blogdown is not yet featured at RStudio.

As it typical, Hugo has a [quickstart](http://gohugo.io/overview/quickstart) as well as a Hugo has a section oMigrating from [Jekyll](https://gohugo.io/tutorials/migrate-from-jekyll/)

While it would be nice to move, one complication is the high degree of cross linking between the various posts that I have written. Presumably, since Hugo doesn't feature Liquid tags, this will be a painful process of transition. It is nice that the templating can be switched across, however, this will likely come with more complication than I am prepared for, at the moment. Basically, I feel that a transition would have to be a condidered process, with a substatial time dedication and significant, purppseful motivation.

What's my solution then?

