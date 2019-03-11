#!/bin/bash
#>$2
for host in `cat /software/scripts/files/hosts`
do
	echo $host >> $2
	echo "----------" >> $2
#	ssh root@$host 'bash -s' < $1 
#	ssh root@$host "ip addr|grep "10.100"|awk '{ print $2 }'" >> /software/scripts/files/prod_ip
#	ssh root@$host "nc -z -v -w1 $1 $2" &>> $4 
	ssh root@$host  $1 &>> $2 
#	ssh root@$host  $2 &>> $3 
	echo "----------" >> $2 
done
