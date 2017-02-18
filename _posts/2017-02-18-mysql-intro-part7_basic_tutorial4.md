---
layout: post
title: MySQL - Basic Tutorial 4 - SHOW TABLES becomes DB_SNAPSHOT
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

## Introduction

Building on previous success in order to solve the problem completely.

In the [previous post]({{ site.baseurl }}{% post_url 2016-12-18-mysql-intro-part6_basic_tutorial3 %}) we succeeded, partially, in the creation of code to summarise the basic characteristics of all tables (row and column count) in a given database. **SHOW TABLES PLUS**.

## Solution strategy

I watched [the Martian](http://www.imdb.com/title/tt3659388/) a little while back and found it to be interesting and quite entertaining. However, one concept that stood (and still stands) out to me is the following concept:

> <b style="color:red; font-size:300%;">"Work the problem"</b>

The idea resonated with me simply because I have realised that it is not enough to throw oneself **hard** at a problem and expect success. Repetition is not <i>the</i> key to success, though it is an important one. The superior approach is to premediate a solution and to constantly learn during the problem solving process. This allows one to throw themselves hard at a problem in an organised and thoughtful way, willing to modify the approach through lessons learnt from failure. On this topic, I recently stumbled across an interesting [blog post](https://www.linkedin.com/pulse/lets-work-problem-lessons-learned-from-blockbuster-aganaba-jeanty) which discussed this concept. One obsevation that I found profound was the way that astronauts apparently (I've never been one) use failure as a tool to motivate themselves to success by "sweating the small stuff".

With this in mind, I went to the drawing board (after much guessing) and thought through the process of what I wanted this procedure to achieve. From this pondering, I devised the following outline:

1. Create temporary table:
* from column count table
* first delete if exists?

2. Alter table: --> add TABLE_ROWS column, and ID col
3. Update TABLE_ROWS col via Loop through TABLE_NAMES col
* a) Select ta le name from temporary table's name col
* b) Calculate row counts and select into local variable
* c) Update table using selected table name and calculated values.

4. END of PROCEDURE
* either as is
* or with select statement formatted to desired view :smile:

## Background preparation

### Required concepts

With this plan in mind, I was empowered to direct my research towards understanding the concepts that I would need to imlement the solution. One obvious topic to understand was how [control flow](http://dev.mysql.com/doc/refman/5.7/en/flow-control-statements.html) statements work in MySQL, including [loops](http://dev.mysql.com/doc/refman/5.7/en/loop.html). These statements are types of [compound statements](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-compound-statements.html) that are typically encased within [BEGIN ... END](http://dev.mysql.com/doc/refman/5.7/en/begin-end.html) block statements often required for the definition of complex [functions and procedures](https://dev.mysql.com/doc/refman/5.7/en/create-procedure.html). The is more information about these entities [here](https://dev.mysql.com/doc/refman/5.7/en/stored-routines.html). After some thought, I opted to implement the **SHOW TABLES PLUS** idea as a procedure rather than a function, simply because functions seem to have [more restrictions](https://dev.mysql.com/doc/refman/5.7/en/stored-program-restrictions.html) placed on their use. Related to this, I realised that [statement labelling](http://dev.mysql.com/doc/refman/5.7/en/statement-labels.html) was quite useful to facilitate code organisation.

Another important set of concepts that we would need to grasp pertained to data manipulation statemens including: [select into](http://dev.mysql.com/doc/refman/5.7/en/select-into.html), [alter_table](http://dev.mysql.com/doc/refman/5.7/en/alter-table.html), and [update_table](http://dev.mysql.com/doc/refman/5.7/en/update.html).

Variables also seemed a natural topic to grasp as well, given their utility in functions and procedures. [local](http://dev.mysql.com/doc/refman/5.7/en/local-variable-scope.html), [user](https://dev.mysql.com/doc/refman/5.7/en/user-variables.html), and [system](https://dev.mysql.com/doc/refman/5.7/en/using-system-variables.html). Very helpful discussion [here](http://stackoverflow.com/questions/1009954/mysql-variable-vs-variable-whats-the-difference#1010042).

One of the last things that I needed to get my head around was the use of [prepared statements](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html). I though that I could simplify things with local variables, however, it turned out that I needed [user](https://dev.mysql.com/doc/refman/5.7/en/user-variables.html). The other useful aspect of prepared statements is that they are a form of input validation prior to statement preparation and excecution. One of the things that lead me to this course was the trouble that I had attempting to use local variables **after** the FROM clause. My change of tack appeared to be [validated](http://lists.mysql.com/mysql/207736).

### Testing...

In order to put together the concepts described above I created another useful summary prodecure, **HEAD_TABLE**, which is a basic implementation of the highly useful **head** function. One useful revelation from this exercise was the realisation that I needed to use [concat](https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_concat) to construct a single sql statement from multiple components.

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
{% endhighlight %}

And the results are quite useful :smile:

{% highlight sql %}
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
5 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

{% endhighlight %}

This good practice gave me confidence to tackle the potentially more complex challenge of implementing **SHOW TABLES PLUS**. Further refinements can most certainly be made, most obviously the addition of a second argument **nrow** to define the number of rows to return. Further, I could also implement **tail**, another similarly useful functionality. However, this test served its purpose to prepare me for my next challenge, also, head and tail should be fairly simple imlement, for example:

{% highlight sql %}
mysql> SELECT * FROM language LIMIT 5;
{% endhighlight %}

## Implemented solution

After this successful test, I embarked upon the full **SHOW TABLES PLUS** implementation. I borrowed a lot from the [cursors](http://dev.mysql.com/doc/refman/5.7/en/cursors.html) tutorial procedure code, as it seemed like a good structured place to start. However, I wanted to keep the concept relatively simple, so I used the loop construct instead of cursors. However, without cursors, I needed an auto-incrementing **ID** column, implemented as a primary key to facilitate iteration through the table in the loop called **value_insert_loop**. I found this to be quite useful to provide me with [auto-increment help](http://stackoverflow.com/questions/14753321/add-auto-increment-id-to-existing-table#14753520), since I wanted to add this column <i>after</i> already creating the temporary table.

Below is the completed **SHOW TABLES PLUS** implementation, named <b style="color:red">DB_SNAPSHOT</b> (since that is what it effectively achieves):

{% highlight sql %}
delimiter //
CREATE PROCEDURE DB_SNAPSHOT (databaseName VARCHAR(50))
procedure_body: BEGIN
            
    /* STEP 1: temporary table pre-cleanup */
    DROP TABLE IF EXISTS temp_db_snapshot;
    
    /* STEP 2: temporary table creation */    
    Create TEMPORARY TABLE temp_db_snapshot AS
    SELECT table_name, count(column_name) AS COL_COUNT
    FROM information_schema.columns 
    WHERE table_schema = databaseName 
    GROUP BY table_name;  
    
    /* Update table via alter table: 
    simplifies loop iteration logic :) */
    ALTER TABLE temp_db_snapshot 
    ADD ID INT NOT NULL AUTO_INCREMENT 
    PRIMARY KEY first;
    
    ALTER TABLE temp_db_snapshot
    ADD COLUMN ROW_COUNT INT 
    AFTER TABLE_NAME;
        
    /* STEP 3: temporary table creation */
    populate_table: BEGIN
        DECLARE temp_row_count INT;
        DECLARE loop_counter INT;
        DECLARE current_table VARCHAR(100);
        DECLARE row_calc INT;
        DECLARE row_sum_string VARCHAR(250);
        
        SELECT COUNT(*) INTO temp_row_count FROM temp_db_snapshot;
        
        SET loop_counter = 1;
        value_insert_loop: LOOP
            SELECT table_name INTO current_table FROM temp_db_snapshot
            WHERE ID = loop_counter;
            
            -- solution to variable use in FROM clause
            -- gotta love prepared statements FTW!
            SET @row_calc = 0;            
            SET @statementString = CONCAT('SELECT COUNT(*) INTO @row_calc FROM ',
            databaseName, '.', current_table );
            
            PREPARE sum_call FROM @statementString;
            EXECUTE sum_call;
            DEALLOCATE PREPARE sum_call;
            
            -- update temp table using "row_calc" s
            UPDATE temp_db_snapshot 
            SET ROW_COUNT=@row_calc
            WHERE TABLE_NAME = current_table;        
            
            -- exit condition
            SET loop_counter = loop_counter + 1;
            IF loop_counter > temp_row_count THEN LEAVE value_insert_loop; 
            END IF;
        END LOOP;
    END populate_table;
    
    SELECT * FROM temp_db_snapshot;
    
END procedure_body
//
delimiter ;
{% endhighlight %}

**Debugging Note:** During the process I realised that I needed to troubleshoot my code during production. As a result I resorted to select statement calls to "print" information of interest to work out what was going on. This was particulary helpful when forging the loop code. Basically, the debug statements looked a little like this:

{% highlight sql %}
SELECT var_name;
{% endhighlight %}

## The final product

All of the work that has been done in this post culminates in the following call, which is more complete in comparison to what we [previously achieved](In the [previous post]({{ site.baseurl }}{% post_url 2016-12-18-mysql-intro-part6_basic_tutorial3 %})):

{% highlight sql %}
mysql> CALL DB_SNAPSHOT('sakila');
+----+----------------------------+-----------+-----------+
| ID | table_name                 | ROW_COUNT | COL_COUNT |
+----+----------------------------+-----------+-----------+
|  1 | actor                      |       200 |         4 |
|  2 | actor_info                 |       200 |         4 |
|  3 | address                    |       603 |         9 |
|  4 | category                   |        16 |         3 |
|  5 | city                       |       600 |         4 |
|  6 | country                    |       109 |         3 |
|  7 | customer                   |       599 |         9 |
|  8 | customer_list              |       599 |         9 |
|  9 | film                       |      1000 |        13 |
| 10 | film_actor                 |      5462 |         3 |
| 11 | film_category              |      1000 |         3 |
| 12 | film_list                  |       997 |         8 |
| 13 | film_text                  |      1000 |         3 |
| 14 | inventory                  |      4581 |         4 |
| 15 | language                   |         6 |         3 |
| 16 | nicer_but_slower_film_list |       997 |         8 |
| 17 | payment                    |     16049 |         7 |
| 18 | rental                     |     16044 |         7 |
| 19 | sales_by_film_category     |        16 |         2 |
| 20 | sales_by_store             |         2 |         3 |
| 21 | staff                      |         2 |        11 |
| 22 | staff_list                 |         2 |         8 |
| 23 | store                      |         2 |         4 |
+----+----------------------------+-----------+-----------+
23 rows in set (2.32 sec)

Query OK, 0 rows affected (2.32 sec)

{% endhighlight %}

## Conclusion

Thus far, this has been an enjoyable and instructive introduction into SQL via MySQL.

This has provided me a good platform to continue growing my SQL skills and given me the confidence to start using SQL to support my future data science endeavours!

:smile: :smile:
