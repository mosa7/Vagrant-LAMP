#!/bin/sh

#Tool install
yum -y install vim git zip unzip

#Apache install
yum -y install httpd
cp -s /vagrant/provision/vagrant_webroot.conf /etc/httpd/conf.d/.

#PHP7 install
yum -y install epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum -y install --enablerepo=remi,epel,remi-php70 php php-intl php-mbstring php-pdo php-mysqlnd

#composer install
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

#MySQL5.7 install
yum -y remove mariadb-libs.x86_64
yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
yum -y install mysql-community-server

#root password setting
echo skip-grant-tables >> /etc/my.cnf
systemctl start mysqld
mysql -u root -e"
    use mysql
    UPDATE user SET authentication_string=password('root') WHERE user='root';"
sed -ie '$d' /etc/my.cnf
systemctl restart mysqld
systemctl enable mysqld