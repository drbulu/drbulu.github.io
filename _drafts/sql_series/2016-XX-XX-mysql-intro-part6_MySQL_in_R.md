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