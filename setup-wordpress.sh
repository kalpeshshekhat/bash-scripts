yum install httpd -y
systemctl start httpd.service
systemctl enable httpd.service

yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb

mysql_secure_installation

yum install php php-mysql -y

systemctl restart httpd

cd /var/www/html
mkdir wordpress
cd wordpress/
chown -R apache:apache wordpress

systemctl restart httpd

vi /etc/httpd/conf/httpd.conf
systemctl restart httpd

mysql -u root -p

yum install php-gd -y

systemctl restart httpd

yum install wget -y
wget http://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
rsync -avP ~/wordpress/ /var/www/html/wordpress/
cd /var/www/html
cd wordpress/
mkdir -p /var/www/html/wordpress/wp-content/uploads
chown -R apache:apache /var/www/html/wordpress/*
cp wp-config-sample.php wp-config.php
vim wp-config.php
