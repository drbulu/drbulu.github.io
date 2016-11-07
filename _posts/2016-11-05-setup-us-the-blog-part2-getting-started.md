---
layout: post
title: Setup us the blog 2 - getting started
series: getting setup
published: true
categories: [blogging]
tags: [blogging]
---

Setting up my blog before online release.

<!-- Follows the pattern WHAT, WHY HOW -->

## Intro
Now that I had done enough background research to get a feel for what I was in for, I mapped out a basic strategy for how to actually get my site off the ground. Before I got started, I felt that I needed a decent tutorial to work from. I am still quite new to this, yet I also wanted an approach that would be flexible and useful to me. Of the tutorials that I found, the one that best fit what I was looking for was at [digitaldrummerj.me](http://digitaldrummerj.me//blogging-on-github-part-1-Getting-Started/). Now that I had a good starting point, I crafted my strategy.  (Note: familiarity with [Git](https://git-scm.com/) and [Github](https://github.com/) is assumed).

## Strategy
1. Fork and clone a repository for a good template website. This is one that has enough starting features for me to get up and running fast, while being flexible enough for me to build uniquely upon it as my knowledge grows. From what I could see, the [Jekyll Now](http://www.jekyllnow.com/) demo page looked like a really good option. The [about page](http://www.jekyllnow.com/about/) clearly describes the benefits of the approach and it has a nice [repo](https://github.com/barryclark/jekyll-now) (repository). It also helped that my chosen tutorial used this template as its basis.  

2. Build locally before pushing online. I really want to be able to build and preview my website locally on my PC before pushing the content to the web. The reason is simple, I want to have the comfort and flexibility of being able to play around with new content and site features without having an unfinished product exposed to the world. Related to this, I wanted to be able to catch potentially feature-breaking changes before release. To achieve this, I wanted to be able to use version control with Git and Github to maintain live and development versions of this site.

## Implementation
1. Install Jekyll onto my system. I basically followed the tutorial at [part 10](http://digitaldrummerj.me//blogging-on-github-part-10-installing-jekyll-on-linux/) to get setup. He also has setup pages for [Windows](http://digitaldrummerj.me//blogging-on-github-part-9-installing-jekyll-on-windows/) and [Mac (OSx)](http://digitaldrummerj.me//blogging-on-github-part-11-installing-jekyll-osx/) users as well. The official Jekyll docs have a nice [installation](http://jekyllrb.com/docs/installation/) page that steps you through the prerequisite software that you need as well as required versions, which is another handy resource.

2. Forked the Jekyll Now [repo](https://github.com/barryclark/jekyll-now) into my Github account and changed the name to **drbulu.github.io**. At this point, going to [https://drbulu.github.io/](https://drbulu.github.io/) gets you the processed version of the **demo** website. Before this, the link would give an error (404 page not found) as I didn't have a home page before. I had other pages linked to that URL, such as my bio page at [https://drbulu.github.io/drbio](https://drbulu.github.io//drbio), but no actual home page. This, as I recently found out is because all previous pages that I created were project pages, [(see here for the different options)](https://help.github.com/articles/user-organization-and-project-pages/). This is why my old bio page and its repo have to die, despite the fact that the new page will be at the same address. **Importantly**, continuity of my bio page is important to me, as it features on my social networking profiles, and I have personally given it to a number of people... no one likes a dead link... no one!

3. Cloned my version of Jekyll Now that I had forked into my Github account. This process is well described on [Github's help page](https://help.github.com/articles/fork-a-repo/#step-2-create-a-local-clone-of-your-fork), and basicaly creates a subdirectory that contains a local copy of the project files and git version control framework for that particular project. I could have simply downloaded the files and setup the repo manually, however, the benefit of forking and cloning is that it sets you up to be able to [push](https://help.github.com/articles/pushing-to-a-remote/)  content back to Github when you are ready without having to setup a remote repo via **```git config```** yourself... very handy.

4. Started blogging! (locally). Now that I had setup my website and blog infrastructure on my PC, the next thing to do was to generate content and customise the template to create my personal site. You will have noticed that I have done the **digitaldrummerj.me** tutorial a bit back to front, starting with [part 10](http://digitaldrummerj.me//blogging-on-github-part-10-installing-jekyll-on-linux/), followed by [part 2](http://digitaldrummerj.me//blogging-on-github-part-2-your-first-post/). This was done deliberatly according to my strategy above as I am reasonably comfortable with software installation and setup and to satisfy my desire to only push my content when I had a good base prototype.

5. Site customisation:  
	a) Edited the **```_config.yml```** configuration file. Added external personal references to my Github, Linkedin, Twiter etc. I also changed my website description info here. This is pretty cool as the Jekyll Now template automatically generates icons and associated links. I then copied my profile avatar image into the ```/images/``` subdirectory, and cleaned up the folder by removing default images that I didn't need.  
	b) Made initial updates to the [about page](https://drbulu.github.io//about) to make it more personal and to complement my bio page.  

6. Incorporate my [bio page].(https://drbulu.github.io//drbio).  
This step, for those following the digitaldrummerj.me tutorial is described in [part 4](http://digitaldrummerj.me//blogging-on-github-part-4-creating-additional-pages/), which covers how to create and configure additional web pages that are **_not_** blog posts. I also learned from messing with the about page.  
I obtained the latest version of my bio page from my old project page repo, renamed it ```drbio.md```, and put it into a newly created subdirectory (```/drbio/```). I am sure that I could have put it in the main repository parent directoy, but I liked the approach taken by the rsms.me website. When I compared the website to the [source code](https://github.com/rsms/rsms.github.com) on Github during my research, I noticed that many of the pages and sub pages were nested in subfolders.  
I found this useful from a content organisation point of view because I could group subpages in subfolders, so the content management semantics make sense to the file structure (files are roughly where one expects them to be). Obviously, one doesn't want to drill down too many levels deep as 1) it gets confusing and 2) file systems (e.g. Windows) will throw fits if the resultant file path is too long and, say, refuse to copy offending files. This would potentially make it a hassle to copy and manage project files. One can keep things sane by using the ```permalink``` flag in top "front matter" section of the [page layout](http://digitaldrummerj.me//blogging-on-github-part-4-creating-additional-pages/#section-2-choosing-a-layout). This would probably allow one to have a "main" page and a group of subpages (pages that are linked/referenced by the main page as supporting content) in the same directory, with permalinks in each subpage of the format ```main_page_name/subpage_name```. I figure this out later.  
I also needed to add the biopage to the main site menu so that it could be linked to, as [described here](http://digitaldrummerj.me//blogging-on-github-part-4-creating-additional-pages/#section-5-adding-page-to-menu), this is important as the page will be published, but not easily discoverable otherwise.

7. Prepared for "web launch" (sic): Commit all changes. A fairly large commit, but a complete one. Testing whether the biopage link will break, then I will remove the old repo. Checked that the .gitignore file was in order by conferring with the [Jekyll project structure](https://jekyllrb.com/docs/structure/) site. Added the ```.Rhistory``` as I often use RStudio for markdown file editing.  
Note: as I suspected, things didn't quite work. I had to unpublish my old bio page first, since the old bio page is linked to Github pages. Solution: [unpublish the drbio project page](https://help.github.com/articles/unpublishing-a-project-pages-site/) first, then [delete the deprecated drbio repo](https://help.github.com/articles/deleting-a-repository/), to avoid any nasty "repocussions" (sic) that might arise from simply deleting the old repo. Interestingly, once the old repo was deleted, Github pages automatically updated with the new content :).  

## Things to followup later
1. Grouping related posts into an article series: [digitaldrummerj.me tutorial, part 13.](http://digitaldrummerj.me//blogging-on-github-part-13-creating-an-article-series/)  

2. Site search: (Working out how I want to do this):   
* [digitaldrummerj.me tutorial, part 7.] http://digitaldrummerj.me//blogging-on-github-part-7-adding-a-custom-google-search/  
* https://developmentseed.org/blog/2011/09/09/jekyll-github-pages/  
* http://stackoverflow.com/questions/10131541/how-can-i-add-a-site-search-feature-to-a-jekyll-blog  
* https://github.com/christian-fei/Simple-Jekyll-Search  

