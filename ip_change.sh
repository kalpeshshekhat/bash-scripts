#!/bin/bash

echo "Interface : "
read intf
echo "IP : "
read ipdr
echo "Network : "
read ntw
echo "Gateway : "
read gwy

sed -i.bak "s/IPADDR=10.100./IPADDR=${ipdr}/g" /etc/sysconfig/network/ifcfg-$intf 
sed -i.bak "s/NETWORK=10.100./NETWORK=${ntw}/g" /etc/sysconfig/network/ifcfg-$intf 
sed -i.bak "s/^default.*/default ${gwy} - -/g" /etc/sysconfig/network/routes 

service network restart ; ifconfig ; ip route ; ping -c 2 $gwy
