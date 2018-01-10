#!/bin/bash
clear
echo -e "\033[31m###################### Web Server Yardımcı Komutları #####################"
echo "######################### Vivoxy İnternet Hizmetleri #########################"
echo -e "\033[35m#-----------------------------------------------------------------#"
echo "# (0) Bash Scripti Güncelle                                    #"
echo "# (1) Sunucuya Reboot At                           	     #"
echo "# (2) SQL Servisini Yeniden Başlat                                 #"
echo "# (3) Apache (HTTP) Servisini Yeniden Başlat                     #"
echo "# (4) Litespeed Servisini Yeniden Başlat                        	   #"
echo "# (5) DNS Sunucusunu Yeniden Başlat                             	   #"
echo "# (6) Posta Sunucusunu Yeniden Başlat                              	   #"
echo "# (7) SSH  Sunucusunu Yeniden Başlat                               	   #"
echo "# (8) İmap  Sunucusunu Yeniden Başlat                              	   #"
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
rm -rf yardimci.sh
rm -rf yardimci.log
wget https://raw.github.com/vivoxy/yardimci/master/yardimci.sh
touch yardimci.log
chmod +x /root/yardimci.sh
sh yardimci.sh
;;
1)
clear
echo "Sunucuya Reboot atılıyor..."
sleep 3
reboot
;;
2)
clear
echo "SQL Servisi Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
/etc/rc.d/init.d/mysql restart
echo "SQL Servisi Yeniden Başlatıldı."
;;
3)
clear
echo "Apache (HTTP) Servisi Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
/etc/init.d/apache2 restart
echo "Apache (HTTP) Servisi Yeniden Başlatıldı."
;;
4)
clear
echo "Litespeed Servisi Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
service lsws restart
echo "Litespeed Servisi Yeniden Başlatıldı."
;;
5)
clear
echo "DNS Sunucusu Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
service named restart
echo "DNS Sunucusu Yeniden Başlatıldı."
;;
6)
clear
echo "Posta Sunucusu Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
/etc/rc.d/init.d/exim restart
echo "Posta Sunucusu Yeniden Başlatıldı."
;;
7)
clear
echo "SSH  Sunucusu Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
/etc/rc.d/init.d/httpd restart
echo "SSH  Sunucusu Yeniden Başlatıldı."
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
echo "Network Yeniden Başlatılıyor, lütfen bekleyiniz..."
sleep 3
service network restart
echo "Network Yeniden Başlatıldı."
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
