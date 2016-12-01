---
layout: post
title: MySQL reflections!
published: false
series: MySQL intro
categories: [data management, database]
tags: [linux, ubuntu, SQL, MySQL, relational database, rdbms]
---

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