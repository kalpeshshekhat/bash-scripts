#!/bin/bash

for host in `cat /software/scripts/files/hosts`
do
	scp /software/scripts/files/$1 $host:$2
done
