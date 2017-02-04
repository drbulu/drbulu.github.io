---
layout: post
title: MySQL - Basic Tutorial 4 - Better title!
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

... the exploration continues :wink:!

## Introduction

### Background:
In the [previous post]({{ site.baseurl }}{% post_url 2016-12-18-mysql-intro-part6_basic_tutorial3 %})


### Aim:



### The problem:

## Pieces of the puzzle

Routines (Procedures and Functions)

The [background](http://dev.mysql.com/doc/refman/5.7/en/stored-routines.html)

includes a section for [creating and managing](http://dev.mysql.com/doc/refman/5.7/en/stored-routines-syntax.html) these routines [Procedures](http://dev.mysql.com/doc/refman/5.7/en/create-procedure.html) and [Functions](http://dev.mysql.com/doc/refman/5.7/en/create-function.html)

* Procedures

Basic example:

{% highlight sql %}
/* create simple procesure GET_FILM_SNAPSHOT */
CREATE PROCEDURE GET_FILM_SNAPSHOT ()
BEGIN
    SELECT film_id, title FROM film;
END

/* when procedure no longer needed */
DROP PROCEDURE GET_FILM_SNAPSHOT;
{% endhighlight %}

However, when feeding from commandline, we need to change the delimeter temporarily during procedure definition so that semecolons (*`;`*) are _not_ processed during function definition. 

{% highlight sql %}

delimiter //

CREATE PROCEDURE GET_FILM_SNAPSHOT ()
    BEGIN
        SELECT film_id, title FROM film LIMIT 5;
    END
// -- easier to put temporary delimeter here!

delimiter ;

{% endhighlight %}

next!


### More suff

[variables](http://dev.mysql.com/doc/refman/5.7/en/stored-program-variables.html)

http://dev.mysql.com/doc/refman/5.7/en/set-variable.html (also how to do the next step!)

http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html

{% highlight sql %}

delimiter //
CREATE PROCEDURE HEAD_TABLE (tableName VARCHAR(50))
BEGIN
    SELECT CONCAT('SELECT * FROM ', tableName, ' LIMIT 5');
END
//
delimiter ;

DROP PROCEDURE HEAD_TABLE;

{% endhighlight %}


### Copy! THIS WORKS

<b style="color:red;">NOTE:</b> rename to just HEAD, and also create DIM?

http://dev.mysql.com/doc/refman/5.7/en/stored-programs-defining.html

https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_concat

leaning on [prepared statements](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html)

{% highlight sql %}
/* design create the procedure on the server via the client */
delimiter //
CREATE PROCEDURE HEAD_TABLE (tableName VARCHAR(50))
BEGIN
    SET @statementVar = CONCAT('SELECT * FROM ', tableName, ' LIMIT 5');

    PREPARE headStatement FROM @statementVar;
    EXECUTE headStatement;
    DEALLOCATE PREPARE headStatement;
END
//
delimiter ;

/* create the procedure on the server via the client */
mysql> delimiter //
mysql> CREATE PROCEDURE HEAD_TABLE (tableName VARCHAR(50))
    -> BEGIN
    ->     SET @statementVar = CONCAT('SELECT * FROM ', tableName, ' LIMIT 5');
    -> 
    ->     PREPARE headStatement FROM @statementVar;
    ->     EXECUTE headStatement;
    ->     DEALLOCATE PREPARE headStatement;
    -> END
    -> //
Query OK, 0 rows affected (0.00 sec)

mysql> delimiter ;

/* call the procedure */
mysql> CALL HEAD_TABLE('city');
+---------+--------------------+------------+---------------------+
| city_id | city               | country_id | last_update         |
+---------+--------------------+------------+---------------------+
|       1 | A Corua (La Corua) |         87 | 2006-02-15 04:45:25 |
|       2 | Abha               |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi          |        101 | 2006-02-15 04:45:25 |
|       4 | Acua               |         60 | 2006-02-15 04:45:25 |
|       5 | Adana              |         97 | 2006-02-15 04:45:25 |
+---------+--------------------+------------+---------------------+
5 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL HEAD_TABLE('language');
+-------------+----------+---------------------+
| language_id | name     | last_update         |
+-------------+----------+---------------------+
|           1 | English  | 2006-02-15 05:02:19 |
|           2 | Italian  | 2006-02-15 05:02:19 |
|           3 | Japanese | 2006-02-15 05:02:19 |
|           4 | Mandarin | 2006-02-15 05:02:19 |
|           5 | French   | 2006-02-15 05:02:19 |
+-------------+----------+---------------------+
5 rows in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> SELECT count(*) AS 'lang summary' FROM language;
+--------------+
| lang summary |
+--------------+
|            6 |
+--------------+
1 row in set (0.00 sec)

{% endhighlight %}


### Next step
* Functions

* Procedures vs. Functions

* Variables

[data types](http://dev.mysql.com/doc/refman/5.7/en/data-types.html)

## Summarise all the columns



## Conclusion


