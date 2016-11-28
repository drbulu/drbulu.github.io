---
layout: post
title: A pain in the MySQL!
published: true
series: MySQL intro
categories: [data management, database]
tags: [linux, ubuntu, SQL, MySQL, relational database, rdbms]
---

## components


core 
[server](http://dev.mysql.com/doc/refman/5.7/en/programs-server.html)
and [client](http://dev.mysql.com/doc/refman/5.7/en/programs-client.html)
use to connect to 



### did background reading
after tale of woe

* followed the following instructions at this page: http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/

http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-select-series

in particular, I followed the instructions here: http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install

There were other overviews, such as [this](https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/) informative one and others [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04#step-2-install-mysql-to-manage-site-data) and [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#step-2-install-mysql) but I chose the go with the official line.

## installation - OFFICIAL

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

## installing ODBC drivers

Exploring databases using RMySQL and ran into an issue that seemed to be linked to OBDC driver installation. Background:

https://en.wikipedia.org/wiki/Open_Database_Connectivity
http://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html
http://www.unixodbc.org/

recommended process to install OBDC driver

1) install unixobdc ensure that it is installed: https://ubuntuforums.org/showthread.php?t=1010480 

sudo apt-get install unixodbc-dev unixodbc-bin unixodbc

2) install the official mysql driver: http://askubuntu.com/questions/800216/installing-ubuntu-16-04-lts-how-to-install-odbc#846819

* go to: http://dev.mysql.com/downloads/connector/odbc/ 

* selected "Ubuntu Linux 15.10 (x86, 64-bit), Compressed TAR Archive" for 16.04 (my OS version)

* copied the file libmyodbc5a.so to /usr/lib/x86_64-linux-gnu/odbc/

3) Configure the /etc/odbcinst.ini file 

<pre>
[MySQL]
Description = ODBC for MySQL
Driver = /usr/lib/x86_64-linux-gnu/odbc/libmyodbc5a.so
Setup = /usr/lib/x86_64-linux-gnu/odbc/libodbcmyS.so
FileUsage = 1
</pre>

not sure if you will need the /etc/odbc.ini setup unless there are a specific set of configurations that you want to setup.

### Tale of woe

I strongly susped that because I messed up the login as mysql root by applying sudo command
I had to purge my previous attempt at installation

sudo apt-get remove mysql-server
sudo apt-get autoremove

Then I had to start the install from scratch after deleting the contents of the mysql subdirectories var

This was because all of the machinations that I tried to use to resolve the issue, including attempting [password resets](https://www.cyberciti.biz/tips/recover-mysql-root-password.html), all to no avail.

I had a vague suspicion that it was due to a permissions erros because every attempt to access mysql either from the console or workbench threw a permissions error, even when prepending commands with **sudo**. Therefore I tried [this](http://unix.stackexchange.com/questions/208328/permission-denied-writing-to-mysql-log#208335), also to no avail.

During this time I found these resources useful: 

https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/


### moral of the story

READ CAREFULLY, and PROCEED slowly!

hopefully this is a cautionary tale to all

## Misc - Getting RMySQL to work

Background: https://en.wikipedia.org/wiki/Open_Database_Connectivity

http://askubuntu.com/questions/800216/installing-ubuntu-16-04-lts-how-to-install-odbc#800631
https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html

# R seems to need mariadb
https://github.com/rstats-db/RMySQL (already installed!)
https://cran.r-project.org/web/packages/RMySQL/index.html (check dependencies .. installing them)
Error: Unable to locate package libmariadb-client-dev

http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-replacing
let's try.

Tryi using - ?
http://stackoverflow.com/questions/24699542/how-do-i-get-sql-database-into-r-from-local-host/24956219#24956219
1) download and install odbc connector driver
2) setup odbc connector


https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html
# installing r-cran-rodbc - didn't work
# https://help.ubuntu.com/community/ODBC