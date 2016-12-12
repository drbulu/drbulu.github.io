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

### Database summary:

... back to our intrepid explorer

a lot of these solutions require some understanding of this table:
https://dev.mysql.com/doc/refman/5.7/en/innodb-information-schema.html

#### Show a tidy list of all the tables in the database
SHOW TABLES;


#### Table length summary -
http://stackoverflow.com/questions/2692340/

kind of useful, but due to accuracy issues, some tables are estimated to have
NULL rows, 
see [here](http://stackoverflow.com/questions/10912693/exact-count-of-all-rows-in-mysql-database) for a possible solution (I haven't tried it yet so... "caveat emptor!"). The point being that there seems to be no simple **and** accurate solution to this in a single query. even using [```show table status```](https://dev.mysql.com/doc/refman/5.7/en/show-table-status.html) doesn't help accuracy using the default mysql database engine :(

SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila';

#### Table column summary

##### i) list all the column names for each table in the chosen database
SELECT table_name, column_name 
FROM information_schema.columns 
WHERE table_schema = 'sakila';

##### ii) AGGREGATE column count for each table in the chosen database

some help from: https://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html

SELECT table_name, count(column_name) 
FROM information_schema.columns 
WHERE table_schema = 'sakila' 
GROUP BY table_name ;

#### Table ROW and COLUMN summaries

## store as temporary tables

CREATE TEMPORARY TABLE sakila_row_counts AS
SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila'; 

Note: modified the select statement to rename the column to summaris table column counts to something more useful as shown [here](http://stackoverflow.com/questions/12053327/renaming-columns-in-an-sql-select-statement#12053349) (an interesting discussion [here](stackoverflow.com/questions/12053327/#12053349)):

CREATE TEMPORARY TABLE sakila_col_counts AS
SELECT table_name, count(column_name) AS TABLE_COLS
FROM information_schema.columns 
WHERE table_schema = 'sakila' 
GROUP BY table_name ;


The basic syntax [here](https://www.tutorialspoint.com/sql/sql-using-joins.htm) will do nicely :smile:!

SELECT sakila_row_counts.*, sakila_col_counts.table_cols
FROM sakila_row_counts, sakila_col_counts
WHERE sakila_row_counts.table_name = sakila_col_counts.table_name;

or to use the [inner join](https://www.tutorialspoint.com/sql/sql-inner-joins.htm) syntax:

SELECT sakila_row_counts.*, table_cols
FROM sakila_row_counts
INNER JOIN sakila_col_counts
ON sakila_row_counts.table_name = sakila_col_counts.table_name;

### Summarising individual tables

using the film table as an example...

#### For a given table
### a) Describe table

DESC film;

### b) count columns
http://stackoverflow.com/questions/10492164/how-do-i-count-columns-of-a-table

SELECT count(*)
FROM information_schema.columns
WHERE table_schema = 'sakila'
AND table_name = 'film';

## c) count rows
SELECT COUNT(*) FROM table_name

the long way.. as above, not guaranteed to return a result.

SELECT TABLE_NAME, TABLE_ROWS 
FROM `information_schema`.`tables` 
WHERE `table_schema` = 'sakila' AND table_name = 'film';

## Head and tail

### head

Example query

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