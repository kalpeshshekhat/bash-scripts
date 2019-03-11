#!/bin/bash

function java_check(){
java -version > /dev/null 2>&1
if [ "$?" == 0 ];then
echo "Java is installed with below version"
java -version
fi
}


function lv_check(){
lvname=swap
lvs|grep $lvname > /dev/null 2>&1
if [ "$?" == 0 ];then
echo "$lvname is available"
else
echo "$lvname is not available"
exit
fi
lvsize=`lvs|grep $lvname|awk '{ print $4 }'| rev | cut -c 5- | rev`
#lvsize=700
if [ "$lvsize" -ge 1000 ];then
echo "size of $lvname is enough"
else
echo "size of $lvname is NOT enough"
fi
}


function user_check(){
for i in $@
do
	grep "^$i" /etc/passwd > /dev/null 2>&1
	if [ "$?" == 0 ];then
		echo "$i user exists on server"
	else
		echo "$i user doesn't exist on server"
	fi
done
}


function group_check(){
for i in $@
do
	grep "^$i" /etc/group > /dev/null 2>&1
	if [ "$?" == 0 ];then
		echo "$i group exists on server"
	else
		echo "$i group doesn't exist on server"
	fi
done
}

function data_check(){
size=`df -h|grep "/boot"|awk '{ print $3 }'| rev | cut -c 2- | rev`
if [ "$size" -ge 700 ];then
echo "Data Sync is completed"
else
echo "Data Sync is not completed"
fi
}

function checksum (){









#java_check
#lv_check
#user_check aufotas aufoaws auapaws auaptas
#group_check mysql ansusr kalpesh
#data_check




