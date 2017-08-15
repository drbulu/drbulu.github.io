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

<b style="color:red;">Terninology note:</b> During my quest to survey the lay of the land I kept stumbling upon a confusing bit of terminology that was finally cleared up [here](http://stackoverflow.com/questions/11803190/can-i-have-multiple-databases-on-oracle-express-edition). Basically, in "Oracle speak" (sic), <u>Database</u> refers to the software system (particularly the oracle SQL server application), not the relational databases managed by the Oracle SQL server, as defined by their individual schemas. 

Simply put, to use MySQL for comparison, the Oracle Database is the equivalent of the MySQL Server platform, while Oracle database <u>schemas</u> are the rough equivalent of individual MySQL databases. It was a small point... but a painful one.

## Installation strategy

### Background indepth

I am starting to get the hang of RDBMS installation, thanks to MySQL experience (pun intended). However, installation of the Oracle presented an interesting challenge as I began to do my background reading. Readers of my previous series would note that I am running the Linux OS, specifically [Ubuntu](https://www.ubuntu.com/), which is a well supported open source platform.

This presents a challenge as the latest version of the Oracle Database platform, [version 12](https://docs.oracle.com/database/122/LADBI/operating-system-checklist-for-oracle-database-installation-on-linux.htm#LADBI-GUID-E5C0A90E-7750-45D9-A8BC-C7319ED934F0) as of the writing of this post, does not support Ubuntu and seems to be targeted towards enterprise Linux platforms. Given that I am planning to install the Oracle database software for purely personal and educational use, I am not interested in obtaining an [enterprise grade](https://www.oracle.com/database/enterprise-edition/index.html) platform with the associated "enterprise price tag".

Enter the [Oracle Database Express Edition (XE)](http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html) (currently at version 11), a more lightweight, streamlined version of the Oracle database that is free and targeted for educational and experimental use. There are a number of product [usage restrictions](http://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL116) that come with it, but these should not affect my intended usage. Interestingly, [this article](http://www.oracle.com/technetwork/articles/sql/cunningham-database-xe-087516.html) for the previous version of XE illustrates that this scaled-down product is more than just a learning tool. Cool, so Oracle Database XE 11 should support Ubuntu right? Not really, according to the [system requirements](http://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#BABDHJHB).

### Available options

One of the first sources of information regarding installation options for Oracle XE was a rather useful blog [here](http://tuhrig.de/3-ways-of-installing-oracle-xe-11g-on-ubuntu/), which was well written and and researched with a lot of detail and references.
Manual methods, Virtual Machines (VMs), and via [Docker](https://www.docker.com/) images.

Some additional legwork on my part revealed that there is indeed a debian package for Oracle XE 10 (previous version at time of writing), discussed in a number of places (for example [here](http://www.davidpashley.com/articles/oracle-install/), [here](https://www.cyberciti.biz/faq/howto-install-linux-oracle-database-xe-server/) and [here](http://www.oracle.com/technetwork/topics/linux/xe-on-kubuntu-087822.html)). There is also a descrption of this package [here](https://oss.oracle.com/debian/dists/unstable/non-free/binary-i386/Packages). Interestingly, it seems like the database server and command-line app are available, but the SQL Developer GUI platform is not included. This makes sense, but is good to know. 

Essentially, this makes Oracle XE 10 basically Ubuntu-compatible via *.deb file-based install. I say "basically" because as detailed at the end of [this article](http://www.davidpashley.com/articles/oracle-install/#idp52304), this packages doesn't exactly meet spec due to apparent issues with how the package was put together. In my book, this makes the deb install quasi-homebrew, which is a worry when it is put together by someone else in a manner unknwon to me. That said, it is a convenient option.

### Selected option?

After all this, you might be wondering which route I am planning to walk down? The manual option is the first path to travel forward in. This represents the most labour intensive and failure fraught path forward, however, I make my decision for the following reasons:

* VMs seem painful and I'm not really interested. Docker is a better option but I want to give it more focus later.
* The deb packages seems to be both obsolete, unsupported and buggy... not a great combination.
* [SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html): This database design and management tool is what I would describe as the Oracle equivalent of [MySQL workbench](https://www.mysql.com/products/workbench/) (for beter or worse). The latest version (at time of writing) is version 17.2, which surprisingly is available for use in Ubuntu (without moonshining) according to the [software specs](http://docs.oracle.com/database/sql-developer-17.2/RPTIG/installing-sql-developer.htm#GUID-16F0A7C3-6EC1-4176-9B15-FE4AA8D70D5F__BABICFGA). This is very handy! While there are a number of database design tools out there, SQL Developer is one that I am interested in getting to know.
* I could always fall back on either the Oracle XE 10 deb package or try out Docker if this path fails.
* While Initially spooked by the "homebrew" nature of the manual installation process, but my reading indicated that this was a road more frequently travelled than I previously expected (see guides [here](https://community.oracle.com/thread/2229554), 
[here](https://askubuntu.com/questions/566734/how-to-install-oracle-11gr2-on-ubuntu-14-04) and [here](https://mariadb.com/kb/en/mariadb/oracle-xe-112-and-mariadb-101-integration-on-ubuntu-1404-and-debian-systems/)
). This gave me some cause for hope... but underscored the need remained to understand what I was in for and specifically, what I was doing. Everything that is installed... should be uninstallable (sic)... this goes even for the "magical homebrew".

## Conclusion

Having embarked on the "manual path", the next step is to get acquainted with the tools and background that I need... so that I:

* won't "brick" or otherwise damage my system.
* will know how to properly install, manage and uninstall this new software.

Well then... see you in the next installment!! :smile: