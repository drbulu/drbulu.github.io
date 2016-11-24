
https://en.wikipedia.org/wiki/MySQL

## components


Client: 
http://dev.mysql.com/doc/refman/5.7/en/programs-client.html 


### did background reading
after tale of woe

* followed the following instructions at this page: http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/

in particular, I followed the instructions here: http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#apt-repo-fresh-install

There were other overviews, such as [this](https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/) informative one and others [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04#step-2-install-mysql-to-manage-site-data) and [here](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04#step-2-install-mysql) but I chose the go with the official line.

## installation - OFFICIAL

1) downloaded the deb file 

This included installing the deb file from the following link: http://dev.mysql.com/downloads/repo/apt/


2) selected OK at bottom of menu.. accepted mysql 5.7 default

sudo dpkg -i /path/to/file/mysql-apt-config_0.8.0-1_all.deb


3) update apt repo

Note use apt or apt-get

sudo apt-get update # explain
sudo apt-get upgrade # explain


4) install mysql-server and associated package

sudo apt-get install mysql-server

5) login as root:

Note: If you sudo the following command, it could result in vivid world of pain!

mysql -u root -p

remember, if you can use this command, you are DB admin :)

6) install other packages:

I only contemplated this after checking that mysql server was working as in step 5

This was because of much drama.

workbench

sudo apt-get install mysql-workbench-community

sudo apt-get install libmysqlclient18

list of other MySQL packages here: https://dev.mysql.com/doc/refman/5.7/en/linux-installation-rpm.html

**Note:** ) Optional step after step 4
didn't bother with this: http://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-select-series 
kept the major release version as standard

however, looks like this is a requirement for production server: https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/ (step 3)

### Tale of woe

I strongly susped that because I messed up the login as mysql root by applying sudo command
I had to purge my previous attempt at installation

sudo apt-get remove mysql-server
sudo apt-get autoremove

Then I had to start the install from scratch after deleting the contents of the mysql subdirectories var

This was because all of the machinations that I tried to use to resolve the issue, including attempting [password resets](https://www.cyberciti.biz/tips/recover-mysql-root-password.html), all to no avail.

I had a vague suspicion that it was due to a permissions erros because every attempt to access mysql either from the console or workbench threw a permissions error, even when prepending commands with **sudo**. Therefore I tried [this](http://unix.stackexchange.com/questions/208328/permission-denied-writing-to-mysql-log#208335), also to no avail.

During this time I found these resources useful: 

https://www.cyberciti.biz/faq/howto-install-mysql-on-ubuntu-linux-16-04/



### moral of the story

READ CAREFULLY, and PROCEED slowly!

hopefully this is a cautionary tale to all

## MySQL basic usage

### a) tutorial here
https://dev.mysql.com/doc/refman/5.7/en/mysql-shell.html

tutorial: http://dev.mysql.com/doc/refman/5.7/en/tutorial.html 

dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/#repo-qg-apt-starting-and-stopping-server


1) Check service running

* check server: 

sudo systemctl status mysql.service

* start server: 

sudo systemctl start mysql or sudo systemctl start mysql.service

* stop server

sudo systemctl stop mysql or sudo systemctl stop mysql.service

* restart server 

sudo systemctl restart mysql

sudo systemctl restart mysql.service

* login as root

mysql -u root -p



## MySQL basic usage - install test data

https://dev.mysql.com/doc/employee/en/employees-installation.html

source location: https://github.com/datacharmer/test_db


## Sample database


* TOC: https://dev.mysql.com/doc/sakila/en/ 
* installation section: https://dev.mysql.com/doc/sakila/en/sakila-installation.html

* 
https://en.wikipedia.org/wiki/The_BFG
https://www.roalddahl.com/roald-dahl/stories/1980s/the-bfg

2whizpoppingFrobscottle*!

* back up and recovery

http://dev.mysql.com/doc/refman/5.7/en/backup-and-recovery.html




## clean and reinstall 
grep: /etc/mysql/: No such file or directory

error tripped up install
