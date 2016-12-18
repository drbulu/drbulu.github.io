---
layout: post
title: MySQL - Basic Tutorial 3 - Summarise ALL the things!
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

... the exploration continues :wink:!

## Introduction

### Background:
In the [previous post]({{ site.baseurl }}{% post_url 2016-12-16-mysql-intro-part5_basic_tutorial2 %}) of this series, we looked into summarising information about a database to enable us to subsequently utilise its contents. How can you use what you cannot see or understand?

### Aim:
THe question of the day is how to get an idea of the size of a database? Specifically, how do we efficiently get a summary of the size (rows and columns) of all tables in a database?

### The problem:
Previously, we used **```SHOW TABLES```** to summarise all the _names_ of a database's tables in a single call (instruction/statement). However, we were only able to obtain row and column counts separately for one table at a time. This isn't much of a problem for very small databases, however, for large databases, this seems to be extremely tedious (and unproductive). The sakila database consists of 23 tables, as we discovered in our [previous exploration]({{ site.baseurl }}{% post_url 2016-12-16-mysql-intro-part5_basic_tutorial2 %}#show-a-tidy-list-of-all-the-tables-in-the-database), therefore, we need a more efficient solution!

## Summarise all the columns

This solution is fairly simple, and has its origins in our previous [column counting]({{ site.baseurl }}{% post_url 2016-12-16-mysql-intro-part5_basic_tutorial2 %}#c-counting-columns) example, but we are going to.

* i) retrieve more specific information: table _names_ and _columns_.

* ii) reduce instruction specificity by removing this statement from the **```WHERE```** clause:

{% highlight sql %}
AND table_name = 'film';
{% endhighlight %}

Let's see what this looks like...

### i) table column list

When we do this, the resulting statement below simply produces a table that lists the names of the tables against the corresponding column names. This is close, but at 132 entries... not the summary we are looking for!

{% highlight sql %}
mysql> SELECT table_name, column_name 
    -> FROM information_schema.columns 
    -> WHERE table_schema = 'sakila';
+----------------------------+----------------------+
| table_name                 | column_name          |
+----------------------------+----------------------+
| actor                      | actor_id             |
| actor                      | first_name           |
| actor                      | last_name            |
| actor                      | last_update          |
| actor_info                 | actor_id             |
| actor_info                 | first_name           |
| actor_info                 | last_name            |
| actor_info                 | film_info            |
| address                    | address_id           |
| address                    | address              |
+----------------------------+----------------------+
132 rows in set (0.00 sec)
-- note: the remaining 122 columns are not shown from brevity
{% endhighlight %}


### ii) table column count

In order to achieve our desired end, we need a little help from [aggregation functions](https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html) in conjunction with the **``GROUP BY```** clause.

For the record, this will not work:

{% highlight sql %}
mysql> SELECT table_name, count(column_name) 
    -> FROM information_schema.columns 
    -> WHERE table_schema = 'sakila';
ERROR 1140 (42000): In aggregated query without GROUP BY, 
expression #1 of SELECT list contains nonaggregated column
'information_schema.columns.TABLE_NAME'; this is incompatible
with sql_mode=only_full_group_by
/* NOTE: Error output wrapped for convenience */
{% endhighlight %}

However... THIS is what we were searching for:

{% highlight sql %}
mysql> SELECT table_name, count(column_name) 
    -> FROM information_schema.columns 
    -> WHERE table_schema = 'sakila' 
    -> GROUP BY table_name;
+----------------------------+--------------------+
| table_name                 | count(column_name) |
+----------------------------+--------------------+
| actor                      |                  4 |
| actor_info                 |                  4 |
| address                    |                  9 |
| category                   |                  3 |
| city                       |                  4 |
| country                    |                  3 |
| customer                   |                  9 |
| customer_list              |                  9 |
| film                       |                 13 |
| film_actor                 |                  3 |
| film_category              |                  3 |
| film_list                  |                  8 |
| film_text                  |                  3 |
| inventory                  |                  4 |
| language                   |                  3 |
| nicer_but_slower_film_list |                  8 |
| payment                    |                  7 |
| rental                     |                  7 |
| sales_by_film_category     |                  2 |
| sales_by_store             |                  3 |
| staff                      |                 11 |
| staff_list                 |                  8 |
| store                      |                  4 |
+----------------------------+--------------------+
23 rows in set (0.00 sec)

{% endhighlight %}

## Summarise all the rows
As with the [previous section](#summarise-all-the-columns) above, we need to rely upon the **```information_schema```** database to retrieve the information that we need. As always, I am grateful for the revelation provided by StackOverflow, specifically [here](http://stackoverflow.com/questions/2692340/). 

<b style="color:red;">Note:</b> The syntax below uses backticks (**&#96;**) in the **```FROM```** clause, but refers to the same table as that used for the column queries above. Variety is, after all, the spice of life!

{% highlight sql %}
mysql> SELECT TABLE_NAME, TABLE_ROWS 
    -> FROM `information_schema`.`tables` 
    -> WHERE `table_schema` = 'sakila';
+----------------------------+------------+
| TABLE_NAME                 | TABLE_ROWS |
+----------------------------+------------+
| actor                      |        200 |
| actor_info                 |       NULL |
| address                    |        603 |
| category                   |         16 |
| city                       |        600 |
| country                    |        109 |
| customer                   |        599 |
| customer_list              |       NULL |
| film                       |       1000 |
| film_actor                 |       5462 |
| film_category              |       1000 |
| film_list                  |       NULL |
| film_text                  |       1000 |
| inventory                  |       4581 |
| language                   |          6 |
| nicer_but_slower_film_list |       NULL |
| payment                    |      16086 |
| rental                     |      16005 |
| sales_by_film_category     |       NULL |
| sales_by_store             |       NULL |
| staff                      |          2 |
| staff_list                 |       NULL |
| store                      |          2 |
+----------------------------+------------+
23 rows in set (0.00 sec)
{% endhighlight %}

This is a very good result, we get a summary of the number of rows in **most** of the tables. Most? Yes, apparently there is some accuracy issue that results in some tables being estimated to have **```NULL```** rows. See [here](http://stackoverflow.com/questions/10912693/exact-count-of-all-rows-in-mysql-database) for a possible solution (I haven't tried it yet so... "caveat emptor!"). The point being that there seems to be no simple **and** accurate solution to this in a single query. even using [```show table status```](https://dev.mysql.com/doc/refman/5.7/en/show-table-status.html) doesn't help accuracy using the default [innoDB](https://dev.mysql.com/doc/refman/5.7/en/innodb-storage-engine.html) MySQL database engine :disappointed:!

That said, we are doing pretty well so far :smile:!

## Putting it all together

### Strategy: Temporary tables

From what I have been able to gather, the best solution is to create a [temporary table](https://dev.mysql.com/doc/refman/5.7/en/create-table.html) to which the results of our query are assigned via the **`AS`** keyword: 

{% highlight sql %}
CREATE TEMPORARY TABLE sakila_row_counts AS 
/* QUERY used to populate created table! */
{% endhighlight %}

There is an interesting discussion [here](http://dba.stackexchange.com/questions/3479/store-result-set-in-temporary-table-variable-or-separate-variables-within-a-tri) about potential pitfalls of temporary tables. Temporary tables are fit for our purpose, given that we don't want to "pollute" the "data space"" by creating unecessary tables, however, it is good to be aware of potential problems that this might cause. Alternatively, one could always **```CREATE```** and subsequently **`DROP`** these tables if need be.

For our purppses, these are the **`CREATE TABLE`** that we will use:

* To count the **rows**:

{% highlight sql %}
CREATE TEMPORARY TABLE sakila_row_counts AS
SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila'; 
{% endhighlight %}

* To count the **columns**:

{% highlight sql %}
CREATE TEMPORARY TABLE sakila_col_counts AS
SELECT table_name, count(column_name) AS TABLE_COLS
FROM information_schema.columns 
WHERE table_schema = 'sakila' 
GROUP BY table_name;
{% endhighlight %}


* Tada! :sunglasses:

{% highlight sql %}
mysql> CREATE TEMPORARY TABLE sakila_row_counts AS
    -> SELECT TABLE_NAME, TABLE_ROWS 
    -> FROM `information_schema`.`tables` 
    -> WHERE `table_schema` = 'sakila'; 
Query OK, 23 rows affected (0.02 sec)
Records: 23  Duplicates: 0  Warnings: 0

mysql> CREATE TEMPORARY TABLE sakila_col_counts AS
    -> SELECT table_name, count(column_name) AS TABLE_COLS
    -> FROM information_schema.columns 
    -> WHERE table_schema = 'sakila' 
    -> GROUP BY table_name;
Query OK, 23 rows affected (0.01 sec)
Records: 23  Duplicates: 0  Warnings: 0
{% endhighlight %}

<b style="color:red;">Note:</b> The contents of these tables are as displayed previously for queries the corresponding sections :smile:.

### Joined: The cohesive picture 

The last step in this process is, naturally, to join (i.e. [merge](http://www.cookbook-r.com/Manipulating_data/Merging_data_frames/) :wink:) the temporary tables that we have crated together to form a coherent, approximate, picture of our database. (Approximate due to the row count accuracy limitations of our chosen method). 

* This basic syntax [here](https://www.tutorialspoint.com/sql/sql-using-joins.htm) will do nicely :smile:!:

{% highlight sql %}
SELECT sakila_row_counts.*, sakila_col_counts.table_cols
FROM sakila_row_counts, sakila_col_counts
WHERE sakila_row_counts.table_name = sakila_col_counts.table_name;
{% endhighlight %}

* or to use the (probably more correct) [inner join](https://www.tutorialspoint.com/sql/sql-inner-joins.htm) syntax :sunglasses::

{% highlight sql %}
SELECT sakila_row_counts.*, TABLE_COLS
FROM sakila_row_counts
INNER JOIN sakila_col_counts
ON sakila_row_counts.table_name = sakila_col_counts.table_name;
{% endhighlight %}

The final output of this process (using either join syntax above) is: 

{% highlight sql %}
mysql> SELECT sakila_row_counts.*, TABLE_COLS
    -> FROM sakila_row_counts
    -> INNER JOIN sakila_col_counts
    -> ON sakila_row_counts.table_name = sakila_col_counts.table_name;
+----------------------------+------------+------------+
| TABLE_NAME                 | TABLE_ROWS | TABLE_COLS |
+----------------------------+------------+------------+
| actor                      |        200 |          4 |
| actor_info                 |       NULL |          4 |
| address                    |        603 |          9 |
| category                   |         16 |          3 |
| city                       |        600 |          4 |
| country                    |        109 |          3 |
| customer                   |        599 |          9 |
| customer_list              |       NULL |          9 |
| film                       |       1000 |         13 |
| film_actor                 |       5462 |          3 |
| film_category              |       1000 |          3 |
| film_list                  |       NULL |          8 |
| film_text                  |       1000 |          3 |
| inventory                  |       4581 |          4 |
| language                   |          6 |          3 |
| nicer_but_slower_film_list |       NULL |          8 |
| payment                    |      16086 |          7 |
| rental                     |      16005 |          7 |
| sales_by_film_category     |       NULL |          2 |
| sales_by_store             |       NULL |          3 |
| staff                      |          2 |         11 |
| staff_list                 |       NULL |          8 |
| store                      |          2 |          4 |
+----------------------------+------------+------------+
23 rows in set (0.00 sec)
{% endhighlight %}

Naturally, you can prefix this query with the **`CREATE TABLE`** syntax as outlined in this [strategy](#strategy--temporary-tables) to store the results as a database table.

Side note: if you write "TABLE_COLS" as "table_cols", that is how it will appear in the result... FYI :wink:. Importantly, we selected all the columns from the **`sakila_row_counts`** and only the **`TABLE_COLS`** column from **`sakila_col_counts`** as this shares the **`TABLE_NAME`**, which would be repeated if all columns from _both_ tables were selected :smile:!

## Conclusion
Today, we have come very close to achieving our simple goal of capturing a simple snapshot of our database of interest. However, **7** of the **23** tables (~30 %) of the **`sakila`** database have NULL rows (i.e. whose size is partially hidden from us). I am curently looking for a good solution for this, which I hope to cover in later posts. For now, however, we rest (tenuously) upon our laurels, having effectively created for ourselves... 

>SHOW TABLES <b style="color:red;">PLUS :wink:

