---
layout: post
title: Math Integration
series: Content Strategy
published: true
math_symbols: true
categories: [blogging, web design, web development]
tags: [web design, content management, resources]
---

Math time!

## Intro

[Mathematical notation](https://en.wikipedia.org/wiki/Mathematical_notation) is another tool that I expect to make use of, particularly for my continued study in statistics. I have thought much about how to implement this in my site, and I decided to learn from the [**series panel**]({{ site.baseurl }}{% post_url 2016-11-08-setup-us-the-blog-part4-in-series %}) setup blog post.

##  Implementation

The idea is to use [MathJax](https://www.mathjax.org/) functionality to enable me to easily construct complex mathematical equations. This is a superior approach to using raw HTML [entities](HTML_character_entity_reference) and [symbols](http://www.w3schools.com/html/html_symbols.asp), "which seemeth frighteningly tedious unto me!".

Initially I thought that I needed the following components:

* an **```_includes```** file that embodies the code needed to implement the math functionality.

* modification of the content layout template pages with the appropriate Liquid tag.

* a YAML variable in the front matter to control the activation of the math functionality.

### Includes

Jekyll has an example of what I want to achieve in the [extras page](https://jekyllrb.com/docs/extras/#math-support) of the documentation. Essentially, I am creating a file **```math_symbols.html```** in the **```_includes```** directory that contains an HTML script tag to import MathJax functionality when this fragment file is included. I could have downloaded the MathJax JavaScript file and linked to that, but linking out is good for now, since I don't have to manage version updates.

{% highlight html %}
{% raw %}
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
{% endraw %}
{% endhighlight %}

In order to enable inline MathJax processing, I looked in the docs to setup the [**```MathJax.Hub.Config()```**](http://docs.mathjax.org/en/latest/options/tex2jax.html?highlight=inline) function and added the following JavaScript in a **```<script>```** tag below the previous script.

{% highlight js %}
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [ ['$','$'], ['\\(','\\)'] ],
    balanceBraces: true,
    processEscapes: true
  }
});
{% endhighlight %}

I thought about the best place to embed these scripts and found out about async tags [here](http://stackoverflow.com/questions/436411/where-is-the-best-place-to-put-script-tags-in-html-markup#24070373). I haven't done so, but this will be good to keep in mind should script loading efficiency become a problem.

## YAML
This is the simplest component. In order the activate math functionality, all that will be needed is to add the following line:

{% highlight yml %}
{% raw %}
---
math_symbols: true
---
{% endraw %}
{% endhighlight %}

As a boolean variable, ```false``` will keep the math formatting disabled. I thought of creating an entry in the [default frontmatter](https://jekyllrb.com/docs/configuration/#front-matter-defaults) of ```_config.yml```, but elected to keep it simple as the absence of an entry doesn't seem to mess with Jekyll.

## Layout modification
Both the **```page.html```** and **```posts.html```** layouts inherit (i.e include characteristics from) the **```default.html```** layout. Instead of putting a reference in the page or post layouts, I added the following code in the ```<head>``` tag of **```default.html```**.

{% highlight liquid %}
{% raw %}{% if page.math_symbols %} 
    {% include math_symbols.html %}
{% endif %}{% endraw %}
{% endhighlight %}

This will incorporate math functionality (i.e MathJax) **only** when our custom [YAML](#yaml) variable is set to ```true``` in the page where math symbols are required. The obvious benefit of keeping the [includes](#includes) file separate from the layout is that I can update MathJax config, or even change systems entirely, without having to make further modifications to any of the layout files.

## Conclusion

On that note we are done! The following inline math examples will give you an idea of what the transition looks like. For block format (equation on its own line), simply encase the expression in <span class="tex2jax_ignore">$$</span>.

* from <span class="tex2jax_ignore">$\sum$</span> to $\sum$

* from <span class="tex2jax_ignore">$x_2$</span> to $x_2$

* from <span class="tex2jax_ignore">$x^2$</span> to $x^2$

**Note:** ```processEscapes``` wasn't working for me to get the unprocessed equivalents for the examples above. The solution that I have chosen (for now) was to use span elements of the ["tex2jax_ignore"](http://stackoverflow.com/questions/8773586/mediawiki-mathjax-need-to-use-escape-x) class. The other option would be to modify or remove the first array element of ```inlineMath```.

That said, I'm really happy with how this has turned out, and I now have an efficient and flexible way to include math symbol processing :smile:.
