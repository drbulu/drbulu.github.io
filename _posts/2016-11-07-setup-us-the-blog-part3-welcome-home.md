---
layout: post
title: Setup us the blog 3 - welcome home
series: Setup Us the BLOG!
published: true
categories: [blogging, web design, web development]
tags: [blogging, landing page, home page, web design]
---

Setting up a place from which to welcome visitors... everyone loves a good front porch!

## Intro
Part of my vision for this website was to design a good quality landing page that would be welcoming to site visitors. Said page would be an elegant platform with which to greet incoming visiors and encourage them to explore the different areas of the site. I have made good progress on the site so far, however, I felt that this is such an important component of my website that I prioritised its completion as the next blog development goal to achieve. 

## Strategy

<b style='color:red;'>Perma-note:</b> Ultimately, the landing page (and all primary content) should serve the logos of this site, that is, the core reason why this site exists. This is an important thing to keep in mind, as this understanding will shape all of the content and design decisions of this site.

With this in mind, let's revisit the primary aims of this site:  

* Personal growth: Help me to catalogue my personal growth as a data scientist and enable me to enjoy the journey  
* Career development: Enable potential employers to assess my present skillset within the context of my career development strategy  
* Community support: Provide encouragement to other data enthusiasts or self-driven career explorers looking to systematically grow their skill base in any discipline.  

These aims might seem broad, but the commonality is that this site is aimed at people who might be interested in <b>a)</b> my skills, <b>b)</b> data analysis and data science, and <b>c)</b> people who are interested systematic self-development.

With this in mind, I enbarked upon a search for examples of good landing pages. I had initially thought about adopting a Jekyll landing page theme, but quickly realised that the best way to achieve my goals succinctly was to build a custom page from a minimum number of elements (basically from scratch). This was a feasible task as I have sufficient html/css/js and markdown skill to cobble a site together and to adopt any desire elements that I may desire from existing sites or tutorials. What I needed was a good primer on landing page aesthetics.  

My first stop was a web design blog article on creativebloq.com entitled [10 great landing page designs](http://www.creativebloq.com/web-design/landing-page-design-6133358). This post featured, oddly enough, 12 examples of really good landing pages and provided explanations of why they were effective.   

* My personal favourite of the bunch was the design for the [Monotype](http://www.monotype.com/) landing page. This was a minimal, [focused](http://www.future-perfect.co.uk/grammar-tip/is-it-focussed-or-focused/http://www.future-perfect.co.uk/grammar-tip/is-it-focussed-or-focused/) (mental note) page that kept the welcome simple, yet conveyed the its point with a clever interface. 
* I highlight this next example, [Bear CSS](http://bearcss.com/), because its landing page was a good example of being a clear statement of intent, also referred to as a **"call to action"**. The call to action was a clear, well reinforced, invitation for users to upload HTML content. One can look at a call to action as "Here's why **we** exist and this is what **you** should do next!".
* The last example that I noticed was the [O'Neill](http://us.oneill.com/) apparel website. This landing was one of the examples that featured a project showcase real, which I figure might be a useful idea to implement when I have suitable content to present in that way. THis is one way to bring potentially interesting content out to users, and entice them to dig further.

I also found a couple of links with more information about landing design. The first was an article listing [21 Quick Landing Page Tips](http://unbounce.com/landing-page-articles/landing-page-best-practices/), while the other was a handy [landing page design infographic](https://blog.kissmetrics.com/landing-page-design-infographic/). 

The focus of these pages is generally on how best to market one's product or service, which is conceptually compatible with one of my goals, effective self-marketing. Armed with this strategy, I went onto implementing the new landing page.


## Implementation
1. Move the blog reel from the main page  
The blog posts were initially on the page root (i.e. **drbio.github.io**), which is where the landing page should be located. The way to address this is to move the blog location to **drbio.github.io/blog**.  

	a) As per step 13 in the [jmcglone.com tutorial](http://jmcglone.com/guides/github-pages/), I created a new subdirectory of the main project folder called **```/blog/```** and copied the **```index.html```** homepage file into it. This would safely move the blog content to the new link no issues, and would enable me to implement [pagination](http://jekyllrb.com/docs/pagination/) in the blog for ease of navigation. One ultra long blog page is not conducive to efficient navigation, particularly when not categorised.  
	b) I then went into the **```/_layouts/```** directory and opened the **```default.html```** file.  
	Here I changed the link in the ```<nav>``` HTML element from:  
	
	```
	<a href="{% raw  %}{{ site.baseurl }}{% endraw  %}/">Blog</a>
	```

	to  

	```
	<a href="{% raw  %}{{ site.baseurl }}{% endraw  %}/blog">Blog</a>
	```

	<b>Success!</b> The blog now appears at the desired link address. Now onto the home page

	h/t @[digitaldrummerj.com](http://digitaldrummerj.me/jekyll-show-liquid-in-code-snippet/) for solution to display raw liquid code within code snippets.

2. Now to modify the landing page in order to replace the blog reel content (presently duplicated) into something more suitable:  
  
	a) Set a new Home page link by modifying **```default.html```** as in step **1 b)** above, however, we add this code to the first position in the ```<nav>``` element:  

	```
	<a href="{% raw  %}{{ site.baseurl }}{% endraw  %}/">Home</a>
	```

    This creates a link called "Home" that takes us to the main page at [**drbio.github.io**](https://drbio.github.io) as desired.
    
	b) Next, we modify the original **```index.html```** file in the main directory by first deleting the existing ```<div class="posts">``` HTML element (a ```<div>``` element of the class group "posts") tat contained the loop code used for the blog post formatting. We then replace it with our desired landing page content. In this case, I used the following simple poem as an initial prototype:  

    Continuous learning through data:  

    From data and code...  
    To insightful analysis...  
    To empowering visualisations...  
    To actionable understanding!   

    Explore: Me(/drbio).. My Musings (/blog)... This site (/about)  

This is pretty basic. A simple ```<div class="cta-div">``` with a stack of paragraphs with basic styling. The most advanced operation was adding a ```<style/>``` elenent containing basic [CSS styling](http://www.w3schools.com/css/default.asp) to the centre the text. In retrospect, while I liked the centre placement of the text, it made the text look ragged, detracting from my objectives as stated at the start of this post.
As far as styling is concerned, it is amazing how effective a carefully premedidated poem with simple text highlighting can be.  

I will settle more concretely on a landing page aesethetic and CTA upon more reflection. This, however, is a great start :). I will work more on CSS styling later when I can work out a good, simple theme.
