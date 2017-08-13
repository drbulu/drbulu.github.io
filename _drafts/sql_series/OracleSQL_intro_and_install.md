---
layout: post
title: "Installing Oracle SQL"
published: true
series: Oracle SQL intro
categories: [data management, database]
tags: [SQL, Oracle, relational database, rdbms, tutorial]
---

## Introduction

I have previously started series focused on learning how to use different SQL RDBMS platforms. So far, I have begun to explore [MySQL]({{ site.baseurl }}{% post_url 2016-12-01-mysql-intro-part1_overview %}) and [SQLite]({{ site.baseurl }}{% post_url 2017-08-02-sqlite_installation %}).

The overall aim of these series is to develop a broad set of database management skills that I can apply in different ways as my data science career develops. To this end, I have started looking into data warehousing concepts from the perspective of using them as part of a data science toolkit for applications such as:

* Designing data stores for bulk data processing
* Understanding data warehouse design to facilitate effective data extraction and analysis.

The material that I have taken a peek at is from the [Data Warehousing for Business Intelligence Specialization](https://www.coursera.org/specializations/data-warehousing) offered on the Coursera platform, which seems like a useful vehicle for aquiring my desired skillset. It turns out that the [third course](https://www.coursera.org/learn/dwrelational) in this series specifically requires access to the Oracle RDBMS plaftorm to facilitate the teaching of a number of concepts relating to business intelligence including specialised summary queries and analytic functions.

## Installation strategy

### Background

I am starting to get the hang of RDBMS installation, thanks to MySQL experience (pun intended). However, installation of the Oracle presented an interesting challenge as I began to do my background reading. Readers of my previous series would note that I am running the Linux OS, specifically [Ubuntu](https://www.ubuntu.com/), which is a well supported open source platform.

This presents a challenge as the latest version of the Oracle Database platform, [version 12](https://docs.oracle.com/database/122/LADBI/operating-system-checklist-for-oracle-database-installation-on-linux.htm#LADBI-GUID-E5C0A90E-7750-45D9-A8BC-C7319ED934F0) as of the writing of this post, does not support Ubuntu and seems to be targeted towards enterprise Linux platforms. Given that I am planning to install the Oracle database software for purely personal and educational use, I am not interested in obtaining an [enterprise grade](https://www.oracle.com/database/enterprise-edition/index.html) platform with the associated "enterprise price tag".

Enter the [Oracle Database Express Edition (XE)](http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html) (currently at version 11), a more lightweight, streamlined version of the Oracle database that is free and targeted for educational and experimental use. There are a number of product [usage restrictions](http://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL116) that come with it, but these should not affect my intended usage. Interestingly, [this article](http://www.oracle.com/technetwork/articles/sql/cunningham-database-xe-087516.html) for the previous version of XE illustrates that this scaled-down product is more than just a learning tool. Cool, so Oracle Database XE 11 should support Ubuntu right? Not really, according to the [system requirements](http://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#BABDHJHB).

### Available options

One of the first sources of information regarding installation options for Oracle XE was a rather useful blog [here](http://tuhrig.de/3-ways-of-installing-oracle-xe-11g-on-ubuntu/), which was well written and went into detail
Manual methods, Virtual Machines (VMs), and via Docker images.

Debian package: 

* http://www.davidpashley.com/articles/oracle-install/
* https://www.cyberciti.biz/faq/howto-install-linux-oracle-database-xe-server/ 
* description: https://oss.oracle.com/debian/dists/unstable/non-free/binary-i386/Packages
* http://www.oracle.com/technetwork/topics/linux/xe-on-kubuntu-087822.html
* Note: one of the articles mentions potential package bugs!


Server, SQLplus (command line)... need SQL Developer, IDE and database design tool.

Manual method:

* Install guide... custom: https://community.oracle.com/thread/2229554
* BETTER LAYOUT: https://askubuntu.com/questions/566734/how-to-install-oracle-11gr2-on-ubuntu-14-04
* https://mariadb.com/kb/en/mariadb/oracle-xe-112-and-mariadb-101-integration-on-ubuntu-1404-and-debian-systems/
* Initially spooked by th "homebrew" nature of this process, but my reading indicated that this was a road more frequently travelled than I previously expected. This gave me some cause for hope... but the need remained to understand what I was in for and specifically, what I was doing. Everything that is installed... should be uninstallable... even the magical homebrew.


<br/><br/><br/>


* SQL Developer install (official): 

[SQL developer home page: ](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html)

* http://docs.oracle.com/database/sql-developer-17.2/RPTIG/installing-sql-developer.htm#RPTIG122
* http://docs.oracle.com/database/sql-developer-4.2/RPTIG/installing-sql-developer.htm#RPTIG122
* Docs: http://www.oracle.com/technetwork/developer-tools/sql-developer/documentation/index.html
* https://askubuntu.com/questions/458554/how-to-install-sql-developer-on-ubuntu-14-04


MySQL DBs = Oracle DB schemas...
In Oracle, database referse to the software system, not the relational DBs that it contains, as defined by their individual schemas.

http://stackoverflow.com/questions/11803190/can-i-have-multiple-databases-on-oracle-express-edition


<br/><br/><br/>


Alternative... MS SQL server
https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-ubuntu

Reference-style links refresher: https://daringfireball.net/projects/markdown/syntax#link
https://stackoverflow.com/questions/32755396/does-jekyll-suport-global-markdown-reference-links
https://stackoverflow.com/questions/39601358/jekyll-unhide-reference-style-links-on-github-pages
