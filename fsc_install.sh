#!/bin/bash

/etc/init.d/fsma stop ; for pkgs in `rpm -qa | grep -i f-secure`; do rpm -e --noscripts $pkgs; done
for pkgs in `rpm -qa | grep -i f-secure`; do rpm -e --noscripts $pkgs; done ; rpm -qa | grep -i f-secure
rm -rf /opt/f-secure ; rm -rf /var/opt/f-secure ; rm -rf /etc/opt/f-secure
cp /soft-mount/fsecure/fsls-11.10.68-rtm.tar.gz /root/
cd /root ; tar -xvzf fsls-11.10.68-rtm.tar.gz
echo -e "\n\yes\n" | sh /root/fsls-11.10.68-rtm/fsls-11.10.68
echo -e "\nM\nhttp://145.247.22.8:80\n\nEBR6-E9J0-1NC5-32CT-LF2N\n\n\n"|/opt/f-secure/fsav/fsav-config
echo -e "f\n\n" | /opt/f-secure/fsav/sbin/fschooser
