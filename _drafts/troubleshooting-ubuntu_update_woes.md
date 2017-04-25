---
layout: post
title: "PostgreSQL setup "
published: true
series: PostgreSQL intro
categories: [data management, database]
tags: [SQL, PostgreSQL, relational database, rdbms, tutorial]
---

tried to run 

sudo apt-get update
sudo apt-get upgrade

during PostgreSQL installation (link)

## dealing with missing Keys

### Looked through a number of options

http://stackoverflow.com/questions/41445260/ubuntu-16-04-error-with-apt-get-update

possible solution frm here:
https://github.com/commercialhaskell/stack/issues/2056

echo 'deb http://download.fpcomplete.com/ubuntu xenial main'|sudo tee /etc/apt/sources.list.d/fpco.list


http://stackoverflow.com/questions/41445260/ubuntu-16-04-error-with-apt-get-update
https://askubuntu.com/questions/13065/how-do-i-fix-the-gpg-error-no-pubkey

### Then tried this

getting the GPG keys for [ubuntu](https://www.ubuntu.com/download/how-to-verify)

gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys "8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092" "C598 6B4F 1257 FFA8 6632 CBA7 4618 1433 FBB7 5451"

### Working solution

nothing resolved the issue till I did the following:

1. Open "System settings" panel window
2. Open "Software & Updates" program under the "System" section
3. Under the "Ubuntu Software" tab
    * tick the "Source code" option
    * Select "Main server" option from the "Download from:" dropdown menu. Option was previously "Server for australia"
    
4. Then ran update and upgrade commands
5. rebooted system

all good :smile: