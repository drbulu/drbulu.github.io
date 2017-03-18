# simple helper script to help processing of Rmd files using knitr-jekyll
process_rmd_posts = function(build_option = "none"){
    library(servr)
    build_option = match.arg(build_option, choices = c("none", "drafts", "future"))
    jekyll_cmd = "bundle exec jekyll build"
    if (build_option != "none") jekyll_cmd = paste0(jekyll_cmd, " --", build_option)
    servr::jekyll(serve=F, command = jekyll_cmd)
}
