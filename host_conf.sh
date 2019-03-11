#!/bin/bash
# Host Configuration Script for YARA SAP


# Configure CG & IBM IPs
echo "Temp. CG IP: "
read tempcgip
sed -i.bak "s/IPADDR=10.158.1.52/IPADDR=${tempcgip}/g" /etc/sysconfig/network/ifcfg-eth0

echo "Temp IBM IP: "
read tempibmip
sed -i.bak "s/IPADDR=10.100./IPADDR=${tempibmip}/g" /etc/sysconfig/network/ifcfg-eth1
chr=`echo $tempibmip | head -c 8 | tail -c 1`

if [ $chr == 9 ]

then
	ibmnet = 10.100.9.0
	gwy = 10.100.9.1

elif 	[ $chr == 0 ]

then
	ibmnet = 10.100.0.0
	gwy = 10.100.0.1

elif 	[ $chr == 1 ]

then
	ibmnet = 10.100.18.0
	gwy = 10.100.18.1
fi

sed -i.bak "s/NETWORK=10.100./NETWORK=${ibmnet}/g" /etc/sysconfig/network/ifcfg-eth1
sed -i.bak "s/^default.*/default ${gwy} - -/g" /etc/sysconfig/network/routes


# Configure Backup IP

echo "Backup IP: "
read bkpip
sed -i.bak "s/IPADDR=10.250.96./IPADDR=${bkpip}/g" /etc/sysconfig/network/ifcfg-eth2

# Configure Hostname

echo "hostname : "
read hst
flhst=$hst.yara.com
echo $flhst > /etc/hostname
echo "$tempibmip	$flhst	$hst" >> /etc/hosts

# Configure Swap Device

echo "Swap Device: "
read swpdev
mkswap $swpdev
swapon $swpdev
swapon -s
echo "$swpdev 	swap    swap    defaults	0 0"
