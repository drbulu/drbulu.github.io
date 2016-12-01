---
layout: post
title: MySQL - Basic Tutorial
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms]
---

## Basic usage

## MySQL basic usage - install test data

https://dev.mysql.com/doc/employee/en/employees-installation.html

source location: https://github.com/datacharmer/test_db


## Sample database


* TOC: https://dev.mysql.com/doc/sakila/en/ 
    * installation section: https://dev.mysql.com/doc/sakila/en/sakila-installation.html

* 
    https://en.wikipedia.org/wiki/The_BFG
https://www.roalddahl.com/roald-dahl/stories/1980s/the-bfg

2whizpoppingFrobscottle*!
    
    * back up and recovery

http://dev.mysql.com/doc/refman/5.7/en/backup-and-recovery.html


## Next post(s)

## mysql tutorials
http://www.tutorialspoint.com/mysql/
    www.w3schools.com/sql

https://www.tutorialspoint.com/r/r_database.htm

https://www.r-bloggers.com/mysql-and-r/
    https://www.r-bloggers.com/accessing-mysql-through-r/
    https://cran.r-project.org/web/packages/dplyr/vignettes/databases.html    
    
    ## sqlite
    http://swcarpentry.github.io/sql-novice-survey/
    http://www.datacarpentry.org/sql-ecology-lesson/
    http://www.datacarpentry.org/R-ecology-lesson/06-r-and-sql.html

# SQL DF
https://www.r-bloggers.com/make-r-speak-sql-with-sqldf/
    https://www.r-bloggers.com/manipulating-data-frames-using-sqldf-a-brief-overview/
    
    ## ERD software
    
    
    ## good resources
    http://software-carpentry.org/lessons/
    http://www.datacarpentry.org/lessons/

## RMySQL

https://enotacoes.wordpress.com/2010/11/18/installing-rodbc/
run: sudo apt-get install unixodbc-dev 
before: install.packages("RODBC")
https://ubuntuforums.org/showthread.php?t=1010480
sudo apt-get install unixodbc-dev unixodbc-bin unixodbc
https://www.r-bloggers.com/mysql-and-r/

http://stackoverflow.com/questions/4448467/cant-connect-to-local-mysql-server-through-socket-var-lib-mysql-mysql-sock
got new error, then needed 
http://stackoverflow.com/questions/3426523/odbcconnectexcel-function-from-rodbc-package-for-r-not-found-on-ubuntu
unix packages already installed!
convenience function for fetching data from DB queries
use "n = -1" arg if fetching more than 500 queries: stackoverflow.com/questions/31977297/#31978811

background
https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html
installing r-cran-rodbc - didn't work
https://help.ubuntu.com/community/ODBC

trying this: The most useful solution was this!
connection syntax
http://stackoverflow.com/questions/24699542/how-do-i-get-sql-database-into-r-from-local-host#24956219
command to locate unix.socket entry - everything worked after trying the con() call with , then without the unix.socket
http://www.kaffeetalk.de/how-to-setup-and-configure-mysql-with-unixodbc-under-ubuntu-14-04/

# rounding posix dates: stackoverflow.com/questions/16041093/#16041383
    
