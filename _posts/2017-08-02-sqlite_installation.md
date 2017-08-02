---
layout: post
title: "SQLite Installation"
published: true
series: SQLite Intro
categories: [data management, database]
tags: [SQLite, SQL, MySQL, relational database, rdbms]
---

## Introduction

We covered how to install and start using MySQL in the [MySQL intro]({{ site.baseurl }}{% post_url 2016-12-01-mysql-intro-part1_overview %}) article series. This series takes a look at the SQLite RDBMS, which has a number of [selling points](http://sqlite.org/about.html) with which the reader can freely aquaint themselves. In summary, some of the attractive features of the public domain SQLite database engine include:

* full-featured SQL
* lightweight (small foot print)
* file-based (self-contained & serverless)
* easy to use (zero-configuration)

Essentially, one way to look at this is that we have the power of a full RDBMS within the convenience of a file. Needless to say, these features make it quite handy for a number of application settings. 

Happily, the [documentation](http://sqlite.org/docs.html) seems well laid out (always helpful), and there is a handy [syntax guide](http://sqlite.org/lang.html) (and also [here](https://www.tutorialspoint.com/sqlite/sqlite_syntax.htm)) to get quickly up to speed with SQLite's grammar.

## Installing SQLite

### RDBMS

[installation options](http://sqlite.org/download.html) including compilation from source. Tutorialspoint, which I have found to be a useful information source also has an [installation guide](http://www.tutorialspoint.com/sqlite/sqlite_installation.htm) (of sorts) These options are really good to keep in mind. However, as always, we will take the [simple route](https://askubuntu.com/a/340610), which should suffice for the more common pedestrian use case:

{% highlight bash %}
# Step 1: Update System
shell> sudo apt-get update
shell> sudo apt-get upgrade
# Step 2: Install SQLite
shell> sudo apt-get install sqlite3 libsqlite3-dev
{% endhighlight %}

This process is made simplified due to SQLite's [zero configuration](http://sqlite.org/zeroconf.html) property, compared to [MySQL installation](https://drbulu.github.io/blog/mysql-intro-part2-setup/#setup-guide) for example.

### Tools

Now that we have sorted out installing SQLite there is the question of accessing and interacting with SQLite databases. Inspection of the summary of what comes with the installation for Ubuntu [here](https://packages.ubuntu.com/trusty/sqlite3) indicates that installation consists of a set of libraries. There is always the trusty [command line interface](https://sqlite.org/cli.html) with which to use SQLite. However, there doesn't seem to be some default or <i>de facto</i> GUI-friendly utility that also incorporates features such as database design in the way that MySQL has its [workbench](https://www.mysql.com/products/workbench/) and Oracle has its [developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html).

A brief look indicates that there are many, many third party [tool options](http://www.sqlite.org/cvstrac/wiki?p=SqliteTools) with which to manage SQLite, but we will stick to a couple of options so that we can fully evaluate them before deciding on something else. To this end, I have settled on the following tools as they look to be free, reasonably supported and seem to possess useful features:

* [SQLite browser](http://sqlitebrowser.org/): This application seems reasonably useful and has detailed install instructions: As always, the [Ubuntu installation](http://sqlitebrowser.org/#ubuntu) section is where I am at. For the ultra lazy, this app can also be installed via the [apps directory](https://apps.ubuntu.com/cat/applications/sqlitebrowser/);

{% highlight bash %}
# Step 1: Add SQLite browser ppa (stable release)
shell> sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
# Step 2: Update apt-get package cache:
shell> sudo apt-get update
# Step 3: Install SQLite browser package:
shell> sudo apt-get install sqlitebrowser
{% endhighlight %}

* [SQLite Manager](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/) firefox browser addon... For the even lazier! :wink:. This is a useful, easy to install tool that I have used before. The fact that it runs on the browser is really convenient.

## Conclusion

SQLite is a compact, highly useful and relatively simple to install RDBMS. In future posts we will explore the functionality of this system through a number of tutorials that may or may not include the following set of tutorials below:

* [Command line interface](https://sqlite.org/cli.html)
* [Software Carpentry](http://swcarpentry.github.io/sql-novice-survey/)
* [Data Carpentry](http://www.datacarpentry.org/sql-ecology-lesson/)
* Translation (where possible) of tutorial materials covered in the [MySQL intro]({{ site.baseurl }}{% post_url 2016-12-01-mysql-intro-part1_overview %}) series.
* [Tutorialspoint](https://www.tutorialspoint.com/sqlite/index.htm) (always a handy source) :smile:.

Other tutorial topics will be explored as they become of interest or relevance, and I look forward to exploring this useful tool. Please join me in the next installment :smile:!!