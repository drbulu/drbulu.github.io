---
layout: post
title: MySQL - Basic Tutorial
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

## Introduction

Previously, I [aquainted myself]( {{ site.baseurl }}{% post_url 2016-12-04-mysql-intro-part3-basic-admin %} ) with managing my recently installed MySQL environment. Now to some of the fun stuff... exploring the power and utility of this wonderful tool :smile:! 

The [general tutorial](http://dev.mysql.com/doc/refman/5.7/en/tutorial.html) lays down the ground work for me to start looking into data, but there are many indepth guides including ones at [w3schools](http://www.w3schools.com/sql) and [tutorialspoint](http://www.tutorialspoint.com/mysql/). Both are quite detailed, and I will be looking to them for inspiration as I learn how to use MySQL. The **w3schools** tutorial is particularly useful due to its interactivity, because users can try out SQL statements via their online interface. Additionally, the list of functions [here](http://dev.mysql.com/doc/refman/5.7/en/functions.html) is another good potential resource.

There are a number of [test databases](http://dev.mysql.com/doc/index-other.html) that we could use, but we will be exploring the **Sakila** database through its [Sakila tutorial](http://dev.mysql.com/doc/sakila/en/) in combination with other resources such as the abovementioned. The source files contain instructions for database creation, and include the Sakila database design schema for use with [MySQL workbench](https://dev.mysql.com/doc/workbench/en/wb-data-modeling.html). [Database design](https://en.wikipedia.org/wiki/Database_design), including [ERD modelling](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model), is an important topic that I hope to explore further. Solid databases, are well designed ones :smile:!

## Sample database setup

### Install database
We will be setting up our test database as described [here](https://dev.mysql.com/doc/sakila/en/sakila-installation.html):

{% highlight shell %}
shell> mysql -u root -p
{% endhighlight %}

{% highlight sql %}
-- import database design schema
mysql> SOURCE C:/temp/sakila-db/sakila-schema.sql;
-- import data to populate database
mysql> SOURCE C:/temp/sakila-db/sakila-data.sql;
-- Note: replace "C:/temp/sakila-db/" with whatever your path is :)
{% endhighlight %}

{% highlight sql %}
-- having already connected to Sakila database..
mysql> SHOW TABLES;
mysql> SELECT COUNT(*) FROM film;
{% endhighlight %}

### Setup tutorial user

The MySQL root user is powerful, and as such **should** be invoked with care! As has been [said](https://en.wikiquote.org/wiki/Stan_Lee)..

> "With great power comes great responsibility."

Thus we have our user, [sophieG](https://en.wikipedia.org/wiki/The_BFG), through whom we will be commence our "datadventure" (sic). Now to [create]({{ site.baseurl }}{% post_url 2016-12-04-mysql-intro-part3-basic-admin %}/#create-users) and [empower]({{ site.baseurl }}{% post_url 2016-12-04-mysql-intro-part3-basic-admin %}#assign-user-privileges-to-a-specific-database) or intrepid user :smile:!

{% highlight sql %}
mysql> CREATE USER 'sophieG'@'localhost' IDENTIFIED BY '2whizpoppingFrobscottle*!';
mysql> GRANT ALL ON sakila.* TO 'sophieG'@'localhost';
{% endhighlight %}

Once complete, we need to login as our new user and check the correct provision of datbase privileges ([as above](#install-database)). 

## Conclusion

Once successful, we can move to the next step :smile:.