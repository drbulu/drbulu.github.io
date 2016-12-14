---
layout: post
title: A pain in the MySQL!
published: false
series: MySQL intro
categories: [data management, database]
tags: [linux, ubuntu, SQL, MySQL, relational database, rdbms]
---


## Note: 

## TCP vs. Socket connector!
This was the issue... and it wasn't linked to ODBC installation, although it is good that I have resolved that!
http://stackoverflow.com/questions/16325607/cant-connect-to-local-mysql-server-through-socket-tmp-mysql-sock#18842834
other useful https://blogs.oracle.com/mysqlconnectors-ODBC/entry/how_to_deal_with_mysql

## R seems to need mariadb
https://github.com/rstats-db/RMySQL (already installed!)
https://cran.r-project.org/web/packages/RMySQL/index.html (check dependencies .. installing them)
Error: Unable to locate package libmariadb-client-dev

http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-replacing
    let's try.

Tryi using - ?
http://stackoverflow.com/questions/24699542/how-do-i-get-sql-database-into-r-from-local-host/24956219#24956219
1) download and install odbc connector driver
2) setup odbc connector

## tcp vs socket pipe
http://dev.mysql.com/doc/refman/5.5/en/can-not-connect-to-server.html

https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-introduction.html
# installing r-cran-rodbc - didn't work
# https://help.ubuntu.com/community/ODBC

### Further info

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
https://www.tutorialspoint.com/r/r_database.htm


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

rounding posix dates: stackoverflow.com/questions/16041093/#16041383
    