---
layout: post
title: Content Management - Syntax Highlighting
series: Content Strategy
published: true
categories: [blogging, web design, web development]
tags: [web design, content management, resources, syntax highlighting, jekyll]
---

Pretty code for all!

## Intro
How can there be data science without code? Given this truth, I will want to feature code in a number of programing languages for various reasons e.g.: to understand code or concepts that I learn from someone else, or to detail implementation of algorithms or project code. Therefore, this post is to familiarise myself with 

## Rouge higlighting

### Overview

[Roxanne!](https://en.wikipedia.org/wiki/Roxanne_(song)) No? Anyway... Jekyll (version 3) uses [Rouge](http://rouge.jneen.net/) as its default code syntax highlighting engine. Alternatively, one could use [Pygments](http://pygments.org/) instead, and the selection can be made in ```_config.yml```. One can also add line numbers and modify the CSS styling that is applied to code snippets. There is more information in the Jekyll docs [here](https://jekyllrb.com/docs/templates/#code-snippet-highlighting) and [here](https://jekyllrb.com/docs/posts/#highlighting-code-snippets). 

Basically, anything between the syntax highlighting start ({% raw %}{% highlight %}{% endraw %}) and end ({% raw %}{% endhighlight %}{% endraw %}) liquid tags will have syntax highlighting applied to it according to the available CSS configuration. Apparently, Rouge is compatible with CSS stylesheets for Pygments.

### Formatting guide
To use language-specific syntax highlighting, the start tag should have the format: 

* format according to the **languageID** language: {% raw %}{% highlight languageID %}{% endraw %}.

* format to **languageID** syntax with line numbers: {% raw %}{% highlight languageID linenos %}{% endraw %}.

Documentation is available for the languageID codes (short names) supported by [Rouge](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers) and [Pygments](http://pygments.org/docs/lexers/). Given that I will use Rouge (the default), I selected a few of the languages that I might use and summarised them here for quick reference (Rouge codes and aliases in brackets). I have listed them according to how I might use them. Admittedly the categories are arbitrary, but still useful:

* **Jekyll blog**: Markdown (markdown), Ruby (ruby), Liquid (liquid), YAML (yaml, yml), HTML (html), CSS (css).

* **Data Science**: R (r, R,s,S), Python (python, py), SQL languages (sql).

* **Web**: JavaScript (javascript, js), JSON (json, json-doc), HTTP requests (http).

* **App dev**: Java (java), C++ (cpp)

* **Unix**: Unix shell script (shell), Unix shell console (shell_session).

### Rouge Example
Below is a basic example of code written in the R lanaguage. This is a simple function in R to display (print) the phrase "hello console" onto the console repeatedly depending on the numerical value of the repeatCount variable. The code is nonsense but valid, but I wanted something more substantial than "hello world".

The Liquid-formatted code supplied to Jekyll, highlighted using the {% raw %}{% highlight liquid %}{% endraw %} start tag for syntax highlighting. However, inside this tag, we have a {% raw %}{% raw %}{% endraw %} tag that surrounds the R code highlighing block as {% raw %}{% raw %}**{% highlight r %}**{% endraw %}:

{% highlight liquid %}
    {% raw %}
{% highlight r %}
greetConsole <- function(repeatCount){
    for (i in 1:as.integer(repeatCount)){
        print(paste("hello", "console", i))
    }
    return(repeatCount)
}
{% endhighlight %}
    {% endraw %}
{% endhighlight %}

is evaluated to:

{% highlight r %}
greetConsole <- function(repeatCount){
    for (i in 1:as.integer(repeatCount)){
        print(paste("hello", "console", i))
    }
    return(repeatCount)
}
{% endhighlight %}

and looks like this with line numbers:

{% highlight r linenos %}
greetConsole <- function(repeatCount){
    for (i in 1:as.integer(repeatCount)){
        print(paste("hello", "console", i))
    }
    return(repeatCount)
}
{% endhighlight %}

**Note**: 

* I have left the line numbering CSS to the default, but this can be changed with CSS targeting the **`.lineno`** CSS class definition.

* Interestingly, this doesn't do [inline](https://github.com/jekyll/jekyll/issues/3195) syntax highlighting, which is a great segway to the next section.

## Github flavoured markdown (GFM)
Somehow this escaped my notice in the second post of this series on [**Markdown**]({{ site.baseurl }}{% post_url 2016-11-16-content-management-part2-toolkit1 %}). Basically, Github seems to have their own [spin](https://help.github.com/articles/basic-writing-and-formatting-syntax/) on Markdown. GFM has similar [syntax highlighting](https://help.github.com/articles/creating-and-highlighting-code-blocks/) formatting to RMarkdown, and there is a list of GFM [language code abbreviations](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml). Interestingly, I'm not sure how to specify line numbers.

This is the same code example used previously in this post with GFM-formatted syntax highlighting. Note, I had to encase the code in a [<pre>](http://www.w3schools.com/tags/tag_pre.asp) (preformatted text) tag, to get the right formatting. Alternatively I could have used the [html symbol (&#96&#59;)](https://en.wikipedia.org/wiki/Grave_accent) for the backtick.

<pre>
``` r
greetConsole <- function(repeatCount){  
    for (i in 1:as.integer(repeatCount)){  
        print(paste("hello", "console", i))  
    }  
    return(repeatCount)  
}  
```
</pre>

The code above is rendered as follows:

``` r
greetConsole <- function(repeatCount){  
    for (i in 1:as.integer(repeatCount)){  
        print(paste("hello", "console", i))  
    }  
    return(repeatCount)  
} 
```

## More notes

GFM doesn't seem to have [inline](http://stackoverflow.com/questions/23226224/inline-code-syntax-highlighting-in-github-markdown#25058886) syntax highlighting as well, but since Pandoc does, any syntax highlighting in RMarkdown will be processed before Jekyll gets a hold of it. That said, GFM seems to have basic inline code highlighting as long as no language is specified e.g. &#96;&#96;&#96; hello&#96;&#96;&#96; evaluates to ``` hello```.

Incidentally GFM has [emoji](https://help.github.com/articles/basic-writing-and-formatting-syntax/#using-emoji) integration in the format :EMOJICODE:, and here are ["all the emojis"](http://www.webpagefx.com/tools/emoji-cheat-sheet/) :grinning:. They don't render locally, but are still good to have :smile:.

## Conclusion
Syntax highlighting is something that I will be using often to showcase code, so it was good to get a feel for my options. Rouge looks like the system that I will be using, with GFM as a backup option.