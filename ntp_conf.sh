#!/bin/bash

sed 's/server*/server 10.102.18.4/' /etc/ntp.conf
service ntpd restart
