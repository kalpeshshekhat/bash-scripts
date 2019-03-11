#!/bin/bash

zypper --non-interactive in sapconf
mkdir -p /etc/tuned/$1
cp /usr/lib/tuned/$1/tuned.conf /etc/tuned/$1/
tuned-adm profile $1
systemctl restart sapconf.service
tuned-adm list
cp /etc/sysconfig/sapconf /etc/sysconfig/sapconf.bkp

cat >/etc/sysconfig/sapconf << EOT
VSZ_TMPFS_PERCENT=75
SHMALL=1152921504606846720
SHMMAX=18446744073709551615
SEMMSL=32000
SEMMNS=1024000000
SEMOPM=500
SEMMNI=32000
LIMIT_1="@sapsys soft nofile 65536"
LIMIT_2="@sapsys hard nofile 65536"
LIMIT_3="@sdba soft nofile 65536"
LIMIT_4="@sdba hard nofile 65536"
LIMIT_5="@dba soft nofile 65536"
LIMIT_6="@dba hard nofile 65536"
MAX_MAP_COUNT=2147483647
SHMMNI=32768
DIRTY_BYTES=629145600
DIRTY_BG_BYTES=314572800
TCP_SLOW_START=0
KSM=0
NUMA_BALANCING=0
THP=never
ENABLE_PAGECACHE_LIMIT="no"
energy_perf_bias=performance
governor=performance
force_latency=70
EOT

cp /etc/tuned/$1/tuned.conf /etc/tuned/$1/tuned.conf.bkp

cat >/etc/tuned/$1/tuned.conf << EOT
[main]
summary=Optimize for SAP NetWeaver, SAP HANA and HANA based products

[cpu]
governor = performance
energy_perf_bias = performance
#min_perf_pct = 100
force_latency = 70

[disk]
elevator = noop

[script]
script = /usr/lib/tuned/$1/script.sh
EOT

systemctl restart sapconf