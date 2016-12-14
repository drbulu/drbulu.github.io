---
layout: post
title: MySQL - Basic Tutorial 3
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

... the exploration continues :wink:!

## Introduction

http://articles.latimes.com/1986-05-08/news/vw-4487_1_square-root

## Data Exploration:

... back to our [intrepid explorer]( {{ site.baseurl }}{% post_url 2016-12-07-mysql-intro-part4_basic_tutorial1 %}#setup-tutorial-user )

{% highlight shell %}
# localhost connection
shell> mysql -u sophieG -p sakila
Enter password: **********
{% endhighlight %}

a lot of these solutions require some understanding of this table:
https://dev.mysql.com/doc/refman/5.7/en/information-schema.html
https://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html

#### Show a tidy list of all the tables in the database

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

#### Table row length summary -
http://stackoverflow.com/questions/2692340/

kind of useful, but due to accuracy issues, some tables are estimated to have
NULL rows, 
see [here](http://stackoverflow.com/questions/10912693/exact-count-of-all-rows-in-mysql-database) for a possible solution (I haven't tried it yet so... "caveat emptor!"). The point being that there seems to be no simple **and** accurate solution to this in a single query. even using [```show table status```](https://dev.mysql.com/doc/refman/5.7/en/show-table-status.html) doesn't help accuracy using the default mysql database engine :(


{% highlight sql %}

{% endhighlight %}

SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila';

#### Table column summary

##### i) list all the column names for each table in the chosen database
SELECT table_name, column_name 
FROM information_schema.columns 
WHERE table_schema = 'sakila';

{% highlight sql %}

{% endhighlight %}


##### ii) AGGREGATE column count for each table in the chosen database

some help from: https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html

SELECT table_name, count(column_name) 
FROM information_schema.columns 
WHERE table_schema = 'sakila' 
GROUP BY table_name ;

{% highlight sql %}

{% endhighlight %}


#### Table ROW and COLUMN summaries

## store as temporary tables

CREATE TEMPORARY TABLE sakila_row_counts AS
SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila'; 

{% highlight sql %}

{% endhighlight %}


Note: modified the select statement to rename the column to summaris table column counts to something more useful as shown [here](http://stackoverflow.com/questions/12053327/renaming-columns-in-an-sql-select-statement#12053349) (an interesting discussion [here](stackoverflow.com/questions/12053327/#12053349)):

CREATE TEMPORARY TABLE sakila_col_counts AS
SELECT table_name, count(column_name) AS TABLE_COLS
FROM information_schema.columns 
WHERE table_schema = 'sakila' 
GROUP BY table_name ;

{% highlight sql %}

{% endhighlight %}


The basic syntax [here](https://www.tutorialspoint.com/sql/sql-using-joins.htm) will do nicely :smile:!

{% highlight sql %}

{% endhighlight %}


SELECT sakila_row_counts.*, sakila_col_counts.table_cols
FROM sakila_row_counts, sakila_col_counts
WHERE sakila_row_counts.table_name = sakila_col_counts.table_name;

or to use the [inner join](https://www.tutorialspoint.com/sql/sql-inner-joins.htm) syntax:


{% highlight sql %}

{% endhighlight %}

SELECT sakila_row_counts.*, table_cols
FROM sakila_row_counts
INNER JOIN sakila_col_counts
ON sakila_row_counts.table_name = sakila_col_counts.table_name;

### Summarising individual tables

using the film table as an example...

#### For a given table
### a) Describe table

{% highlight sql %}

{% endhighlight %}

DESC film;

### b) count columns
http://stackoverflow.com/questions/10492164/how-do-i-count-columns-of-a-table

{% highlight sql %}

{% endhighlight %}

SELECT count(*)
FROM information_schema.columns
WHERE table_schema = 'sakila'
AND table_name = 'film';

## c) count rows

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


the long way.. as above, not guaranteed to return a result.

{% highlight sql %}
mysql> SELECT TABLE_NAME, TABLE_ROWS 
    -> FROM `information_schema`.`tables` 
    -> WHERE `table_schema` = 'sakila' AND table_name = 'film';
{% endhighlight %}

## Head and tail

### head

Example query

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

{% highlight sql%}
# note compare with previous statement to checkout the change in column order :)
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

### tail

http://stackoverflow.com/questions/118144/
http://stackoverflow.com/questions/12125904/

Not great without an ID: http://stackoverflow.com/questions/3779180/

## Sorting rows

http://dev.mysql.com/doc/refman/5.7/en/sorting-rows.html


## Views

This is important to work through, to see what it can do for you, and how it can help you with data import into data analyis environments such as R.



### Analytics 
A primer on MySQL use for analytics

Analytics functions: http://stackoverflow.com/questions/11806528/

cumulative sum column: stackoverflow.com/questions/2563918/2563940#2563940




## Conclusion

Stored procedures vs. functions http://stackoverflow.com/questions/3744209/
(another reason why I want to use MySQL, but )

http://dev.mysql.com/doc/refman/5.7/en/stored-program-restrictions.html

## Resource list

* [MySQL docs](http://dev.mysql.com/doc/refman/5.7/en/examples.html) examples

* [w3schools](http://www.w3schools.com/sql/) tutorial

* [tutorialspoint MySQL](http://www.tutorialspoint.com/mysql/) tutorial

* [tutorialspoint SQL](http://www.tutorialspoint.com/sql/) tutorial

* Sakila [usage examples](http://dev.mysql.com/doc/sakila/en/sakila-usage.html).