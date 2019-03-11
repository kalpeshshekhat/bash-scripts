#!/bin/bash

rm -f /etc/udev/rules.d/70-persistent-net.rules
rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /etc/ssh/ssh_host_*
rm -f /etc/ssh/*key*
logrotate -f /etc/logrotate.conf
rm -f /var/log/*-????????
rm -f /var/log/*.xz
SuSEfirewall2 disable
SuSEfirewall2 stop
SuSEfirewall2 off
cat /dev/null > /var/log/audit/audit.log
cat /dev/null > /var/log/wtmp
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/grubby
cat /dev/null > /root/.bash_history
