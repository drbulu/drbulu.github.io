---
layout: post
title: MySQL - Basic Tutorial 5 - Better title!
published: true
series: MySQL intro
categories: [data management, database]
tags: [SQL, MySQL, relational database, rdbms, tutorial]
---

## Introduction

### Background:
In the [previous post]({{ site.baseurl }}{% post_url 2016-12-18-mysql-intro-part6_basic_tutorial3 %}) <-- change URL :)

## Working the problem

### Logic flow

1) Create temporary table - 

* from column count table

* first delete if exists?

2) Alter table --> add TABLE_ROWS column, and ID col

3) Update TABLE_ROWS col via Loop through TABLE_NAMES col

i) Select ta le name from temporary table's name col

ii) Calculate row counts : select into local variable

iii) Update table using selected table name and calculated values.

4) END of PROCEDURE

* either as is

* or with select statement formatted to desired view :)

## Need help from control flow

Need to master [control flow](http://dev.mysql.com/doc/refman/5.7/en/flow-control-statements.html) statements, which are a subset of the [compound statement](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-compound-statements.html) group.

[BEGIN ... END](http://dev.mysql.com/doc/refman/5.7/en/begin-end.html) statements ... probably in previous post.

[statement labelling](http://dev.mysql.com/doc/refman/5.7/en/statement-labels.html)... good to know :smile:

[loops](http://dev.mysql.com/doc/refman/5.7/en/loop.html)

[select into](http://dev.mysql.com/doc/refman/5.7/en/select-into.html)

[alter_table](http://dev.mysql.com/doc/refman/5.7/en/alter-table.html)

[update_table](http://dev.mysql.com/doc/refman/5.7/en/update.html)

research varialbe scope [local](http://dev.mysql.com/doc/refman/5.7/en/local-variable-scope.html), [user](https://dev.mysql.com/doc/refman/5.7/en/user-variables.html), and [system](https://dev.mysql.com/doc/refman/5.7/en/using-system-variables.html). Very helpful discussion [here](http://stackoverflow.com/questions/1009954/mysql-variable-vs-variable-whats-the-difference#1010042). 

NOTE: local vars can't be used in prepared statements

[auto-increment help](http://stackoverflow.com/questions/14753321/add-auto-increment-id-to-existing-table#14753520)

Hard code first, add variables later!

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

borrowed a lot from the [cursors](http://dev.mysql.com/doc/refman/5.7/en/cursors.html) demo procedure

INTERESTING NOTE: started to use [prepared statements](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html) when I realised that I could simplify with local variables. 
Will: keep prepared statements at the start to validate function input, but using local variables to see if I can get away with the added simplicity.

Had much trouble using a varible reference after the FROM clause: 
(example)
after much tribulation, I resorted to prepared statements as my solution, which seemed to be validated later on (see [here](http://lists.mysql.com/mysql/207736)). 

Odd... worked except for information schema DB... interesting?

... SHOW EXAMPLE

Without cursor... needed ID column

Systematically realising what I need

used SELECT var_name; to help debug loop code :wink: