---
layout: post
---

## Now for styling ... will leave till last


## Proposed project defaults

add to config.yaml?
pages with **project_page.html** layout

show_project_posts: true
show_project_series: true

in order to allow this, needed to only execute if one or more entries were.

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