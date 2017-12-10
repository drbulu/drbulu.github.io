---
layout: post
title: "Setting up Python for data science"
published: true
series: Python for data science
categories: [data science]
tags: [pyton, pythnon3, setup, SciPy stack, scikit-learn ]
---

### Install scikit-learn and pandas

python version checked out [python2 vs. python3](https://wiki.python.org/moin/Python2orPython3)

according to the [scikit-learn](chttp://scikit-learn.org/stable/install.html) install page, we need to install the NumPy and SciPy depencies with binary [wheels](http://pythonwheels.com/)

So there are instructions [here](https://www.scipy.org/install.html#installing-via-pip) to install the SciPy stack

install [jupyter](https://jupyter.readthedocs.io/en/latest/install.html)

{% highlight bash %}
# upgrade pip
> python -m pip3 install --upgrade pip
# install SciPy stack
> pip3 install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
{% endhighlight %}

seems to install with wheels by default on Ubuntu :smile:

after that, I can now install [scikit-learn](http://scikit-learn.org/stable/install.html). Also used the "user" scheme.

{% highlight bash %}
pip3 install -U --user scikit-learn 
{% endhighlight %}


turns out that pip installed most of the goodies [here](http://stackoverflow.com/questions/35313876/after-installing-with-pip-jupyter-command-not-found#35318514) **`.local/bin/`**, which I simply added to the [path](http://stackoverflow.com/a/38257349) to avoid future drama

Also... avoided [Anaconda](http://scikit-learn.org/stable/install.html#canopy-and-anaconda-for-all-supported-platforms)... too much baggage for now.


