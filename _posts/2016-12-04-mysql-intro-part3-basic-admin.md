---
layout: post
title: MySQL basic admin
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms]
---

Managing MySQL... :smile:

## Introduction
Previously, I [installed]( {{ site.baseurl }}{% post_url 2016-12-02-mysql-intro-part2-setup %} ) MySQL for linux. Having installed MySQL on my system such that I am the admin, this post is a reference point or cheat sheet of sorts. Thus, I have included some of the basic admin commands to help me manage MySQL installation (sic).

<b style="color:red;">Note:</b> SQL is a case <b>in</b>sensitive language, therefore **```select```** and **```SELECT```** are the _same_ command!

## MySQL basic usage

### MySQL service control

From the [installation guide](http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-starting-and-stopping-server), we find out how to **start**, **stop** and **reset** the MySQL server, and to **check** whether the server is running.

{% highlight shell %}
#### MySQL server service commands
# 1) check server serice run status: 
shell> sudo service mysql status
# 2) start server:
shell> sudo service mysql start
# 3) stop server
shell> sudo service mysql status
# 4) restart server 
shell> sudo service mysql restart

#### Alternative command syntax
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

### MySQL terminal access

#### 1) Connecting to server 

From [commandline](http://dev.mysql.com/doc/refman/5.7/en/connecting-disconnecting.html): user login syntax

{% highlight shell %}
# Note: "-h hostName" can be omitted for localhost
# secure - prompt to add hidden password on next line
shell> mysql -h hostName -u userName -p
# insecure - password visible (note: no space afer "-p")
shell> mysql -h hostName -u userName -ppasswordString
{% endhighlight %} 

#### 2) login as root (admin) mysql user:

<b style="color:red;">Note:</b> If you **```sudo```** the following command... it could result in vivid world of pain! [This](http://stackoverflow.com/questions/28068155/) is the issue I had, but there seems to be potential fixes discussed [here](http://stackoverflow.com/questions/37239970/) and [here](https://serverpilot.io/community/articles/how-to-access-mysql-with-the-mysql-root-user.html). These solutions might be suitable for a personal setting, but for production scenarios check out the instruction [here](http://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html) (and [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04#step-2-install-mysql-to-manage-site-data)).

{% highlight shell %}
shell> mysql -u root -p   
{% endhighlight %} 

#### 3) disconnecting
{% highlight sql %}
mysql> QUIT
# or
mysql> \q
{% endhighlight %}

### Seek help!

From this [tutorial](http://dev.mysql.com/doc/refman/5.7/en/tutorial.html):

{% highlight sql %}
mysql> mysql --help
# or
mysql> \h
{% endhighlight %}

### MySQL comments

Some interesting [info](https://dev.mysql.com/doc/refman/5.7/en/ansi-diff-comments.html) about creating comments:

{% highlight sql %}
mysql> # this text is a commment
mysql> /* this is also a comment */
mysql> -- this is also a comment but (--) must precede a space
{% endhighlight %}

### Cancel Command

Cancel the execution of an [unexecuted](http://stackoverflow.com/questions/8811464/) console command: 

{% highlight sql %}
mysql> \c
# or
mysql> clear
{% endhighlight %}

## Database creation and access

Some of the following commands are covered in more detail [here](http://dev.mysql.com/doc/refman/5.7/en/database-use.html) and [here](http://dev.mysql.com/doc/refman/5.7/en/creating-database.html). More detail will be covered in tutorials in later posts.

### Show databases

{% highlight sql %}
mysql> SHOW DATABASES;
{% endhighlight %}

### Create databases

{% highlight sql %}
mysql> CREATE DATABASE databaseName;
{% endhighlight %}

### Connecting to an existing database

#### 1) From MySQL console

{% highlight sql %}
mysql> USE databaseName;
{% endhighlight %}

#### 2) From Shell console
{% highlight shell %}
shell> mysql -h host -u user -p databaseName
{% endhighlight %}

### Delete an existing database

More info [here](https://dev.mysql.com/doc/refman/5.7/en/drop-database.html):

{% highlight sql %}
mysql> DROP DATABASE databaseName;
# or
mysql> DROP SCHEMA databaseName;
{% endhighlight %}

### Show users

* Show [all](http://alvinalexander.com/blog/post/mysql/show-users-i-ve-created-in-mysql-database) users.

{% highlight sql %}
mysql> SELECT host, user, password FROM mysql.user;
# describe structure of user table
mysql> DESC mysql.user;
# or
mysql> DESCRIBE mysql.user;
{% endhighlight %}

* Show current user:

{% highlight sql %}
# Show account associated with the current session
mysql> CURRENT_USER()
{% endhighlight %}

### Create users

* [creating](http://dev.mysql.com/doc/refman/5.7/en/create-user.html) users

{% highlight sql %}
mysql> CREATE USER 'userName'@'hostName' IDENTIFIED BY 'password';
{% endhighlight %}

### Remove users

* Using [this](http://dev.mysql.com/doc/refman/5.7/en/removing-users.html) syntax.

{% highlight sql %}
mysql> DROP USER 'userName'@'hostName';
{% endhighlight %}

### Assign user privileges to a specific database

For more detail, see [here](http://dev.mysql.com/doc/refman/5.7/en/grant.html):

{% highlight sql %}
# All privileges in this case
mysql> GRANT ALL ON databaseName.* TO 'userName'@'hostName';
{% endhighlight %}


## Conclusion

Now that we have a basic idea of how to navigate the MySQL environment in order to administer it, let's go onto using it to populate and utilise databases using MySQL :smile:! 
