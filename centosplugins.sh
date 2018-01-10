﻿#!/bin/bash
clear
echo -e "\033[31m###################### Installing CentOS Plugins  #####################"
echo "######################### Vivoxy İnternet Hizmetleri #########################"
echo -e "\033[35m#-----------------------------------------------------------------#"
echo "# (0) Bash Scripti Güncelle                                    #"
echo "# (1) Centos Installing "SSH2" Extension                           	     #"
echo "# (2) Centos Installing "MONO" Extension                              #"
echo "# (3) Centos Installing "Mod Pagespeed" Extension                  #"
echo "# (4) Centos Installing "Dstat" Extension                         	   #"
echo "# (5) Centos Installing "MongoDB" Extension                            	   #"
echo "# (6) "ISPConfig" Setup on CentOS                              	   #"
echo "# (7) "Monitorix" Setup on CentOS                               	   #"
echo "# (8) Installing "MySQL / PHP / PhpMyAdmin" on CentOS Server                             	   #"
echo "# (9) Network'u Yeniden Başlat                              		   #"
echo -e "\033[33m#-----------------------------------------------------------------#"
echo "# (10) İp Adresini Değiştir            					   #"
echo "# (11) Sunucu Hostname Değiştir             					   #"
echo "# (12) İptables Servisini Aç            						   #"
echo "# (13) İptables Servisini Kapat            						   #"
echo "# (14) İptables Servisini Yeniden Başlat            			   #"
echo "# (15) Sunucuda Takılı Kalan İp Adreslerini Güncelle                       #"
echo "#-----------------------------------------------------------------		   #"
echo -e "\033[34m# (20) Disk Bilgilerini Görüntüle                        #"
echo "# (21) CPU Bilgilerini Görüntüle                                   #"
echo "# (22) Ram Bilgilerini Görüntüle                                    #"
echo "# (23) Sunucu Kaynak Tüketimini Görüntüle     			   #"
echo "##############################################################################"
echo -e "\033[32m"
echo Seçiminizi Giriniz :
read secenek
case $secenek in
0)
clear
echo "Bash script güncelleniyor, lütfen bekleyiniz..."
sleep 3
cd /root
rm -rf centosplugins.sh
rm -rf centosplugins.log
wget https://raw.github.com/vivoxy/centosplugins/master/centosplugins.sh
touch centosplugins.log
chmod +x /root/centosplugins.sh
sh centosplugins.sh
;;
1)
clear
echo "SSH 2 Kuruluyor..."
sleep 3
yum -y install gcc php-devel php-pear make libssh2 libssh2-devel
sleep 1
pecl install -f ssh2
sleep 1
echo extension=ssh2.so >> /usr/local/lib/php.ini
sleep 1
service httpd restart && service nginx restart && service lsws restart
sleep 1
echo "SSH 2 Eklentisi Kurulmuştur..."
;;
2)
clear
echo "Mono Kuruluyor..."
sleep 3
yum install yum-utils
sleep 1
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sleep 1
yum-config-manager --add-repo http://download.mono-project.com/repo/centos6/
sleep 1
yum install mono-devel
sleep 1
echo "MONO Eklentisi Kurulmuştur..."
;;
3)
clear
echo "Mod Pagespeed Kuruluyor..."
sleep 3
echo extension=[mod-pagespeed] >> /etc/yum.repos.d/mod-pagespeed.repo
sleep 1
echo extension=name=mod-pagespeed >> /etc/yum.repos.d/mod-pagespeed.repo
sleep 1
echo extension=baseurl=http://dl.google.com/linux/mod-pagespeed/rpm/stable/x86_64 >> /etc/yum.repos.d/mod-pagespeed.repo
sleep 1
echo extension=enabled=1 >> /etc/yum.repos.d/mod-pagespeed.repo
sleep 1
echo extension=gpgcheck=0 >> /etc/yum.repos.d/mod-pagespeed.repo
sleep 1
yum repolist
sleep 1
yum install mod-pagespeed -y
sleep 1
echo extension=ModPagespeed on >> /etc/httpd/conf.d/pagespeed.conf
sleep 1
echo "Reboot Atılıyor..."
sleep
reboot
;;
4)
clear
echo "Dstat Kuruluyor..."
sleep 3
yum install update -y
sleep 1
yum -y install dstat
sleep 1
echo "Dstat Eklentisi Kurulmuştur... Eklentisi açmak için ssh ekranında --dstat-- yazınız"
;;
5)
clear
echo "MongoDB Kuruluyor..."
sleep 3
yum install update -y
sleep 1
yum -y install nano
sleep 1
echo extension=[mongodb] >> /etc/yum.repos.d/mongodb.repo
sleep 1
echo extension=name=MongoDB Repository >> /etc/yum.repos.d/mongodb.repo
sleep 1
echo extension=baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/ >> /etc/yum.repos.d/mongodb.repo
sleep 1
echo extension=gpgcheck=0 >> /etc/yum.repos.d/mongodb.repo
sleep 1
echo extension=enabled=1 >> /etc/yum.repos.d/mongodb.repo
sleep 1
yum -y install mongo-10gen mongo-10gen-server
sleep 1
chkconfig mongod on
sleep 1
service mongod start
sleep 1
service mongod status
sleep 1
echo "MongoDB Eklentisi Kurulmuştur... "
6)
clear
echo "ISPCONFİG kurulumu başlıyor.."
sleep 3
yum update -y
sleep 1
echo extension=SELINUX=disabled >> /etc/sysconfig/selinux
sleep 1
yum install php mod_fcgid
sleep 1
yum -y install postfix dovecot mailman system-switch-mail
sleep 1
yum -y install mysql mysql-server php-mysql
sleep 1
yum -y install pure-ftpd
sleep 1
wget --no-check-certificate https://github.com/servisys/ispconfig_setup/archive/master.zip
sleep 1
unzip master.zip
sleep 1
cd ispconfig_setup-master/
sleep 1
./install.sh
sleep 1
echo "ISPConfig Kuruldu. Reboot Atılıyor.."
sleep 1
echo "Tarayıcınızdan https://ipadresi:8080/index.php adresini ziyaret edip sunucu root bilgileriniz ile panele giriş yapabilirsiniz.."
sleep 5
reboot
;;
7)
clear
echo "monitorix Kuruluyor..."
sleep 3
yum update -y
sleep 1
http://download.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
sleep 1
rpm -ihv epel-release-7-11.noarch.rpm
sleep 1
yum install rrdtool rrdtool-perl perl-libwww-perl perl-MailTools perl-MIME-Lite perl-CGI perl-DBI perl-XML-Simple perl-Config-General perl-HTTP-Server-Simple wget -y
sleep 1
yum install monitorix -y
sleep 1
systemctl enable monitorix.service
sleep 1
systemctl disable firewalld
sleep 1
systemctl stop firewalld
sleep 1
/bin/systemctl start monitorix.service
sleep 1
echo "Tarayıcınız ile http://ipadresi:8080/monitorix adresini ziyaret ederek monitör panelinize ulaşabilirsiniz.."
;;
8)
clear
echo "İmap Sunucusu Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
service dovecot restart
echo "İmap Sunucusu Yeniden Başlatıldı."
;;
9)
clear
echo "MySQL/PHP/PhpMyAdmin Kurulumu Başılıyor..."
sleep 3
yum install mysql mysql-server -y
sleep 1
service mysqld start
sleep 1
chkconfig mysqld on
sleep 1
mysql_secure_installation
sleep 1
service mysqld restart
sleep 1
iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
sleep 1
iptables -I INPUT -p tcp --sport 3306 -j ACCEPT
sleep 1
service iptables save
sleep 1
service iptables restart
sleep 1
yum install -y php
sleep 1
service httpd restart
sleep 1
yum install -y php-gd php-imap php-ldap php-mbstring php-mysql php-odbc php-pear php-xml php-xmlrpc php-pecl-apc
sleep 1
http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
sleep 1
install -y
sleep 1
echo "Kurulum tamamlandı.T arayıcımıza girip http://ipadresi/phpMyAdmin adresini ziyaret ederek açılan sayfadan ilk başta belirlediğiniz mysql bilgileri ile giriş yapabilirsiniz."

;;
10)
clear
echo "İp adresinizi değiştirmek için panel açılıyor, lütfen bekleyiniz..."
sleep 3
nano /etc/sysconfig/network-scripts/ifcfg-eth0
;;
11)
clear
echo "Sunucu Hostname değiştirmek için panel açılıyor, lütfen bekleyiniz..."
sleep 3
nano /etc/sysconfig/network
;;
12)
clear
echo "İptables Açılıyor, lütfen bekleyiniz..."
sleep 3
service iptables start
echo "İptables Servisi Açıldı."
;;
13)
clear
echo "İptables Kapatılıyor, lütfen bekleyiniz..."
sleep 3
service iptables stop
echo "İptables Servisi Kapatıldı."
;;
14)
clear
echo "İptables Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
service iptables restart
echo "İptables Servisi Yeniden Başlatıldı."
;;
15)
clear
echo "Sunucudaki İp Adresleri Sorunu Çözülüyor, lütfen bekleyiniz..."
sleep 3
service ipaliases restart
echo "Sorun Çözüldü."
;;
20)
clear
echo "Disk bilgileri alınıyor, lütfen bekleyiniz..."
sleep 3
df -h
;;
21)
clear
echo "CPU bilgileri alınıyor, lütfen bekleyiniz..."
sleep 3
cat /proc/cpuinfo
;;
22)
clear
echo "Ram bilgileri alınıyor, lutfen bekleyiniz..."
sleep 3
cat /proc/meminfo
;;
23)
clear
echo "Anlık kaynak tüketimi alınıyor, lütfen bekleyiniz..."
sleep 3
top
;;
*)
echo "Hatali bir numara girdiniz."
esac
