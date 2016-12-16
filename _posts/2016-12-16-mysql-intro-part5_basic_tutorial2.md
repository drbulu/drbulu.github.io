---
layout: post
title: MySQL - Basic Tutorial 2
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

... getting the lay of the land :smile:!

## Introduction

### Recap
Over the last couple of days I have been searching into the [w3schools](http://www.w3schools.com/sql/) and [tutorialspoint](http://www.tutorialspoint.com/mysql/) reference material to get some background information and insight into MySQL and how it functions. I have also looked through the [Sakila](http://dev.mysql.com/doc/sakila/en/) tutorial to see how the material worked and what to apply to my situation. Oddly enough, while useful, I wouldn't consider these to be tutorials as I would expect (like this [example](http://digitaldrummerj.me//blogging-on-github-part-1-Getting-Started/)). The **w3schools** and **tutorialspoint** materials are technically tutorials, but are focused on nicely contained code snippets to demonstrate a key piece of functionality. The Sakila "reference material" (as it mostly is), really only shines as a tutorial when it comes to the [installation](http://dev.mysql.com/doc/sakila/en/sakila-installation.html) and [usage examples](http://dev.mysql.com/doc/sakila/en/sakila-usage.html) sections.

### Realignment
Don't get me wrong, these are excellent resources, which I will be relying upon heavily in future endeavours. This introduction is simply to realign my expectations of the value that I should get [therefrom](https://en.wiktionary.org/wiki/therefrom) (yes!.. a real word, this one is!). 

Speaking of expectations, one of my main motivations to learn MySQL now was to enhance my data analytics capabilities by **i)** facilitating data extraction from an important sources of data (relational databases) and **ii)** giving me the skills to create rich structured datasets in SQL databases from raw and processed data that I would obtain (or scrape) from other sources. In short, SQL was a tool that I really wanted to get into my toolkit. In short, this basically means that I mostly want to use MySQL as a way to import and export data into data analysis environments (such as my beloved R) that are more predisposed to data analysis and manipulation.

### Revaluation

Coming full circle to the resources that I looked at [above](#recap), I realised that there was more to it than I had expected. The [w3schools](http://www.w3schools.com/sql/) and [tutorialspoint](http://www.tutorialspoint.com/mysql/) (mysql) reference both contain comprehensive coverage of the usefulness of MySQL (and SQL in general). So much so that it isn't feasible, or useful for me to replicate this material or approach, so... not doing that :wink:! 

Comparing these sources, I just realised that tutorialspoint also has a more general [SQL](http://www.tutorialspoint.com/sql/) tutorial which has a lot of depth but a more conceptual perspective to the tutorialspoint mysql tutorial, which seems to be more vocational (linked to web database admin domain). This is really important to me because I find that it is good to get the bigger picture sometimes. The **w3schools** material, while similar in focus to the tutorialspoint **_mysql_** material, but with the benefit of a well integrated console to try out commands as you read (works even on mobile platforms). In addition, the **w3schools** tutorial materlal has a great section on table [joins](http://www.w3schools.com/sql/sql_join.asp), which nicely illustrated subsections such as this one tackling [inner joins](http://www.w3schools.com/sql/sql_join_inner.asp).

In contrast, the sakila tutorial showcases a [textbook database](http://dev.mysql.com/doc/sakila/en/sakila-introduction.html) (literally!), that is [fully featured](http://dev.mysql.com/doc/sakila/en/sakila-structure.html) that showcases advanced functionality, but also provides some useful [examples](http://dev.mysql.com/doc/sakila/en/sakila-usage.html). One feature that caught my attention are [views](http://dev.mysql.com/doc/sakila/en/sakila-structure-views.html), which are [defined](http://dev.mysql.com/doc/refman/5.7/en/views.html) as:

>"Views are stored queries that when invoked produce a result set. A view acts as a virtual table."

I like this idea of views, because it opened up my mind to a different perspective on data import for analysis in my chosen environment. Rather than bulk data import using:

{% highlight sql%}
mysql> SELECT * FROM databaseTable
{% endhighlight%}

and subsequent processing of data records. 

### Epiphany!
Part of the point of using databases for analysis in combination with tools like R (and Python etc), is that the connection to the SQL environment does some of the heavy lifting. Therefore, the ability to craft usefully robust views (and other features) can effectively expedite (particularly routine) analysis by causing SQL to work **for** you in data import to streamline your analysis.

### Intro summary
Overall, this bodes well because these resources, including these examples in the [mysql docs](http://dev.mysql.com/doc/refman/5.7/en/examples.html) will allow me to make quite useful tutorial content what will hopefully be useful to others, in addition to helping me to consolidate the ideas as I learn them :smile:!

For completeness, I have organised some of these quite useful resources in a reference "appendix" [below](#resource-list).

## Data Exploration:

Now we call upon our back to our [intrepid explorer]( {{ site.baseurl }}{% post_url 2016-12-07-mysql-intro-part4_basic_tutorial1 %}#setup-tutorial-user ) to facilitate our exploration of the characteristics of the **```sakila```** database.

<b style="color:red;">Note</b>: To copy and paste the multi-line statements below, remove the **```->```** character, which indicates the continuation of a single statement across multiple lines to avoid a syntax error.

{% highlight shell %}
/* localhost connection */
shell> mysql -u sophieG -p sakila
Enter password: **********
{% endhighlight %}

### Show a tidy list of all the tables in the database

{% highlight sql %}
mysql> SHOW TABLES;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| film_text                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
23 rows in set (0.00 sec)
{% endhighlight %}

### Basic table summary

To get an idea of how to get a snapshot of an individual table's, I picked the **```film```** table to serve as a motivating example.

#### a) Describe table

This instruction summarises the defining characteristics of a table. The most interesting information initially to get a feel for a table would be the **```Field```** and **```Type```** columns. This is from the basic perspective of answering the questions:

* "What are the columns of this table **called**?"

* "What **kind** of information do these columns contain?"

The other information in this summary, to me, seems more useful in subsequent table content management.

{% highlight sql %}
mysql> DESC film;
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------+
| Field                | Type                                                                | Null | Key | Default           | Extra                       |
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------+
| film_id              | smallint(5) unsigned                                                | NO   | PRI | NULL              | auto_increment              |
| title                | varchar(255)                                                        | NO   | MUL | NULL              |                             |
| description          | text                                                                | YES  |     | NULL              |                             |
| release_year         | year(4)                                                             | YES  |     | NULL              |                             |
| language_id          | tinyint(3) unsigned                                                 | NO   | MUL | NULL              |                             |
| original_language_id | tinyint(3) unsigned                                                 | YES  | MUL | NULL              |                             |
| rental_duration      | tinyint(3) unsigned                                                 | NO   |     | 3                 |                             |
| rental_rate          | decimal(4,2)                                                        | NO   |     | 4.99              |                             |
| length               | smallint(5) unsigned                                                | YES  |     | NULL              |                             |
| replacement_cost     | decimal(5,2)                                                        | NO   |     | 19.99             |                             |
| rating               | enum('G','PG','PG-13','R','NC-17')                                  | YES  |     | G                 |                             |
| special_features     | set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') | YES  |     | NULL              |                             |
| last_update          | timestamp                                                           | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+----------------------+---------------------------------------------------------------------+------+-----+-------------------+-----------------------------+
13 rows in set (0.00 sec)
{% endhighlight %}

#### b) counting rows

This is pretty simple :smile:

{% highlight sql %}
mysql> SELECT COUNT(*) FROM film;
+----------+
| COUNT(*) |
+----------+
|     1000 |
+----------+
1 row in set (0.00 sec)
{% endhighlight %}

or to be more descriptive...
note: aliases with spaces need quotes :)

{% highlight sql %}
mysql> SELECT COUNT(*) AS 'film count' FROM film;
+------------+
| film count |
+------------+
|       1000 |
+------------+
1 row in set (0.00 sec)
{% endhighlight %}

#### c) counting columns

Note quite so simple :wink:. Found a viable solution [here](http://stackoverflow.com/questions/10492164/how-do-i-count-columns-of-a-table). **Note:** This solution requires some understanding of the **```information-schema```** [meta database](https://dev.mysql.com/doc/refman/5.7/en/information-schema.html) ([here](https://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html) for the innodb engine implementation).

{% highlight sql %}
-- vote aliases for cleaner results!
mysql> SELECT count(*) AS 'column count'
    -> FROM information_schema.columns
    -> WHERE table_schema = 'sakila'
    -> AND table_name = 'film';
+--------------+
| column count |
+--------------+
|           13 |
+--------------+
1 row in set (0.00 sec)
{% endhighlight %}

#### d) Making head and tail

This emulates the **```head()```** and **```tail()```** commands that I use in [R](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/head.html) or at the shell ([head](https://en.wikipedia.org/wiki/Head_(Unix)) or [tail](https://en.wikipedia.org/wiki/Tail_(Unix))) to display the first (top) or last (bottom) **n** entries (5 in this case) of a table.

##### i) head

Getting the first **n** entries is pretty simple:

{% highlight sql%}
mysql> select * from film limit 5;
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
|       5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                   | 2006-02-15 05:03:42 |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
5 rows in set (0.00 sec)
{% endhighlight %}

Naturally, you can also select a subset of the columns to view, ordered as per the select statement:

{% highlight sql%}
-- note compare with previous statement to checkout the change in column order :)
mysql> SELECT film_id, title, release_year, length, rental_rate, rating FROM film LIMIT 5;
+---------+------------------+--------------+--------+-------------+--------+
| film_id | title            | release_year | length | rental_rate | rating |
+---------+------------------+--------------+--------+-------------+--------+
|       1 | ACADEMY DINOSAUR |         2006 |     86 |        0.99 | PG     |
|       2 | ACE GOLDFINGER   |         2006 |     48 |        4.99 | G      |
|       3 | ADAPTATION HOLES |         2006 |     50 |        2.99 | NC-17  |
|       4 | AFFAIR PREJUDICE |         2006 |    117 |        2.99 | G      |
|       5 | AFRICAN EGG      |         2006 |    130 |        2.99 | G      |
+---------+------------------+--------------+--------+-------------+--------+
5 rows in set (0.00 sec)
{% endhighlight %}

##### ii) tail

Getting the last **n** entries (5 in this case) in a table. This isn't quite as simple as selecting the first entries. The best way to achieve this seems to involve the use of [sub queries](http://stackoverflow.com/questions/12125904/) (ee [here](http://stackoverflow.com/questions/118144/) also). There seems to be a solution for tables lacking an **id** column [here](http://stackoverflow.com/questions/3779180/), which was adapted from another situation (possibly of interest to look into later). However, the impression that I get is that attempting this procedure (tail) on tables without unique **id** columns is fraught with peril.

For this example, I am selecting only the first 2 columns, **```film_id```** and **```title```**, in the outer **```SELECT```** statement for clarity, but this naturally works when including all columns (**```*```**).

{% highlight sql%}
mysql> SELECT film_id, title 
    -> FROM ( 
    ->     SELECT * FROM film 
    ->     ORDER BY film_id DESC LIMIT 5 
    -> ) subQuery;
+---------+-------------------+
| film_id | title             |
+---------+-------------------+
|    1000 | ZORRO ARK         |
|     999 | ZOOLANDER FICTION |
|     998 | ZHIVAGO CORE      |
|     997 | YOUTH KICK        |
|     996 | YOUNG LANGUAGE    |
+---------+-------------------+
5 rows in set (0.00 sec)
{% endhighlight %}

reorder them to look like a [bona fide](https://en.wikipedia.org/wiki/Good_faith) **```tail()```** result :wink:

{% highlight sql%}
mysql> SELECT film_id, title 
    -> FROM ( 
    ->     SELECT * FROM film 
    ->     ORDER BY film_id DESC LIMIT 5 
    -> ) subQuery ORDER BY film_id;        
+---------+-------------------+
| film_id | title             |
+---------+-------------------+
|     996 | YOUNG LANGUAGE    |
|     997 | YOUTH KICK        |
|     998 | ZHIVAGO CORE      |
|     999 | ZOOLANDER FICTION |
|    1000 | ZORRO ARK         |
+---------+-------------------+
5 rows in set (0.00 sec)
{% endhighlight %}

#### Aliases

Previous sections focusing on [counting rows](#b-counting-rows), [counting columns](#c-counting-columns) and [tail](#ii-tail) made use of [aliases](http://www.w3schools.com/sql/sql_alias.asp). The MySQL docs have some interesting notes on [alias usage](https://dev.mysql.com/doc/refman/5.7/en/problems-with-alias.html) logic and restrictions, which might come in handy when I next come unstuck.

<b style="color:red;">Note:</b> Sub queries, in the **```FROM```** clause, require an alias (in this case **```subQuery```**) to execute without error:

{% highlight sql%}
/* i.e. this query will no't work */
mysql> SELECT film_id, title 
    -> FROM (
    ->     SELECT * FROM film 
    ->     ORDER BY film_id DESC LIMIT 5
    -> );
ERROR 1248 (42000): Every derived table must have its own alias

-- but this will (explicit alias)
mysql> SELECT film_id, title 
    -> FROM (
    ->     SELECT * FROM film 
    ->     ORDER BY film_id DESC LIMIT 5
    -> ) AS subQuery;

-- as will this (implicit alias)
mysql> SELECT film_id, title 
    -> FROM (
    ->     SELECT * FROM film 
    ->     ORDER BY film_id DESC LIMIT 5
    -> ) subQuery;
{% endhighlight %}

## Conclusion

In this section, we have established some good tools to get a feel for the contents of a database. In the next tutorial we will try a different way to summarise this database :smile:.

## Resource list

* [MySQL docs](http://dev.mysql.com/doc/refman/5.7/en/examples.html) examples

* [w3schools](http://www.w3schools.com/sql/) tutorial

* [tutorialspoint MySQL](http://www.tutorialspoint.com/mysql/) tutorial

* [tutorialspoint SQL](http://www.tutorialspoint.com/sql/) tutorial

* Sakila [usage examples](http://dev.mysql.com/doc/sakila/en/sakila-usage.html).