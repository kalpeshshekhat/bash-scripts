#!/bin/bash

groupadd -g 5700 support
useradd -u 5701 -G 5700 -m -c "haresh.sawdekar@capgemini.com" hareshs
echo -e "Usr@Sles_15\nUsr@Sles_15"|passwd hareshs
echo "%support ALL=(ALL) ALL" >> /etc/sudoers
