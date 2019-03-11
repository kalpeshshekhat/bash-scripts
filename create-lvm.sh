#!/bin/bash

pvcreate $1
vgcreate $2 $1
CONFFILE=/soft-mount/scripts/create-lvm.conf

for line in `cat $CONFFILE`
do
        LVNAME=`echo $line | cut -d":" -f1`
        LVSIZE=`echo $line | cut -d":" -f2`
        DIRNAME=`echo $line | cut -d":" -f3`
        lvcreate -L $LVSIZE -n $LVNAME $2
        mkfs.xfs /dev/$2/$LVNAME
        mount /dev/$2/$LVNAME $DIRNAME
        mkdir -p $DIRNAME
        echo "/dev/mapper/$2-$LVNAME    $DIRNAME        xfs     defaults 1 2" >> /etc/fstab
done
