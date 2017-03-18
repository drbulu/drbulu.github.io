# https://github.com/yihui/knitr-jekyll/blob/gh-pages/build.R

local({
    # BM 2017-03-17 Note: ................................
    # Introduced flexibility for parent directory of the 
    # figure path that is later given to fig.path. 
    # ...................................................
    fig_parent_dir = "images/fig"
    
    # fall back on '/' if baseurl is not specified
    baseurl = servr:::jekyll_config('.', 'baseurl', '/')
    # BM 2017-03-17 Note: ...............................
    # fixed the issue caused by the Jekyll Now template
    # that I have adopted. Basically, the figure paths
    # are poorly constructed even though figure content 
    # is properly generated in the right source folder.
    # The cause: baseurl = "". Fix: change to "/" 
    # ...................................................
    baseurl = ifelse(!nchar(""), "/", baseurl)
    knitr::opts_knit$set(base.url = baseurl)
    # fall back on 'kramdown' if markdown engine is not specified
    markdown = servr:::jekyll_config('.', 'markdown', 'kramdown')
    # see if we need to use the Jekyll render in knitr
    if (markdown == 'kramdown') {
        knitr::render_jekyll()
    } else knitr::render_markdown()
    
    # input/output filenames are passed as two additional arguments to Rscript
    a = commandArgs(TRUE)
    
    # BM 2017-03-17 Note: ................................
    # Modify figure output dir so that if the directory is 
    # "_source", it is changed to "_posts" for processing
    # ...................................................
    figPathFrag = gsub("_source", "_posts", a[1], fixed = T)
    # using the modified fig path
    d = gsub('^_|[.][a-zA-Z]+$', '', figPathFrag)
    knitr::opts_chunk$set(
        fig.path   = sprintf(paste0(fig_parent_dir, '/%s/'), d),
        cache.path = sprintf('cache/%s/', d)
    )
    # set where you want to host the figures (I store them in my Dropbox Public
    # folder, and you might prefer putting them in GIT)
    if (Sys.getenv('USER') == 'yihui') {
        # these settings are only for myself, and they will not apply to you, but
        # you may want to adapt them to your own website
        knitr::opts_chunk$set(fig.path = sprintf('%s/', gsub('^.+/', '', d)))
        knitr::opts_knit$set(
            base.dir = '~/Dropbox/Public/jekyll/',
            base.url = 'http://db.yihui.name/jekyll/'
        )
    }
    knitr::opts_knit$set(width = 70)
    knitr::knit(a[1], a[2], quiet = TRUE, encoding = 'UTF-8', envir = .GlobalEnv)
})