
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

* Project glossary

some inspiration from [here](http://stackoverflow.com/questions/25506491/jekyll-loop-pages-by-parent-directory) and [here](http://stackoverflow.com/questions/9110803/make-custom-page-based-loop-in-jekyll#16057087). Simpler logic than series.html, and more what I am looking for.

_includes/project_glossary.html

* Related posts

same strategy as project glossary

_includes/related_posts.html

* Project descriptions

https://jekyllrb.com/docs/includes/#including-files-relative-to-another-file

https://jekyllrb.com/docs/includes/#using-variables-names-for-the-include-file


### Include relative

The following snippet should hopefully allow a project page's description to 

{% include_relative {{ page.description }} %}

so far, only working for the project page.

* for project page:
    * have description.html in same folder as specific project's index.html (i.e. in the project folder)
    * set the includes relative liquid tag in project_page.html
    * defined the description variable in each project's index.md YAML. 
        * else Jekyll build error
        * it is possible to have defaults in [config.yaml](http://jekyllrb.com/docs/configuration/#front-matter-defaults) worth considering in case a global change is made to the naming of description.html (which has a long name)
* for project overview page.
    * need to modify the project_glossary 
        * enable splitting of page path so that the project directory path segment can be captured and merged with the description.html prefix.
        * got some inspiration [here](http://stackoverflow.com/questions/27433649/reuse-file-path-in-jekyll). Basically cribbed the entire solution, but tweaked it so that the first path element was excluded from the reconstructed path. Couldn't find inspiration in Jekyll docs
        * then needed to concat strings
        
        {% include_relative {{path}}/{{page.description}} %}

https://help.shopify.com/themes/liquid/filters/math-filters#minus


Note: trying to add html comments to _includes files i.e. liquid template files seemed to kill proper file processing... interestiong. As I kept finding when trying to put comments in **project_glossary.html**


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

## Related posts

## Proposed workflow ... evaluation