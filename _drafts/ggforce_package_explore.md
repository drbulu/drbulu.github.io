# ggforce

trying to draw a circle of correlation to visualise PCA output with factoextra. For some reason, correlation circle failed to draw. so found a solution [here](http://stackoverflow.com/a/6863490), which required the installation of the [udunits2](http://stackoverflow.com/a/42387825) dependency.


It turns out that the [annotated circle](http://stackoverflow.com/a/20904977) was the simplest answer, but I stumbled upon [this](http://www.data-imaginist.com/2016/Announcing-ggforce/) blog post and this **ggforce** [vignette](https://cran.r-project.org/web/packages/ggforce/vignettes/Visual_Guide.html), which piqued my interest