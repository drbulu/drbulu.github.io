---
layout: post
title: MySQL basic admin
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms]
---

## basic admin

## MySQL basic usage

### a) tutorial here
https://dev.mysql.com/doc/refman/5.7/en/mysql-shell.html

tutorial: http://dev.mysql.com/doc/refman/5.7/en/tutorial.html 

dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-starting-and-stopping-server

http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-starting-and-stopping-server

### Control MySQL service

#### Basic comands
{% highlight shell %}
# 1) check server serice run status: 
shell> sudo service mysql status
# 2) start server:
shell> sudo service mysql start
# 3) stop server
shell> sudo service mysql status
# 4) restart server 
shell> sudo service mysql restart
{% endhighlight %}


#### Alternative commands

{% highlight shell %}
# Note: syntax for these commands work with either "mysql" or "mysql.service"
# 1) check server serice run status: 
shell> sudo systemctl status mysql.service
# 2) start server:
shell> sudo systemctl start mysql
# 3) stop server
shell> sudo systemctl stop mysql
# 4) restart server 
shell> sudo systemctl restart mysql
{% endhighlight %}

* Logging in from commandline

    * login as root (admin) mysql user: syntax also works for non-root (can omit -h hostName for localhost?)

mysql -u root -p   
 
mysql -u root -ppasswordString

Note: If you sudo the following command, it could result in vivid world of pain!



## Create and setup database ..............................................

From: http://dev.mysql.com/doc/refman/5.7/en/database-use.html
Mysql comments: https://dev.mysql.com/doc/refman/5.7/en/ansi-diff-comments.html
http://dev.mysql.com/doc/refman/5.7/en/creating-database.html

list of functions: http://dev.mysql.com/doc/refman/5.7/en/functions.html

1. Get a list of databases (and users)

* show databases
<% highlight sql %>
mysql> SHOW DATABASES;
<% endhighlight >

* show users

http://alvinalexander.com/blog/post/mysql/show-users-i-ve-created-in-mysql-database
mysql> select host, user, password from mysql.user;

mysql> desc mysql.user;

* create user : http://dev.mysql.com/doc/refman/5.7/en/create-user.html

mysql> CREATE USER 'root'@'localhost';

mysql> CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'new_password';

## testing - Basic command flow
CREATE USER 'newUser'@'hostName' IDENTIFIED BY 'createBetterPass'; 
GRANT ALL ON myDatabase.* TO 'newUser'@'hostName';
QUIT;
shell> mysql -h hostName -u newUser -pm4RNNMiqFbxEzbrLW9sc! myDatabase
###

* show account associated with the current session. 

mysql> CURRENT_USER() 

* [remove](http://dev.mysql.com/doc/refman/5.7/en/removing-users.html) user 

mysql>DROP USER 'jeffrey'@'localhost';

2. Switch to an existing database

<% highlight sql %>
mysql> USE test
<% endhighlight >

3. Admin - Assign user privileges to a specific database

<% highlight sql %>
mysql> GRANT ALL ON menagerie.* TO 'your_mysql_name'@'your_client_host';
<% endhighlight >

4. 

<% highlight sql %>
CREATE DATABASE menagerie;
<% endhighlight >

5. Select to and Connect to and 

<% highlight sql %>
mysql> USE menagerie # comment: if not already selected
shell> mysql -h host -u user -p menagerie
<% endhighlight %>


6. Show table columns
http://stackoverflow.com/questions/1580450/how-do-i-list-all-the-columns-in-a-table#1580461



6. Importing database from script
http://stackoverflow.com/questions/17666249/how-to-import-an-sql-file-using-the-command-line-in-mysql#17666279

https://www.cyberciti.biz/faq/import-mysql-dumpfile-sql-datafile-into-my-database/

must create db first (and setup user firsat)

shell> mysql -u username -p database_name < file.sql    Note: full path preferred

7. exporting data
https://dev.mysql.com/doc/refman/5.7/en/select-into.html

http://stackoverflow.com/questions/5164033/export-a-mysql-database-to-sqlite-database#13871628

8. Cancelling console command
