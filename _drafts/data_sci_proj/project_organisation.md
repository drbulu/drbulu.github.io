---
layout: post
---
## Helpful backgorund


## Now for styling ... will leave till last

puttng a nice line ... above

https://www.w3schools.com/cssref/pr_border-top_style.asp
https://www.w3schools.com/cssref/pr_border-style.asp
https://www.w3schools.com/cssref/pr_text_text-indent.asp 
https://www.w3schools.com/cssref/css3_pr_text-justify.asp
https://www.w3schools.com/cssref/pr_font_weight.asp
https://www.w3schools.com/cssref/pr_font_font-style.asp
https://www.w3schools.com/CSS/css_padding.asp
https://www.w3schools.com/CSS/css_margin.asp

implementing styling in **project_overview_page.html** based on html elements created and defined in the **project_glossary.html** includes fragment.

Once finished with the styling, will include in main CSS as previously done in an earlier post

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