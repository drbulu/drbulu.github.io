---
layout: post
title: A pain in the MySQL!
published: true
series: MySQL intro
categories: [data management, database]
tags: [linux, ubuntu, SQL, MySQL, relational database, rdbms]
---

... but it was worth it!

## Background Preparation

In the [previous]({{ site.baseurl }}{% post_url 2016-12-01-mysql-intro-part1_overview %}) post in this series I gave a little background about MySQL and my motivation for learning it now. The next basic question is "well, that's nice... but how do I go about installing MySQL?". This is the focus of this post. 

Basically, in order to install MySQL, you need to have two core compoments, a [server](http://dev.mysql.com/doc/refman/5.7/en/programs-server.html) that manages or (**controls**) access to the database (**model**) by one or more [client](http://dev.mysql.com/doc/refman/5.7/en/programs-client.html) programs by which users **view** the information that they need. The emphasis in the previous statement is deliberate, as it reminds me of the components of the [Model-View-Controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) framework.

I did some background reading to make sure that I understood what I was doing, I ended up following the instructions at [mysql.com](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/) to install their implementation of MySQL. In particular, I followed the instructions to perform a [fresh installation](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install). There were other overviews, such as [this](https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/) informative one and others [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04#step-2-install-mysql-to-manage-site-data) and [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#step-2-install-mysql) but I chose the go with the "official" line, after getting burnt going homebrew (:neutral_face:).

<b style="color:red;">Note:</b> this series handles the installation and use of MySQL on the Linux platform. MySQL.com also has instructions for [Windows](http://dev.mysql.com/doc/refman/5.7/en/windows-installation.html) or [Mac OSX](http://dev.mysql.com/doc/refman/5.7/en/osx-installation.html)... "All the best in thine quest!". The [installation chapter](http://dev.mysql.com/doc/refman/5.7/en/installing.html) also has instructions for other OS environments.

## MySQL Installation

### Setup Guide

**Step 1:** Downloaded the deb file from the [MySQL apt rep](http://dev.mysql.com/downloads/repo/apt/) and select the appropriate file for your OS. More information can be found in the guide [here](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/).

{% highlight shell %}
# General syntax:
# Note: you may be able to select MySQL version at this point.
shell> sudo dpkg -i /path/to/file/mysql-apt-config_w.x.y-z_all.deb
{% endhighlight %}

**Step 2:** Update [APT](https://help.ubuntu.com/community/AptGet/Howto/) software package repo versions, then install updated versions. Note: you can use either ```apt``` or ```apt-get```.

{% highlight shell %}
shell> sudo apt-get update
shell> sudo apt-get upgrade
{% endhighlight %}

> **Note:** The [update](http://askubuntu.com/questions/222348/what-does-sudo-apt-get-update-do) command simply updates the package list with the latest versions, then upgrade performs the actual package installation. [Here](askubuntu.com/questions/194651/#226213/) is an interesting discussion of how to apply the upgrade instruction, and [here](https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html/) is a cool cheat sheet.

**Step 3:** install mysql-server (and client) package.

{% highlight shell %}
shell> sudo apt-get install mysql-server
{% endhighlight %}

Note: At this point it is a good idea to check to see whether the mysql core installation works as intended.

**Step 4:** install other MySQL components:

This step was only useful to me _after_ doing a basic check <link> to make sure that the _core_ installation was workng properly. I didn't do this on my first install attempt. That said, there is no reason not to install these components before checking out the install.

{% highlight shell %}
shell> sudo apt-get install mysql-workbench-community
shell> sudo apt-get install libmysqlclient18
{% endhighlight %}

There is a list of other MySQL packages [here](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-rpm.html).

**Step 5:** Optional - Reconfigure MySQL
[This step](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-select-series) appears to be optional and can be done at any time after mysql installation (step 3). However however, this step seems to be critical for [production server setup](https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/) after step 3. I stuck with the standard MySQL 5.7 (at step 2 or3) major release.

{% highlight shell %}
# reconfigure MySQL and change release version
shell> sudo dpkg-reconfigure mysql-apt-config
# update APT repo version if changed
shell> sudo apt-get update
# implement changes
shell> sudo apt-get install mysql-server
{% endhighlight %}

### Summary: Command flow

The following code block gives a concise summary of the installation instructions [above](#setup-guide) and how the steps fit together. These instructions can be used sequentially at the command line, packaged into an installation script or even entered as a single line separated by 

{% highlight shell %}
# Step 1: Setup and Configure MySQL apt repo
shell> sudo dpkg -i /path/to/file/mysql-apt-config_0.8.0-1_all.deb
# Step 2: Update System
shell> sudo apt-get update
shell> sudo apt-get upgrade
# Step 3: Install MySQL
shell> sudo apt-get install mysql-server
# Step 4: Install 
shell> sudo apt-get install mysql-workbench-community
shell> sudo apt-get install libmysqlclient18
{% endhighlight %}

## ODBC installation

### Setup Guide

Exploring databases using RMySQL and ran into an issue that seemed to be linked to OBDC driver installation. After some [background](https://en.wikipedia.org/wiki/Open_Database_Connectivity) reading, I found that (ODBC) Open Database Connectivity is a standard relational database API... so I figured that this was something that was important to have so that I could use third party database access apps (such as R packages like RMySQL) without hassle. Unsurprisingly, MySQL.com also has a set of [ODBC drivers](http://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html), and the [unixODBC](http://www.unixodbc.org/) project implements the [Unix ODBC API](https://en.wikipedia.org/wiki/UnixODBC). So... I proceeded to install the MySQL OBDC driver set.

**Step 1:** Install [unixobdc](https://ubuntuforums.org/showthread.php?t=1010480) so that the components unixodbc, unixodbc-dev and unixodbc-bin are prepared.

{% highlight shell %}
shell> sudo apt-get install unixodbc-dev unixodbc-bin unixodbc
{% endhighlight %}

**Step 2:** install the official mysql [OBDC driver](http://dev.mysql.com/doc/connector-odbc/en/connector-odbc-installation-binary-unix-tarball.html). <b style="color:red;">Note:</b> Apparently the [libmyodbc](http://askubuntu.com/questions/800216/installing-ubuntu-16-04-lts-how-to-install-odbc#800631) ODBC driver package is now basically obsolete for 16.04. I previously tried [this]([OBDC driver](http://askubuntu.com/questions/800216/installing-ubuntu-16-04-lts-how-to-install-odbc#846819) method but I'm not sure if it worked. The official instructions work :confused:, should have learned from the [previous](#mysql-installation) section... :neutral_face:. Note, you may have to **```sudo```** these commands... so beware!

* _**a)**_ Go to the mysql.com [obdc](http://dev.mysql.com/downloads/connector/odbc/) page and select the _**"Ubuntu Linux 15.10 (x86, 64-bit), Compressed TAR Archive"**_ for my Ubuntu 16.04 installation.

* _**b)**_ [extract files](http://askubuntu.com/questions/25347/what-command-do-i-need-to-unzip-extract-a-tar-gz-file#25348) from the compressed archive.

{% highlight shell %}
tar -xvzf mysql-connector-odbc-5.3.6-linux-ubuntu15.10-x86-64bit.tar.gz
{% endhighlight %}

* _**c)**_ From the terminal, **```cd```** into the main directory of the archive extracted in _**b)**_.

{% highlight shell %}
shell> cp bin/* /usr/local/bin
shell> cp lib/* /usr/local/lib
{% endhighlight %}

* _**d)**_ Register the installed drivers

{% highlight shell %}
# Unicode Driver
shell> myodbc-installer -a -d -n "MySQL ODBC 5.2 Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so"
# ANSI Driver
shell> myodbc-installer -a -d -n "MySQL ODBC 5.2 Driver" -t "Driver=/usr/local/lib/libmyodbc5a.so"
{% endhighlight %}

* _**e)**_ Verify driver installation and registration

{% highlight shell %}
shell> myodbc-installer -d -l
{% endhighlight %}

### Summary: Command flow

The series of setup commands to excecute once the driver compressed file has been downloaded and extracted (from step _**c)**_ onwards):

{% highlight shell %}
# Copy drivers and installation program
shell> cp bin/* /usr/local/bin
shell> cp lib/* /usr/local/lib
# Install Drivers
shell> myodbc-installer -a -d -n "MySQL ODBC 5.2 Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so"
shell> myodbc-installer -a -d -n "MySQL ODBC 5.2 Driver" -t "Driver=/usr/local/lib/libmyodbc5a.so"
# check installation
shell> myodbc-installer -d -l
{% endhighlight %}

## Conclusion
After much drama, I have learned much, and now I am able to explore the powers of MySQL. I will write about solutions to further configuration issues as I come across them in later posts. I will try to add updates in the section below to keep things easy to find :wink:!

## Update
Watch this space :smile: