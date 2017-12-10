---
layout: post
title: "Installing Oracle SQL: Background Research 2"
published: true
series: Oracle SQL intro
categories: [data management, database]
tags: [SQL, Oracle, relational database, rdbms, tutorial]
---

## Introduction

[Previous post]({{ site.baseurl }}{% post_url 2017-08-16-OracleSQL_intro_and_install %})


##

http://tuhrig.de/3-ways-of-installing-oracle-xe-11g-on-ubuntu/ 

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements

sudo apt-get update

Install packages to allow apt to use a repository over HTTPS:

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=s390x] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce

chose wrong architecture... needed AMB64:
my search lead me to [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04) (via [here](https://stackoverflow.com/questions/44360085/unable-to-install-docker-on-ubuntu-17) )

sudo docker run hello-world

check architecture: https://askubuntu.com/questions/189640/how-to-find-architecture-of-my-pc-and-ubuntu

http://ark.intel.com/products/53434 (not arm or AMD)

https://success.docker.com/Support/How_do_I_change_my_email_address%3F

SQL Developer: https://hub.docker.com/r/marcelhuberfoo/sqldeveloper/


## Alien

help.ubuntu.com RPM/AlienHowTo

packages.ubuntu.com xenial alien

Ubuntu package to convert RPM packages to deb packages for installation.

Backgorund:

* Wikipedia.org/deb_(file_format) 
* Wikipedia.org/rpm_(software) 

both map to structureng files of a software installation for successful installation and management by the OS package mgt system. Do comparision.

General steps:

1. GEt Oracle XE rpm package
2. Install alien, libaio1 and unixodbc packages
3. Convert RPM to DEB

sudo alien --scripts -d oracle_pkg.rpm

4. Create chkconfig script (all identical)
* dude: 28/7/2011 (explains)
* ask ubuntu.com 27/2/2016
* mariadb (?/?/?)

5. Create 60-oracle.comf file

a) sets oracle kernel params: comment +  4 lines
b) load and test kernel parameters

6. Installation location config
a) to a device
b) to a folder (my preferred options)

sudo mkdir /home/oracle-xe
sudo ln -s /home/oracle-xe /u01

avoids having to create, config and and mount a separate volume/drive just for XE. I don't want to think about what I would have to do to reverse this process during unilstallation of required. Option only provided by dude. 

