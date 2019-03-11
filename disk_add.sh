#!/bin/bash

for host in `ls /sys/class/scsi_host` ; do echo "- - -" >/sys/class/scsi_host/$host/scan; done

fdisk -l|grep /dev
