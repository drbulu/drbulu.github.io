---
layout: post
title: "Sqlite"
published: true
series: Installing SQLite
categories: [data management, database]
tags: [SQLite, SQL, MySQL, relational database, rdbms]
---

## Introduction

We covered how to install and start using MySQL in the [MySQL intro]({{ site.baseurl }}{% post_url 2016-12-01-mysql-intro-part1_overview %}) article series. 


selling points [](http://sqlite.org/about.html). The reader can feel free browse to the about pages for more info

In summary, some of the attractive features of the public domain SQLite database engine include:

* full-featured SQL
* lightweight (small foot print)
* file-based (self-contained & serverless)
* easy to use (zero-configuration)

Essentially, one way to look at this is that we have the power of a full RDBMS within the convenience of a file. Needless to say, these features make it quite handy for a number of application settings. 

Happily, the [documentation](http://sqlite.org/docs.html) seems well laid out (always helpful), and there is a handy [syntax guide](http://sqlite.org/lang.html) (and also [here](https://www.tutorialspoint.com/sqlite/sqlite_syntax.htm)) to get quickly up to speed with SQLite's grammar.

## Installing SQLite

### RDBMS

[installation options](http://sqlite.org/download.html) including compilation from source. Tutorialspoint, which I have found to be a useful information source also has an [installation guide](http://www.tutorialspoint.com/sqlite/sqlite_installation.htm) (of sorts) These options are really good to keep in mind. However, as always, we will take the [simple route](https://askubuntu.com/a/340610), which should suffice for the more common pedestrian use case:

This process is made simplified due to SQLite's [zero configuration](http://sqlite.org/zeroconf.html) property.

### Tools

A summary of what comes with the installation for Ubuntu [here](https://packages.ubuntu.com/trusty/sqlite3)

Note sure what tools come with the installation:

I'm sure that there are many, many other [tool options](http://www.sqlite.org/cvstrac/wiki?p=SqliteTools) with which to manage SQLite, but we will stick to a couple of options so that we can fully evaluate them before deciding on something else. I have settled on the following tools as they look to be free, reasonably supported and seem to possess useful features:

* [SQLite browser](http://sqlitebrowser.org/): This application seems reasonably useful and has detailed install instructions: As always, the [Ubuntu installation](http://sqlitebrowser.org/#ubuntu) section is where I am at :cool::
For the ultra lazy, this app can also be installed via the [apps directory](https://apps.ubuntu.com/cat/applications/sqlitebrowser/);

* [SQLite Manager](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/) firefox browser addon. This is a useful, easy to install tool that I have used before. The fact that it runs on the browser is really convenient.

## sqlite tutorials

http://swcarpentry.github.io/sql-novice-survey/

http://www.datacarpentry.org/sql-ecology-lesson/

http://www.datacarpentry.org/R-ecology-lesson/06-r-and-sql.html