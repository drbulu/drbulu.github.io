---
layout: post
title: "PostgreSQL setup "
published: true
series: PostgreSQL intro
categories: [data management, database]
tags: [SQL, PostgreSQL, relational database, rdbms, tutorial]
---


[homepage](https://www.postgresql.org/)

There is an [installation chapter](https://www.postgresql.org/docs/9.6/static/installation.html) with full installation instructions and a [command summary](https://www.postgresql.org/docs/9.6/static/install-short.html) to put all of the pieces together.


download the source, [the general install page](https://www.postgresql.org/docs/9.6/static/install-getsource.html) is where I am at 9.6.2 [ubuntu](https://www.postgresql.org/download/linux/ubuntu/). Also has details about the potential packages to install including [pgadmin](https://pgadmin.org/). NOTE: installation instruction also at the [wiki](https://wiki.postgresql.org/wiki/Apt)

make this file:

    /etc/apt/sources.list.d/pgdg.list

add this line: 

    deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main


then execute these instructions:

{% highlight bash %}
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql pgadmin3 postgresql-contrib postgresql-client
# for dev
sudo apt-get install
{% endhighlight %}

also need the [dev package](http://stackoverflow.com/a/3116128) for the installation of R packages. Had similar error to [this](http://stackoverflow.com/questions/26302960/install-rpostgresql-on-rhel-6-5-libpq-fe-h-error).

{% highlight bash %}
sudo apt-get install libpq-dev
{% endhighlight %}

## Tutorial

https://www.postgresql.org/docs/current/static/tutorial.html

https://www.postgresql.org/docs/9.6/static/tutorial-sql-intro.html

https://www.postgresql.org/docs/current/static/tutorial-createdb.html

admin: https://www.postgresql.org/docs/9.6/static/admin.html

### Start server

https://www.postgresql.org/docs/9.6/static/server-start.html

https://www.postgresql.org/docs/9.6/static/server-shutdown.html

### Adding user


### creating a db

via the [createdb](https://www.postgresql.org/docs/current/static/tutorial-createdb.html) command

## ODBC driver install

now to install the [odbc driver](https://odbc.postgresql.org/) psqlodbc

good general installation [guide](https://www.postgresql.org/message-id/3C68E705.5060806@itek.norut.no)

[this FAQ](https://odbc.postgresql.org/faq.html) tells us that the following command won't work:

    sudo apt-get install postgresql-odbc

we will need to install from source some instructions [here](https://odbc.postgresql.org/docs/unix-compilation.html) and downloaded [this file](https://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-09.06.0200.tar.gz) from [here](https://www.postgresql.org/ftp/odbc/versions/src/).

or I can use [this approach](http://digitalitility.com/tutori-alitility/postgresql/odbc-setup-on-ubuntu-for-postgresql/) and there is some information of the package [here](http://packages.ubuntu.com/precise/odbc-postgresql). 

However, will probably install from source, since that's what I did previously for the [mysql odbc driver]({{site.baseurl}}{% post_url 2016-12-02-mysql-intro-part2-setup %}#odbc-installation)

first, needed to install libtool via:

    sudo apt-get install libtool-bin

Then commenced install from Downloads, then got an error similar to [this](https://www.postgresql.org/message-id/52798024.4020604%40gmail.com) where `odbc_config` was not found by ./configure 

after much grief, saved myself further grief with the instruction from [here](http://digitalitility.com/tutori-alitility/postgresql/odbc-setup-on-ubuntu-for-postgresql/)

    sudo apt-get install odbc-postgresql

[config](https://www.postgresql.org/message-id/1087567614.3272.38.camel@workstation.mn.mtu.net) or potentially use the `ODBCCreateDataSourceQ4` or `ODBCManageDataSourcesQ4` GUI programs to install specific data sources.

## Connections with R

https://cran.r-project.org/web/packages/RPostgreSQL/index.html

https://www.r-bloggers.com/getting-started-with-postgresql-in-r/

Note: [sqldf](https://github.com/ggrothendieck/sqldf) handles connections with multiple databases.

https://www.r-bloggers.com/r-and-postgresql-using-rpostgresql-and-sqldf/

https://github.com/ggrothendieck/sqldf