  975  yum install httpd -y
  976  systemctl start httpd.service
  977  systemctl enable httpd.service
  978  yum install mariadb-server mariadb -y
  979  systemctl start mariadb
  980  systemctl enable mariadb
  981  mysql_secure_installation
  982  yum install php php-mysql -y
  983  ls /etc/yum.repos.d
  984  mv /etc/yum.repos.d/ius*.repo /root/
  985  yum install php php-mysql -y
  986  rpm -qa|grep php
  987  rpm -qa|grep php-mysql
  988  yum install php-mysql -y
  989  yum remove php -y
  990  yum install php php-mysql -y
  991  yum remove php70u* -y
  992  yum install php php-mysql -y
  993  systemctl restart httpd
  994  vi /var/www/html/info.php
  995  iptables -L
  996  systemctl start firewalld
  997  systemctl enable firewalld
  998  iptables -L
  999  firewall-cmd --permanent --zone=public --add-service=http
 1000  firewall-cmd --permanent --zone=public --add-service=https
 1001  systemctl restart firewalld
 1002  firewall-cmd --reload
 1003  ls -l /var/www/html/info.php
 1004  chown -R apache:apache /var/www/html
 1005  systemctl restart httpd
 1006  chmod u+x /var/www/html/info.php
 1007  systemctl restart httpd
 1008  cd /var/www/html
 1009  ls -l
 1010  cat info.php
 1011  mkdir magento
 1012  mv * ./magento/
 1013  mkdir -p /tmp/magento
 1014  mv * /tmp/magento/
 1015  ls
 1016  mv /tmp/magento .
 1017  l
 1018  ls
 1019  cd magento/
 1020  ls
 1021  ls magento/
 1022  pwd
 1023  mv * ../
 1024  pwd
 1025  cd ..
 1026  ls
 1027  pwd
 1028  cd magento/
 1029  ls
 1030  cd magento/
 1031  ls
 1032  pwd
 1033  mv * ../
 1034  cd ..
 1035  rmdir magento
 1036  ls
 1037  cd ..
 1038  pwd
 1039  cd magento/
 1040  ls
 1041  ls -l
 1042  cd ..
 1043  mkdir wordpress
 1044  cd wordpress/
 1045  cd ..
 1046  mv magento/info.php .
 1047  ls-l
 1048  ls -l
 1049  chown -R apache:apache magento
 1050  chown -R apache:apache wordpress
 1051  yum install php* -y
 1052  yum remove php* -y
 1053  yum install php* -y
 1054  mv /root/*.repo /etc/yum.repos.d/
 1055  yum install php* -y
 1056  yum remove php* -y
 1057  yum install php php-mysql -y
 1058  getenforce
 1059  iptables -F
 1060  systemctl restart httpd
 1061  vi /etc/httpd/conf/httpd.conf
 1062  systemctl restart httpd
 1063  systemctl status httpd
 1064  vi /etc/httpd/conf/httpd.conf
 1065  systemctl restart httpd
 1066  systemctl status httpd
 1067  iptables -L
 1068  systemctl restart firewalld
 1069  iptables -L
 1070  mysql
 1071  mysql -u root -p
 1072  yum install php-gd -y
 1073  ssytemctl restart httpd
 1074  systemctl restart httpd
 1075  cd ~
 1076  wget http://wordpress.org/latest.tar.gz
 1077  yum install wget -y
 1078  wget http://wordpress.org/latest.tar.gz
 1079  tar xvzf latest.tar.gz
 1080  rsync -avP ~/wordpress/ /var/www/html/wordpress/
 1081  cd /var/www/html
 1082  ls
 1083  cd wordpress/
 1084  ls
 1085  ls -l
 1086  man rsync
 1087  mkdir -p /var/www/html/wordpress/wp-content/uploads
 1088  chown -R apache:apache /var/www/html/wordpress/*
 1089  ls -l
 1090  cp wp-config-sample.php wp-config.php
 1091  vim wp-config.php
 1092  history

