#!/bin/bash

/etc/init.d/networker stop
rm -rf /nsr
#zypper rm lgtonmda-9.2.1.1-1.x86_64
zypper rm lgtoclnt-9.1.1.0-1.x86_64
zypper rm lgtonmda-9.2.1.1-1.x86_64
cd /soft-mount/scripts/files
zypper in lgtoclnt-9.2.1.1-1.x86_64.rpm
zypper in lgtonmda-9.2.1.1-1.x86_64.rpm
/etc/init.d/networker start
/etc/init.d/networker status
ls /nsr

cat << EOF >> /etc/hosts
10.250.255.36    bus-nwdd-04-bu.cap.local             bus-nwdd-04-bu
10.250.255.37    bus-nwdd-05-bu.cap.local             bus-nwdd-05-bu
10.250.255.65    bus-nwdd-07-bu.cap.local             bus-nwdd-07-bu
10.250.255.67    bus-nwdd-08-bu.cap.local             bus-nwdd-08-bu
10.250.255.66    bus-nwdd-09-bu.cap.local             bus-nwdd-09-bu
10.250.255.62    bus-nwsrv-06      bus-nwsrv-06-bu               bus-nwsrv-06-bu.cap.local
10.250.255.54    bus-nwsn-08       bus-nwsn-08-bu                bus-nwsn-08-bu.cap.local
10.250.255.61    bus-nwsn-09       bus-nwsn-09-bu                bus-nwsn-09-bu.cap.local
10.250.255.63    bus-nwsn-10       bus-nwsn-10-bu                bus-nwsn-10-bu.cap.local
10.250.255.68   bus-nwsn-11       bus-nwsn-11-bu                bus-nwsn-11-bu.cap.local
10.250.255.64   bus-nwsn-12       bus-nwsn-12-bu                bus-nwsn-12-bu.cap.local
10.250.255.69    bus-nwsn-14      bus-nwsn-14-bu                bus-nwsn-14-bu.cap.local
10.250.255.70    bus-nwsn-15      bus-nwsn-15-bu                bus-nwsn-15-bu.cap.local
10.250.255.57    bus-nwnmc-03-bu              bus-nwnmc-03-bu.cap.local
10.250.255.82   bus-nwsrv-07-bu         bus-nwsrv-07-bu.cap.local       bus-nwsrv-07
10.250.255.83   bus-nwsn-17-bu bus-nwsn-17-bu.cap.local
10.250.255.84   bus-nwsn-18-bu bus-nwsn-18-bu.cap.local
10.250.255.85   bus-nwsn-19-bu bus-nwsn-19-bu.cap.local
10.250.255.86   bus-nwsn-20-bu bus-nwsn-20-bu.cap.local
10.250.255.66   bus-nwdd-09-bu bus-nwdd-09-bu.cap.local
10.250.255.67   bus-nwdd-08-bu bus-nwdd-08-bu.cap.local
$1
EOF

cat << EOF > /nsr/res/servers
bus-nwsrv-07
bus-nwsrv-07-bu
bus-nwsn-07-bu.cap.local
bus-nwsrv-06
bus-nwsrv-06-bu
bus-nwsrv-06-bu.cap.local
EOF

/etc/init.d/networker stop
/etc/init.d/networker start
/etc/init.d/networker status
