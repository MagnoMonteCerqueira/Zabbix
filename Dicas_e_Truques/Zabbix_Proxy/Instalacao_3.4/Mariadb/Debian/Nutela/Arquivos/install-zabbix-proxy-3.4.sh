#!/bin/bash
# -------------------------------------------------------------------------
# @Programa 
# 	@name: integraGZ.sh
#	@versao: 2.2.1
#	@Data 08 de Setembro de 2017
#	@Copyright: Verdanatech Soluções em TI, 2016 - 2017
#	@Copyright: Pillares Consulting, 2016
# --------------------------------------------------------------------------
# LICENSE
#
# integraGZ.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# integraGZ.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------
 
#
# Variables Declaration
#

versionDate="September 05, 2017"
TITULO="Verdanatech iGZ Install Zabbix Proxy 3.4 - v0.1"
BANNER="http://www.verdanatech.com"

devMail="halexsandro.sales@verdanatech.com"

# Discovery the system version and instanciate variables
source /etc/os-release

serverAddress=$(hostname -I | cut -d' ' -f1)

zabbixVersion="Zabbix Proxy 3.4"

# Control
zabbixInstallTag=0

# Works DIRs

# Temp dir
TMP_DIR=/tmp

# Zabbix link
zabbixDownloadLink="https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Server/Instalacao_3.4/Raiz/Arquivos/zabbix-release_3.4-1%2Bstretch_all.deb"

###
clear

cd /tmp

echo -e " ------------------------------------------------ _   _   _ \n ----------------------------------------------- / \\ / \\ / \\ \n ---------------------------------------------- ( i | G | Z ) \n ----------------------------------------------- \\_/ \\_/ \\_/ \n| __      __          _                   _            _\n| \\ \\    / /         | |                 | |          | | \n|  \\ \\  / ___ _ __ __| | __ _ _ __   __ _| |_ ___  ___| |__ \n|   \\ \\/ / _ | '__/ _\` |/ _\` | '_ \\ / _\` | __/ _ \\/ __| '_ \\ \n|    \\  |  __| | | (_| | (_| | | | | (_| | ||  __| (__| | | | \n|     \\/ \\___|_|  \\__,_|\\__,_|_| |_|\\__,_|\\__\\___|\\___|_| |_| \n| \n|                    consulting, training and implamentation \n|                                  comercial@verdanatech.com \n|                                        www.verdanatech.com \n|                                          +55 81 3091 42 52 \n ------------------------------------------------------------ \n| integraGZ.sh  + $zabbixVersion | \n ------------------------------------------------------------ \n
"
sleep 5

#
# Functions
#

# Request for use integraGZ

REQ_TO_USE ()
{
	clear

	# Test if the systen has which package
	which whiptail 

	if ( $? -ne 0 )
	then
	
			clear
			echo -e "

 ###########################################################
#                       WARNING!!!                          #
 -----------------------------------------------------------
#                                                           #
#                                                           #
# There was an error to use the whiptail package.           #
#                                                           #
#                                                           #
# The whiptail package is required to run the integraGZ.sh  #
#                                                           #
#                                                           #
 Please contact us: $devMail 
 ----------------------------------------------------------
      Verdanatech Solucoes em TI - www.verdanatech.com 
 ----------------------------------------------------------"; 

		kill $$

	fi


	# Test if the user is root

	if [ $UID -ne 0 ]
	then

		whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize! You need be the root user access to use this script. Try 'su' our 'sudo su' commands!" --fb 15 55
		kill $$
	
	fi

case $ID in
	
	debian)
	
	case $VERSION_ID in
		
		9)
		
			whiptail --title "${TITULO}" --backtitle "${BANNER}" --yesno "System GNU/Linux Debian $VERSION_ID was detected. Are we correct?. " --yes-button "Yes" --no-button "No" --fb 10 50
			
			if [ $? -eq 1 ]
			then
				
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
				kill $$
				
			fi
			
		;;
		
	esac

	;;
	
	centos)
	
	case $VERSION_ID in
		
		7)
		
			whiptail --title "${TITULO}" --backtitle "${BANNER}" --yesno "System GNU/Linux Centos $VERSION_ID was detected. Are we correct?. " --yes-button "Yes" --no-button "No" --fb 10 50
			
			if [ $? -eq 1 ]
			then
				
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
				kill $$
				
			fi
			
		;;
		
	esac

	;;
	

	*)
	
	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
	
	kill $$
	
	;;
	
esac

}

SET_REPOS ()
{

	clear 
	
	echo "Adding repositories, updating and upgrading the system..."
	
	sleep 1
	
	case $ID in

		debian)
		
			case $VERSION_ID in 
		
				9)
		
					echo "deb http://security.debian.org/debian-security stretch/updates main" > /etc/apt/sources.list
					echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
					echo "deb http://ftp.de.debian.org/debian stretch main" >> /etc/apt/sources.list
					echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
					
					apt-get update
					apt-get upgrade -y
					clear
					
				;;	
				
			esac
			
			;;
					
		centos)
		
			case $VERSION_ID in 
				7) 
				
					rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
					yum -y update
					yum -y upgrade
					
					clear
				
				;;
				
			esac
			
			;;
		
	esac	
}

LAMP_INSTALL ()
{
	
	case $ID in
		
		debian)
		
			case $VERSION_ID in
								
				9)
				
					clear
					echo "Intalling Debian packages for GLPI..."
					sleep 1
					apt-get -y install vim snmp snmpd apache2 bsdtar bzip2 curl libapache2-mod-php7.0 libmariadbd-dev libmariadbd18 mariadb-server openjdk-8-jdk php-soap php7.0 php7.0-apcu php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-imap php7.0-ldap php7.0-mysql php7.0-snmp php7.0-xmlrpc php7.0-xml php7.0-mbstring php7.0-bcmath
				;;	
					
			esac
			;;
			

		centos)
		
			case $VERSION_ID in
				
				7)
				
					clear
					echo "Intalling CentOS packages for GLPI..."
					sleep 1
					yum -y install bsdtar git httpd httpd-devel mariadb-devel mariadb-server php php-apcu php-bcmath php-cli php-common php-gd php-imap php-ldap php-mbstring php-mysql php-opcache php-pdo php-xmlreader php-xmlrpc php-xmlwriter wget
					
					systemctl start httpd
					systemctl enable httpd
					
					systemctl start mariadb
					systemctl enable mariadb
					
					# Openning http port on Firewall
					firewall-cmd --permanent --add-port=80/tcp
					firewall-cmd --reload
					setsebool -P httpd_can_network_connect on
					setsebool -P httpd_can_network_connect_db on
					setsebool -P httpd_can_sendmail on
					
					systemctl start httpd.service
					systemctl enable httpd.service
					
					setenforce 0;

				;;
				
			esac
			;;
		esac
	
	
}

ZABBIX_INSTALL ()
{

	# Enabling Zabbix TAG to On
	zabbixInstallTag=1
	
	clear 
	
	case $ID in
		
		debian)
		
			case $VERSION_ID in
								
				9)
					clear
					echo "Intalling Debian packages for Zabbix..."
					sleep 1
					apt-get -y install sudo git vim snmp snmpd python-pip libxml2 libxml2-dev curl fping libcurl3 libevent-dev libpcre3-dev libcurl3-gnutls libcurl3-gnutls-dev libcurl4-gnutls-dev build-essential libssh2-1-dev libssh2-1 libiksemel-dev libiksemel-utils libiksemel3 fping libopenipmi-dev snmp snmp-mibs-downloader libsnmp-dev libmariadbd18 libmariadbd-dev snmpd ttf-dejavu-core libltdl7 libodbc1 libgnutls28-dev libldap2-dev openjdk-8-jdk unixodbc-dev mariadb-server
					pip install zabbix-api
				;;
				
			esac
		;;
		
	
		centos)
		
			case $VERSION_ID in
				
				7)
					clear
					echo "Intalling CentOS 7 packages for Zabbix..."
					sleep 1

					yum -y install gcc python2-pip net-snmp net-snmp-devel net-snmp-utils net-snmp-libs iksemel-devel zlib-devel glibc-devel curl-devel automake libidn-devel openssl-devel rpm-devel OpenIPMI-devel libssh2-devel make fping libxml2-devel unixODBC unixODBC-devel

					pip install zabbix-api
					
				;;
				
			esac
		;;
		
	esac
	
	echo "Executing and compilling zabbix..."
	sleep 1

	## Zabbix install process

	# Creating system user
	groupadd zabbix
	useradd -g zabbix -s /bin/false zabbix
	
	sleep 1

	# Geting and compilling zabbix
	cd /tmp
	
	# Removing all zabbix old files if exist
	rm zabbix* -Rf
	
	# Getting zabbix
	wget -qO- $zabbixDownloadLink | tar -zxv
	cd $(ls -g | grep zabbix- | grep ^d | rev | cut -d" " -f1 | rev)

	# Update
	apt-get update 
	
	# Zabbix Proxy Install
	apt-get install zabbix-proxy-mysql 
	
	# Zabbix Agent Install
	apt-get install zabbix-agent

		
	# Creating DataBase
	DB_CREATE
	
	case $ID in
		
		debian)
			
						
		;;
		
		
		centos)
		
			
						
		;;
		
	esac
	
		
	# Adequando arquivos de log de zabbix-server e zabbix-agent
	mkdir /var/log/zabbix
	chown root:zabbix /var/log/zabbix
	chmod 775 /var/log/zabbix

	sed -i 's/LogFile=\/tmp\/zabbix_agentd.log*/LogFile=\/var\/log\/zabbix\/zabbix_agentd.log/' /etc/zabbix/zabbix_agentd.conf
	sed -i 's/LogFile=\/tmp\/zabbix_proxy.log*/LogFile=\/var\/log\/zabbix\/zabbix_proxy.log/' /etc/zabbix/zabbix_proxy.conf
	
	# Habilitando execução de comandos via Zabbix
	sed -i 's/# EnableRemoteCommands=0*/EnableRemoteCommands=1/' /etc/zabbix/zabbix_agentd.conf
	
	
	
	# Iniciando serviços zabbix
		
	case $ID in
			debian)
			
				systemctl start zabbix-proxy
				systemctl start zabbix-agent
				
			;;
			
			centos)
			
				systemctl start zabbix_proxy
				systemctl start zabbix_agentd
				
			;;
	esac

	
	SET_TIME_ZONE

	case $ID in
		debian)
			echo -e "# Define /zabbix alias, this is the default\n#Created by Verdanatech integraGZ.sh\n<IfModule mod_alias.c>\n    Alias /zabbix /var/www/html/zabbix\n</IfModule>\n\n<Directory \"/var/www/html/zabbix\">\n\tOptions FollowSymLinks\n\tAllowOverride None\n\tOrder allow,deny\n\tAllow from all\n\n\tphp_value max_execution_time 300\n\tphp_value memory_limit 128M\n\tphp_value post_max_size 16M\n\tphp_value upload_max_filesize 2M\n\tphp_value max_input_time 300\n\tphp_value date.timezone $timePart1/$timePart2\n\tphp_value always_populate_raw_post_data -1\n</Directory>\n\n<Directory \"/var/www/html/zabbix/conf\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/api\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include/classes\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n" > /etc/apache2/conf-available/zabbix.conf
		;;
		
		centos)
			echo -e "# Define /zabbix alias, this is the default\n#Created by Verdanatech integraGZ.sh\n<IfModule mod_alias.c>\n    Alias /zabbix /var/www/html/zabbix\n</IfModule>\n\n<Directory \"/var/www/html/zabbix\">\n\tOptions FollowSymLinks\n\tAllowOverride None\n\tOrder allow,deny\n\tAllow from all\n\n\tphp_value max_execution_time 300\n\tphp_value memory_limit 128M\n\tphp_value post_max_size 16M\n\tphp_value upload_max_filesize 2M\n\tphp_value max_input_time 300\n\tphp_value date.timezone $timePart1/$timePart2\n\tphp_value always_populate_raw_post_data -1\n</Directory>\n\n<Directory \"/var/www/html/zabbix/conf\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/api\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include/classes\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n" > /etc/httpd/conf.d/zabbix.conf
			
		;;
	esac
			
	# Set correct permissions to System resources
	
	chmod +s $(which ping)
	chmod +s $(which fping)
	chmod +s $(which ping6)
	chmod +s $(which fping6)

}

DB_CREATE ()
{

	clear 
	
	echo "Making SQL ..."
	echo "Creating Data Base for systems.."
	echo ""
	sleep 2
	
	which mysql
	
	if ( $? -ne 0 )
	then

			echo -e "ERRO: Your system does not have MariaDB installed. Installation aborted!!!"; 

		kill $$

	fi
	
	test_connection=1
	
	while [ $test_connection != 0 ]
	do
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "" 2> /dev/null
		test_connection=$?

		if [ $test_connection != 0 ]
		then
			rootPWD_SQL=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Enter the root user password for the SQL Server" --fb 10 50 3>&1 1>&2 2>&3)	
		fi
		
	done
	
	if [ $zabbixInstallTag -eq 1 ]
	then
		zabbixPWD_SQL1=0
		zabbixPWD_SQL2=1
	
		while [ $zabbixPWD_SQL1 != $zabbixPWD_SQL2 ]
		do
			zabbixPWD_SQL1=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Enter the user's password zabbix to the zabbix Database." --fb 10 60 3>&1 1>&2 2>&3) 
			zabbixPWD_SQL2=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Confirm zabbix user password." --fb 10 50 3>&1 1>&2 2>&3)
		
			if [ $zabbixPWD_SQL1 != $zabbixPWD_SQL2 ]
			then
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
					Error! Informed passwords do not match. Try again.
				" --fb 0 0 0
			fi
		done
	
		# Criando a base de dados zabbix
		echo "Creating zabbix database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create database zabbix_proxy character set utf8";
		sleep 1
		echo "Creating zabbix user at MariaDB SGBD..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create user 'zabbix'@'localhost' identified by '$zabbixPWD_SQL1'";
		sleep 1
		echo "Making zabbix user the owner to zabbix database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "grant all privileges on zabbix.* to 'zabbix'@'localhost' with grant option";

		sleep 2
	
		# Configurando /etc/zabbix/zabbix_proxy.conf
	
		sed -i 's/# DBPassword=/DBPassword='$zabbixPWD_SQL1'/' /etc/zabbix/zabbix_proxy.conf
		sed -i 's/# FpingLocation=\/usr\/sbin\/fping/FpingLocation=\/usr\/bin\/fping/' /etc/zabbix/zabbix_proxy.conf
	
		# Avisar que a base está sendo populada....
		# Popular base zabbix
		
		echo "Creating Zabbix Schema at MariaDB..."
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) zabbix < zcat /usr/share/zabbix-proxy-mysql/schema.sql.gz
		
		sleep 1
		
		$zabbixInstallTag=0
	fi
}

MAIN_MENU ()
{
 
	menu01Option=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --menu "Select a option!" --fb 15 50 6 \
	"1" "Install Zabbix Proxy 3.4" \
	"2" "About" \
	"3" "Exit" 3>&1 1>&2 2>&3)
 
	status=$?

	if [ $status != 0 ]; 
	then
	
		echo "You have selected out. Bye!"
		echo "Verdanatech Solucoes em TI..."
		sleep 2
		exit;

	fi

}

ABOUT ()
{

	clear

	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "Copyright:\n- Verdanatech Solucoes em TI, $versionDate\nLicence:\n- GPL v3 <http://www.gnu.org/licenses/>\nProject partners:\n- Gustavo Soares <slot.mg@gmail.com>\n- Halexsandro Sales <halexsandro@gmail.com>\n- Janssen Lima <janssenreislima@gmail.com>\n "  --fb 0 0 0
}

INFORMATION () 
{

	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox " 
		This script aims to perform the installation automated systems:
		- $zabbixVersion   [http://zabbix.com]
		  -- zabbix-server-mysql
		  -- zabbix-agent" 
	--fb 0 0 0

}

END_MSG ()
{
	clear
	
	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "

		Copyright:
		- Verdanatech Solucoes em TI, $versionDate
		Thank you for using our script. We are at your disposal to contact.
		$devMail
        
		Install:
		Install Zabbix Proxy 3.4 by Mariadb

	"  --fb 0 0 0

}

SET_TIME_ZONE ()
{
	
# Configura timezone do PHP para o servidor
# Ref: http://php.net/manual/pt_BR/timezones.php
# 

whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
Now we configure the servers timezone. Select the timezone that best meets!" \
--fb 10 50

while [ -z $timePart1 ]
do

timePart1=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --radiolist \
"Select the timezone for your Server!" 20 60 10 \
	"Africa" "" OFF \
	"America" "" OFF \
	"Antarctica" "" OFF \
	"Arctic" "" OFF \
	"Asia" "" OFF \
	"Atlantic" "" OFF \
	"Australia" "" OFF \
	"Europe" "" OFF \
	"Indian" "" OFF \
	"Pacific" "" OFF   \
3>&1 1>&2 2>&3)
done

case $timePart1 in

	Africa)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Abidjan" "" OFF \
			"Accra" "" OFF \
			"Addis_Ababa" "" OFF \
			"Algiers" "" OFF \
			"Asmara" "" OFF \
			"Asmera" "" OFF \
			"Bamako" "" OFF \
			"Bangui" "" OFF \
			"Banjul" "" OFF \
			"Bissau" "" OFF \
			"Blantyre" "" OFF \
			"Brazzaville" "" OFF \
			"Bujumbura" "" OFF \
			"Cairo" "" OFF \
			"Casablanca" "" OFF \
			"Ceuta" "" OFF \
			"Conakry" "" OFF \
			"Dakar" "" OFF \
			"Dar_es_Salaam" "" OFF \
			"Djibouti" "" OFF \
			"Douala" "" OFF \
			"El_Aaiun" "" OFF \
			"Freetown" "" OFF \
			"Gaborone" "" OFF \
			"Harare" "" OFF \
			"Johannesburg" "" OFF \
			"Juba" "" OFF \
			"Kampala" "" OFF \
			"Khartoum" "" OFF \
			"Kigali" "" OFF \
			"Kinshasa" "" OFF \
			"Lagos" "" OFF \
			"Libreville" "" OFF \
			"Lome" "" OFF \
			"Luanda" "" OFF \
			"Lubumbashi" "" OFF \
			"Lusaka" "" OFF \
			"Malabo" "" OFF \
			"Maputo" "" OFF \
			"Maseru" "" OFF \
			"Mbabane" "" OFF \
			"Mogadishu" "" OFF \
			"Monrovia" "" OFF \
			"Nairobi" "" OFF \
			"Ndjamena" "" OFF \
			"Niamey" "" OFF \
			"Nouakchott" "" OFF \
			"Ouagadougou" "" OFF \
			"Porto-Novo" "" OFF \
			"Sao_Tome" "" OFF \
			"Timbuktu" "" OFF \
			"Tripoli" "" OFF   3>&1 1>&2 2>&3)
	done
	;;

	America)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Adak" "" OFF \
			"Anchorage" "" OFF \
			"Anguilla" "" OFF \
			"Antigua" "" OFF \
			"Araguaina" "" OFF \
			"Argentina/Buenos_Aires" "" OFF \
			"Argentina/Catamarca" "" OFF \
			"Argentina/ComodRivadavia" "" OFF \
			"Argentina/Cordoba" "" OFF \
			"Argentina/Jujuy" "" OFF \
			"Argentina/La_Rioja" "" OFF \
			"Argentina/Mendoza" "" OFF \
			"Argentina/Rio_Gallegos" "" OFF \
			"Argentina/Salta" "" OFF \
			"Argentina/San_Juan" "" OFF \
			"Argentina/San_Luis" "" OFF \
			"Argentina/Tucuman" "" OFF \
			"Argentina/Ushuaia" "" OFF \
			"Aruba" "" OFF \
			"Asuncion" "" OFF \
			"Atikokan" "" OFF \
			"Atka" "" OFF \
			"Bahia" "" OFF \
			"Bahia_Banderas" "" OFF \
			"Barbados" "" OFF \
			"Belem" "" OFF \
			"Belize" "" OFF \
			"Blanc-Sablon" "" OFF \
			"Boa_Vista" "" OFF \
			"Bogota" "" OFF \
			"Boise" "" OFF \
			"Buenos_Aires" "" OFF \
			"Cambridge_Bay" "" OFF \
			"Campo_Grande" "" OFF \
			"Cancun" "" OFF \
			"Caracas" "" OFF \
			"Catamarca" "" OFF \
			"Cayenne" "" OFF \
			"Cayman" "" OFF \
			"Chicago" "" OFF \
			"Chihuahua" "" OFF \
			"Coral_Harbour" "" OFF \
			"Cordoba" "" OFF \
			"Costa_Rica" "" OFF \
			"Creston" "" OFF \
			"Cuiaba" "" OFF \
			"Curacao" "" OFF \
			"Danmarkshavn" "" OFF \
			"Dawson" "" OFF \
			"Dawson_Creek" "" OFF \
			"Denver" "" OFF \
			"Detroit" "" OFF \
			"Dominica" "" OFF \
			"Edmonton" "" OFF \
			"Eirunepe" "" OFF \
			"El_Salvador" "" OFF \
			"Ensenada" "" OFF \
			"Fort_Nelson" "" OFF \
			"Fort_Wayne" "" OFF \
			"Fortaleza" "" OFF \
			"Glace_Bay" "" OFF \
			"Godthab" "" OFF \
			"Goose_Bay" "" OFF \
			"Grand_Turk" "" OFF \
			"Grenada" "" OFF \
			"Guadeloupe" "" OFF \
			"Guatemala" "" OFF \
			"Guayaquil" "" OFF \
			"Guyana" "" OFF \
			"Halifax" "" OFF \
			"Havana" "" OFF \
			"Hermosillo" "" OFF \
			"Indiana/Indianapolis" "" OFF \
			"Indiana/Knox" "" OFF \
			"Indiana/Marengo" "" OFF \
			"Indiana/Petersburg" "" OFF \
			"Indiana/Tell_City" "" OFF \
			"Indiana/Vevay" "" OFF \
			"Indiana/Vincennes" "" OFF \
			"Indiana/Winamac" "" OFF \
			"Indianapolis" "" OFF \
			"Inuvik" "" OFF \
			"Iqaluit" "" OFF \
			"Jamaica" "" OFF \
			"Jujuy" "" OFF \
			"Juneau" "" OFF \
			"Kentucky/Louisville" "" OFF \
			"Kentucky/Monticello" "" OFF \
			"Knox_IN" "" OFF \
			"Kralendijk" "" OFF \
			"La_Paz" "" OFF \
			"Lima" "" OFF \
			"Los_Angeles" "" OFF \
			"Louisville" "" OFF \
			"Lower_Princes" "" OFF \
			"Maceio" "" OFF \
			"Managua" "" OFF \
			"Manaus" "" OFF \
			"Marigot" "" OFF \
			"Martinique" "" OFF \
			"Matamoros" "" OFF \
			"Mazatlan" "" OFF \
			"Mendoza" "" OFF \
			"Menominee" "" OFF \
			"Merida" "" OFF \
			"Metlakatla" "" OFF \
			"Mexico_City" "" OFF \
			"Miquelon" "" OFF \
			"Moncton" "" OFF \
			"Monterrey" "" OFF \
			"Montevideo" "" OFF \
			"Montreal" "" OFF \
			"Montserrat" "" OFF \
			"Nassau" "" OFF \
			"New_York" "" OFF \
			"Nipigon" "" OFF \
			"Nome" "" OFF \
			"Noronha" "" OFF \
			"North_Dakota/Beulah" "" OFF \
			"North_Dakota/Center" "" OFF \
			"North_Dakota/New_Salem" "" OFF \
			"Ojinaga" "" OFF \
			"Panama" "" OFF \
			"Pangnirtung" "" OFF \
			"Paramaribo" "" OFF \
			"Phoenix" "" OFF \
			"Port-au-Prince" "" OFF \
			"Port_of_Spain" "" OFF \
			"Porto_Acre" "" OFF \
			"Porto_Velho" "" OFF \
			"Puerto_Rico" "" OFF \
			"Rainy_River" "" OFF \
			"Rankin_Inlet" "" OFF \
			"Recife" "" OFF \
			"Regina" "" OFF \
			"Resolute" "" OFF \
			"Rio_Branco" "" OFF \
			"Rosario" "" OFF \
			"Santa_Isabel" "" OFF \
			"Santarem" "" OFF \
			"Santiago" "" OFF \
			"Santo_Domingo" "" OFF \
			"Sao_Paulo" "" OFF \
			"Scoresbysund" "" OFF \
			"Shiprock" "" OFF \
			"Sitka" "" OFF \
			"St_Barthelemy" "" OFF \
			"St_Johns" "" OFF \
			"St_Kitts" "" OFF \
			"St_Lucia" "" OFF \
			"St_Thomas" "" OFF \
			"St_Vincent" "" OFF \
			"Swift_Current" "" OFF \
			"Tegucigalpa" "" OFF \
			"Thule" "" OFF \
			"Thunder_Bay" "" OFF \
			"Tijuana" "" OFF \
			"Toronto" "" OFF \
			"Tortola" "" OFF \
			"Vancouver" "" OFF \
			"Virgin" "" OFF \
			"Whitehorse" "" OFF \
			"Winnipeg" "" OFF \
			"Yakutat" "" OFF   3>&1 1>&2 2>&3)
		done
		;;
		

	Antarctica)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Casey" "" OFF \
			"Davis" "" OFF \
			"DumontDUrville" "" OFF \
			"Macquarie" "" OFF \
			"Mawson" "" OFF \
			"McMurdo" "" OFF \
			"Palmer" "" OFF \
			"Rothera" "" OFF \
			"South_Pole" "" OFF \
			"Syowa" "" OFF \
			"Troll" "" OFF \
			"Vostok"  "" OFF    3>&1 1>&2 2>&3)
	done
	;;

	Arctic)
	while [ -z $timePart2 ]
	do

		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Longyearbyen" "" OFF    3>&1 1>&2 2>&3)
	done
	;;

	Asia)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Aden" "" OFF \
			"Almaty" "" OFF \
			"Amman" "" OFF \
			"Anadyr" "" OFF \
			"Aqtau" "" OFF \
			"Aqtobe" "" OFF \
			"Ashgabat" "" OFF \
			"Ashkhabad" "" OFF \
			"Baghdad" "" OFF \
			"Bahrain" "" OFF \
			"Baku" "" OFF \
			"Bangkok" "" OFF \
			"Beirut" "" OFF \
			"Bishkek" "" OFF \
			"Brunei" "" OFF \
			"Calcutta" "" OFF \
			"Chita" "" OFF \
			"Choibalsan" "" OFF \
			"Chongqing" "" OFF \
			"Chungking" "" OFF \
			"Colombo" "" OFF \
			"Dacca" "" OFF \
			"Damascus" "" OFF \
			"Dhaka" "" OFF \
			"Dili" "" OFF \
			"Dubai" "" OFF \
			"Dushanbe" "" OFF \
			"Gaza" "" OFF \
			"Harbin" "" OFF \
			"Hebron" "" OFF \
			"Ho_Chi_Minh" "" OFF \
			"Hong_Kong" "" OFF \
			"Hovd" "" OFF \
			"Irkutsk" "" OFF \
			"Istanbul" "" OFF \
			"Jakarta" "" OFF \
			"Jayapura" "" OFF \
			"Jerusalem" "" OFF \
			"Kabul" "" OFF \
			"Kamchatka" "" OFF \
			"Karachi" "" OFF \
			"Kashgar" "" OFF \
			"Kathmandu" "" OFF \
			"Katmandu" "" OFF \
			"Khandyga" "" OFF \
			"Kolkata" "" OFF \
			"Krasnoyarsk" "" OFF \
			"Kuala_Lumpur" "" OFF \
			"Kuching" "" OFF \
			"Kuwait" "" OFF \
			"Macao" "" OFF \
			"Macau" "" OFF \
			"Magadan" "" OFF \
			"Makassar" "" OFF \
			"Manila" "" OFF \
			"Muscat" "" OFF \
			"Nicosia" "" OFF \
			"Novokuznetsk" "" OFF \
			"Novosibirsk" "" OFF \
			"Omsk" "" OFF \
			"Oral" "" OFF \
			"Phnom_Penh" "" OFF \
			"Pontianak" "" OFF \
			"Pyongyang" "" OFF \
			"Qatar" "" OFF \
			"Qyzylorda" "" OFF \
			"Rangoon" "" OFF \
			"Riyadh" "" OFF \
			"Saigon" "" OFF \
			"Sakhalin" "" OFF \
			"Samarkand" "" OFF \
			"Seoul" "" OFF \
			"Shanghai" "" OFF \
			"Singapore" "" OFF \
			"Srednekolymsk" "" OFF \
			"Taipei" "" OFF \
			"Tashkent" "" OFF \
			"Tbilisi" "" OFF \
			"Tehran" "" OFF \
			"Tel_Aviv" "" OFF \
			"Thimbu" "" OFF \
			"Thimphu" "" OFF \
			"Tokyo" "" OFF \
			"Ujung_Pandang" "" OFF \
			"Ulaanbaatar" "" OFF \
			"Ulan_Bator" "" OFF \
			"Urumqi" "" OFF \
			"Ust-Nera" "" OFF \
			"Vientiane" "" OFF \
			"Vladivostok" "" OFF \
			"Yakutsk" "" OFF \
			"Yekaterinburg" "" OFF     3>&1 1>&2 2>&3)
	done
	;;

	Atlantic)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Azores" "" OFF \
			"Bermuda" "" OFF \
			"Canary" "" OFF \
			"Cape_Verde" "" OFF \
			"Faeroe" "" OFF \
			"Faroe" "" OFF \
			"Jan_Mayen" "" OFF \
			"Madeira" "" OFF \
			"Reykjavik" "" OFF \
			"South_Georgia" "" OFF \
			"St_Helena" "" OFF \
			"Stanley" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Australia)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"ACT" "" OFF \
			"Adelaide" "" OFF \
			"Brisbane" "" OFF \
			"Broken_Hill" "" OFF \
			"Canberra" "" OFF \
			"Currie" "" OFF \
			"Darwin" "" OFF \
			"Eucla" "" OFF \
			"Hobart" "" OFF \
			"LHI" "" OFF \
			"Lindeman" "" OFF \
			"Lord_Howe" "" OFF \
			"Melbourne" "" OFF \
			"North" "" OFF \
			"NSW" "" OFF \
			"Perth" "" OFF \
			"Queensland" "" OFF \
			"South" "" OFF \
			"Sydney" "" OFF \
			"Tasmania" "" OFF \
			"Victoria" "" OFF \
			"West" "" OFF \
			"Yancowinna" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Europe)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Amsterdam" "" OFF \
			"Andorra" "" OFF \
			"Athens" "" OFF \
			"Belfast" "" OFF \
			"Belgrade" "" OFF \
			"Berlin" "" OFF \
			"Bratislava" "" OFF \
			"Brussels" "" OFF \
			"Bucharest" "" OFF \
			"Budapest" "" OFF \
			"Busingen" "" OFF \
			"Chisinau" "" OFF \
			"Copenhagen" "" OFF \
			"Dublin" "" OFF \
			"Gibraltar" "" OFF \
			"Guernsey" "" OFF \
			"Helsinki" "" OFF \
			"Isle_of_Man" "" OFF \
			"Istanbul" "" OFF \
			"Jersey" "" OFF \
			"Kaliningrad" "" OFF \
			"Kiev" "" OFF \
			"Lisbon" "" OFF \
			"Ljubljana" "" OFF \
			"London" "" OFF \
			"Luxembourg" "" OFF \
			"Madrid" "" OFF \
			"Malta" "" OFF \
			"Mariehamn" "" OFF \
			"Minsk" "" OFF \
			"Monaco" "" OFF \
			"Moscow" "" OFF \
			"Nicosia" "" OFF \
			"Oslo" "" OFF \
			"Paris" "" OFF \
			"Podgorica" "" OFF \
			"Prague" "" OFF \
			"Riga" "" OFF \
			"Rome" "" OFF \
			"Samara" "" OFF \
			"San_Marino" "" OFF \
			"Sarajevo" "" OFF \
			"Simferopol" "" OFF \
			"Skopje" "" OFF \
			"Sofia" "" OFF \
			"Stockholm" "" OFF \
			"Tallinn" "" OFF \
			"Tirane" "" OFF \
			"Tiraspol" "" OFF \
			"Uzhgorod" "" OFF \
			"Vaduz" "" OFF \
			"Vatican" "" OFF \
			"Vienna" "" OFF \
			"Vilnius" "" OFF \
			"Volgograd" "" OFF \
			"Warsaw" "" OFF \
			"Zagreb" "" OFF \
			"Zaporozhye" "" OFF \
			"Zurich" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Indian)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Antananarivo" "" OFF \
			"Chagos" "" OFF \
			"Christmas" "" OFF \
			"Cocos" "" OFF \
			"Comoro" "" OFF \
			"Kerguelen" "" OFF \
			"Mahe" "" OFF \
			"Maldives" "" OFF \
			"Mauritius" "" OFF \
			"Mayotte" "" OFF \
			"Reunion" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Pacific)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Apia" "" OFF \
			"Auckland" "" OFF \
			"Bougainville" "" OFF \
			"Chatham" "" OFF \
			"Chuuk" "" OFF \
			"Easter" "" OFF \
			"Efate" "" OFF \
			"Enderbury" "" OFF \
			"Fakaofo" "" OFF \
			"Fiji" "" OFF \
			"Funafuti" "" OFF \
			"Galapagos" "" OFF \
			"Gambier" "" OFF \
			"Guadalcanal" "" OFF \
			"Guam" "" OFF \
			"Honolulu" "" OFF \
			"Johnston" "" OFF \
			"Kiritimati" "" OFF \
			"Kosrae" "" OFF \
			"Kwajalein" "" OFF \
			"Majuro" "" OFF \
			"Marquesas" "" OFF \
			"Midway" "" OFF \
			"Nauru" "" OFF \
			"Niue" "" OFF \
			"Norfolk" "" OFF \
			"Noumea" "" OFF \
			"Pago_Pago" "" OFF \
			"Palau" "" OFF \
			"Pitcairn" "" OFF \
			"Pohnpei" "" OFF \
			"Ponape" "" OFF \
			"Port_Moresby" "" OFF \
			"Rarotonga" "" OFF \
			"Saipan" "" OFF \
			"Samoa" "" OFF \
			"Tahiti" "" OFF \
			"Tarawa" "" OFF \
			"Tongatapu" "" OFF \
			"Truk" "" OFF \
			"Wake" "" OFF \
			"Wallis" "" OFF \
			"Yap" "" OFF      3>&1 1>&2 2>&3)
	done
	;;
	
esac

}

# Script start

clear

[ ! -e /usr/bin/whiptail ] && { echo 'ERRO! Not found WHIPTAIL PKG'; exit; }

MAIN_MENU

while true
do
	case $menu01Option in

		1)
			# Zabbix + VerdanatechiGZ
			REQ_TO_USE
			SET_REPOS
			LAMP_INSTALL
			ZABBIX_INSTALL
			END_MSG
			kill $$
		;;
	
		2)
			# Sobre
			ABOUT
			MAIN_MENU
		;;
	
		3)
			# Sair
			END_MSG
			kill $$
		;;

	esac

done
{
	clear

	# Test if the systen has which package
	which whiptail 

	if ( $? -ne 0 )
	then
	
			clear
			echo -e "

 ###########################################################
#                       WARNING!!!                          #
 -----------------------------------------------------------
#                                                           #
#                                                           #
# There was an error to use the whiptail package.           #
#                                                           #
#                                                           #
# The whiptail package is required to run the integraGZ.sh  #
#                                                           #
#                                                           #
 Please contact us: $devMail 
 ----------------------------------------------------------
      Verdanatech Solucoes em TI - www.verdanatech.com 
 ----------------------------------------------------------"; 

		kill $$

	fi


	# Test if the user is root

	if [ $UID -ne 0 ]
	then

		whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize! You need be the root user access to use this script. Try 'su' our 'sudo su' commands!" --fb 15 55
		kill $$
	
	fi

case $ID in
	
	debian)
	
	case $VERSION_ID in
		
		9)
		
			whiptail --title "${TITULO}" --backtitle "${BANNER}" --yesno "System GNU/Linux Debian $VERSION_ID was detected. Are we correct?. " --yes-button "Yes" --no-button "No" --fb 10 50
			
			if [ $? -eq 1 ]
			then
				
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
				kill $$
				
			fi
			
		;;
		
	esac

	;;
	
	centos)
	
	case $VERSION_ID in
		
		7)
		
			whiptail --title "${TITULO}" --backtitle "${BANNER}" --yesno "System GNU/Linux Centos $VERSION_ID was detected. Are we correct?. " --yes-button "Yes" --no-button "No" --fb 10 50
			
			if [ $? -eq 1 ]
			then
				
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
				kill $$
				
			fi
			
		;;
		
	esac

	;;
	
	
	esac

	;;
	
	*)
	
	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "We apologize!\nThis script was developed for:\nCentOS 7, Debian 9.\nWe will close the running now." --fb 15 50
	
	kill $$
	
	;;
	
esac

}

SET_REPOS ()
{

	clear 
	
	echo "Adding repositories, updating and upgrading the system..."
	
	sleep 1
	
	case $ID in

		debian)
		
			case $VERSION_ID in 
		
				9)
		
					echo "deb http://security.debian.org/debian-security stretch/updates main" > /etc/apt/sources.list
					echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
					echo "deb http://ftp.de.debian.org/debian stretch main" >> /etc/apt/sources.list
					echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" >> /etc/apt/sources.list
					
					apt-get update
					apt-get upgrade -y
					clear
					
				;;	
				
			esac
			
			;;
					
		centos)
		
			case $VERSION_ID in 
				7) 
				
					rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
					yum -y update
					yum -y upgrade
					
					clear
				
				;;
				
			esac
			
			;;
		
	esac	
}

LAMP_INSTALL ()
{
	
	case $ID in
		
		debian)
		
			case $VERSION_ID in
								
				9)
				
					clear
					echo "Intalling Debian packages for GLPI..."
					sleep 1
					apt-get -y install apache2 bsdtar bzip2 curl libapache2-mod-php7.0 libmariadbd-dev libmariadbd18 mariadb-server openjdk-8-jdk php-soap php7.0 php7.0-apcu php7.0-cli php7.0-common php7.0-curl php7.0-gd php7.0-imap php7.0-ldap php7.0-mysql php7.0-snmp php7.0-xmlrpc php7.0-xml php7.0-mbstring php7.0-bcmath
				;;	
					
			esac
			;;			

		centos)
		
			case $VERSION_ID in
				
				7)
				
					clear
					echo "Intalling CentOS packages for GLPI..."
					sleep 1
					yum -y install bsdtar git httpd httpd-devel mariadb-devel mariadb-server php php-apcu php-bcmath php-cli php-common php-gd php-imap php-ldap php-mbstring php-mysql php-opcache php-pdo php-xmlreader php-xmlrpc php-xmlwriter wget
					
					systemctl start httpd
					systemctl enable httpd
					
					systemctl start mariadb
					systemctl enable mariadb
					
					# Openning http port on Firewall
					firewall-cmd --permanent --add-port=80/tcp
					firewall-cmd --reload
					setsebool -P httpd_can_network_connect on
					setsebool -P httpd_can_network_connect_db on
					setsebool -P httpd_can_sendmail on
					
					systemctl start httpd.service
					systemctl enable httpd.service
					
					setenforce 0;

				;;
				
			esac
			;;
		esac
	
	
}

ZABBIX_INSTALL ()
{

	# Enabling Zabbix TAG to On
	zabbixInstallTag=1
	
	clear 
	
	case $ID in
		
		debian)
		
			case $VERSION_ID in
								
				9)
					clear
					echo "Intalling Debian packages for Zabbix..."
					sleep 1
					apt-get -y install sudo git python-pip libxml2 libxml2-dev curl fping libcurl3 libevent-dev libpcre3-dev libcurl3-gnutls libcurl3-gnutls-dev libcurl4-gnutls-dev build-essential libssh2-1-dev libssh2-1 libiksemel-dev libiksemel-utils libiksemel3 fping libopenipmi-dev snmp snmp-mibs-downloader libsnmp-dev libmariadbd18 libmariadbd-dev snmpd ttf-dejavu-core libltdl7 libodbc1 libgnutls28-dev libldap2-dev openjdk-8-jdk unixodbc-dev mariadb-server
					pip install zabbix-api
				;;
				
			esac
		;;
		
		centos)
		
			case $VERSION_ID in
				
				7)
					clear
					echo "Intalling CentOS 7 packages for Zabbix..."
					sleep 1

					yum -y install pcre-devel libevent-devel gcc python2-pip net-snmp net-snmp-devel net-snmp-utils net-snmp-libs iksemel-devel zlib-devel glibc-devel curl-devel automake libidn-devel openssl-devel rpm-devel OpenIPMI-devel libssh2-devel make fping libxml2-devel unixODBC unixODBC-devel

					pip install zabbix-api
					
				;;
				
			esac
		;;
		
	esac
	
	echo "Executing and compilling zabbix..."
	sleep 1

	## Zabbix install process

	# Creating system user
	groupadd zabbix
	useradd -g zabbix -s /bin/false zabbix 
	
	sleep 1

	# Geting and compilling zabbix
	cd /tmp
	
	# Removing all zabbix old files if exist
	rm zabbix* -Rf
	
	# Getting zabbix
	wget -qO- $zabbixDownloadLink | tar -zxv
	cd $(ls -g | grep zabbix- | grep ^d | rev | cut -d" " -f1 | rev)

	./configure --enable-server --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2 --with-ssh2 --with-ldap --with-iconv --with-gnutls --with-unixodbc --with-openipmi --with-jabber=/usr --enable-ipv6 --prefix=/usr/local/zabbix
	make install

	# Preparando scripts de serviço	
	ln -s /usr/local/zabbix/etc /etc/zabbix
	
	# Creating DataBase
	DB_CREATE
	
	case $ID in
		
		debian)
			
			mv misc/init.d/debian/zabbix* /etc/init.d/
			
			sed -i 's/DAEMON=\/usr\/local\/sbin\/${NAME}*/DAEMON=\/usr\/local\/zabbix\/sbin\/${NAME}/' /etc/init.d/zabbix*server
			sed -i 's/DAEMON=\/usr\/local\/sbin\/${NAME}*/DAEMON=\/usr\/local\/zabbix\/sbin\/${NAME}/' /etc/init.d/zabbix*agent*

			update-rc.d zabbix-server defaults
			update-rc.d zabbix-agent defaults
			
			cp /etc/init.d/zabbix-agent /etc/rc5.d/S02zabbix-agent
			cp /etc/init.d/zabbix-server /etc/rc5.d/S02zabbix-server
			
		;;
		
		centos)
		
			mv misc/init.d/fedora/core5/zabbix* /etc/init.d/
			
			sed -i 's/ZABBIX_BIN="\/usr\/local\/sbin\/zabbix_agentd"/ZABBIX_BIN="\/usr\/local\/zabbix\/sbin\/zabbix_agentd"/' /etc/init.d/zabbix_agentd
			sed -i 's/ZABBIX_BIN="\/usr\/local\/sbin\/zabbix_server"/ZABBIX_BIN="\/usr\/local\/zabbix\/sbin\/zabbix_server"/' /etc/init.d/zabbix_server

			chkconfig --add zabbix_server
			chkconfig --add zabbix_agentd
			chkconfig --level 35 zabbix_server on
			chkconfig --level 35 zabbix_agentd on

			systemctl enable zabbix_agentd
			systemctl enable zabbix_server
						
		;;
		
	esac
	
	chmod 775 /etc/init.d/zabbix*
	
	# Adequando arquivos de log de zabbix-server e zabbix-agent
	mkdir /var/log/zabbix
	chown root:zabbix /var/log/zabbix
	chmod 775 /var/log/zabbix

	sed -i 's/LogFile=\/tmp\/zabbix_agentd.log*/LogFile=\/var\/log\/zabbix\/zabbix_agentd.log/' /etc/zabbix/zabbix_agentd.conf
	sed -i 's/LogFile=\/tmp\/zabbix_server.log*/LogFile=\/var\/log\/zabbix\/zabbix_server.log/' /etc/zabbix/zabbix_server.conf
	
	# Habilitando execução de comandos via Zabbix
	sed -i 's/# EnableRemoteCommands=0*/EnableRemoteCommands=1/' /etc/zabbix/zabbix_agentd.conf
	
	# Criando atalhos para binários
	ln -s /usr/local/zabbix/sbin/zabbix_agentd /sbin/zabbix_agentd
	ln -s /usr/local/zabbix/sbin/zabbix_server /sbin/zabbix_server

	ln -s /usr/local/zabbix/bin/zabbix_get /bin/zabbix_get
	ln -s /usr/local/zabbix/bin/zabbix_sender /bin/zabbix_sender
	
	# Iniciando serviços zabbix
		
	case $ID in
			debian)
			
				systemctl start zabbix-server
				systemctl start zabbix-agent
				
			;;
			
			centos)
			
				systemctl start zabbix_server
				systemctl start zabbix_agentd
				
			;;
	esac

	# Preparando o zabbix frontend
	mv frontends/php /var/www/html/zabbix

	SET_TIME_ZONE

	case $ID in
		debian)
			echo -e "# Define /zabbix alias, this is the default\n#Created by Verdanatech integraGZ.sh\n<IfModule mod_alias.c>\n    Alias /zabbix /var/www/html/zabbix\n</IfModule>\n\n<Directory \"/var/www/html/zabbix\">\n\tOptions FollowSymLinks\n\tAllowOverride None\n\tOrder allow,deny\n\tAllow from all\n\n\tphp_value max_execution_time 300\n\tphp_value memory_limit 128M\n\tphp_value post_max_size 16M\n\tphp_value upload_max_filesize 2M\n\tphp_value max_input_time 300\n\tphp_value date.timezone $timePart1/$timePart2\n\tphp_value always_populate_raw_post_data -1\n</Directory>\n\n<Directory \"/var/www/html/zabbix/conf\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/api\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include/classes\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n" > /etc/apache2/conf-available/zabbix.conf
		;;
		
		centos)
			echo -e "# Define /zabbix alias, this is the default\n#Created by Verdanatech integraGZ.sh\n<IfModule mod_alias.c>\n    Alias /zabbix /var/www/html/zabbix\n</IfModule>\n\n<Directory \"/var/www/html/zabbix\">\n\tOptions FollowSymLinks\n\tAllowOverride None\n\tOrder allow,deny\n\tAllow from all\n\n\tphp_value max_execution_time 300\n\tphp_value memory_limit 128M\n\tphp_value post_max_size 16M\n\tphp_value upload_max_filesize 2M\n\tphp_value max_input_time 300\n\tphp_value date.timezone $timePart1/$timePart2\n\tphp_value always_populate_raw_post_data -1\n</Directory>\n\n<Directory \"/var/www/html/zabbix/conf\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/api\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n\n<Directory \"/var/www/html/zabbix/include/classes\">\n\tOrder deny,allow\n\tDeny from all\n\t<files *.php>\n\t\tOrder deny,allow\n\t\tDeny from all\n\t</files>\n</Directory>\n" > /etc/httpd/conf.d/zabbix.conf
			
		;;
	esac
			
	# Set correct permissions to System resources
	
	chmod +s $(which ping)
	chmod +s $(which fping)
	chmod +s $(which ping6)
	chmod +s $(which fping6)

	# Restarting http server
	
	case $ID in
		debian)
		
			# Enabling zabbix confgurations site
			a2enconf zabbix
			
			chmod 775 /var/www/html/zabbix -Rf
			chown www-data:www-data /var/www/html/zabbix -Rf
			systemctl reload apache2
		;;
		
		centos)
			chmod 775 /var/www/html/zabbix -Rf
			chown apache:apache /var/www/html/zabbix -Rf
			systemctl restart httpd.service
		;;
		
	esac	

}

DB_CREATE ()
{

	clear 
	
	echo "Making SQL ..."
	echo "Creating Data Base for systems.."
	sleep 2
	
	
	test_connection=1
	
	while [ $test_connection != 0 ]
	do
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "" 2> /dev/null
		test_connection=$?

		if [ $test_connection != 0 ]
		then
			rootPWD_SQL=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Enter the root user password for the SQL Server" --fb 10 50 3>&1 1>&2 2>&3)	
		fi
		
	done
	
	if [ $zabbixInstallTag -eq 1 ]
	then
		zabbixPWD_SQL1=0
		zabbixPWD_SQL2=1
	
		while [ $zabbixPWD_SQL1 != $zabbixPWD_SQL2 ]
		do
			zabbixPWD_SQL1=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Enter the user's password zabbix to the Database." --fb 10 50 3>&1 1>&2 2>&3) 
			zabbixPWD_SQL2=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Confirm password zabbix user to the Database." --fb 10 50 3>&1 1>&2 2>&3)
		
			if [ $zabbixPWD_SQL1 != $zabbixPWD_SQL2 ]
			then
				whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
					Error! Informed passwords do not match. Try again.
				" --fb 0 0 0
			fi
		done
	
		# Criando a base de dados zabbix
		echo "Creating zabbix database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create database zabbix character set utf8";
		echo "Creating zabbix user at MariaDB Database..."
		# Remove -p$rootPWD_SQL [deprecated]
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create user 'zabbix'@'localhost' identified by '$zabbixPWD_SQL1'";
		echo "Making zabbix user the owner to zabbix database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "grant all privileges on zabbix.* to 'zabbix'@'localhost' with grant option";

		sleep 2
	
		# Configurando /etc/zabbix/zabbix_server.conf
	
		sed -i 's/# DBPassword=/DBPassword='$zabbixPWD_SQL1'/' /etc/zabbix/zabbix_server.conf
		sed -i 's/# FpingLocation=\/usr\/sbin\/fping/FpingLocation=\/usr\/bin\/fping/' /etc/zabbix/zabbix_server.conf
	
		# Avisar que a base está sendo populada....
		# Popular base zabbix
		
		echo "Creating Zabbix Schema at MariaDB..."
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) zabbix < database/mysql/schema.sql
		echo "Importing zabbix images to MariaDB..."
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) zabbix < database/mysql/images.sql
		echo "Importing all Zabbix datas to MariaDB..."
		mysql -uroot $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) zabbix < database/mysql/data.sql
		sleep 1
		
		$zabbixInstallTag=0
	fi
	
		if [ $glpiInstallTag -eq 1 ]
		then
			glpiPWD_SQL1=0
			glpiPWD_SQL2=1
	
			while [ $glpiPWD_SQL1 != $glpiPWD_SQL2 ]
			do
				glpiPWD_SQL1=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Enter the user's password glpi to the Database." --fb 10 50 3>&1 1>&2 2>&3) 
				glpiPWD_SQL2=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --passwordbox "Confirm password glpi user to the Database." --fb 10 50 3>&1 1>&2 2>&3)
		
				if [ $glpiPWD_SQL1 != $glpiPWD_SQL2 ]
				then
					whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
						Error! Informed passwords do not match. Try again.
					" --fb 0 0 0
		
				fi
			done
	
		# Criando a base de dados glpi
		echo "Creating glpi database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create database glpi character set utf8";
		echo "Creating glpi user at MariaDB Database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "create user 'glpi'@'localhost' identified by '$glpiPWD_SQL1'";
		echo "Making glpi user the owner to glpi database..."
		mysql -u root $(if test $rootPWD_SQL ; then -p$rootPWD_SQL; fi) -e "grant all privileges on glpi.* to 'glpi'@'localhost' with grant option";
		$glpiInstallTag=0
	
	fi

}


MAIN_MENU ()
{
 
	menu01Option=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --menu "Select a option!" --fb 15 50 6 \
	"1" "Zabbix + Verdanatech iGZ" \
	"2" "About" \
	"3" "Exit" 3>&1 1>&2 2>&3)
 
	status=$?

	if [ $status != 0 ]; 
	then
	
		echo "You have selected out. Bye!"
		echo "Verdanatech Solucoes em TI..."
		sleep 2
		exit;

	fi

}

ABOUT ()
{

	clear

	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "Copyright:\n- Verdanatech Solucoes em TI, $versionDate\nLicence:\n- GPL v3 <http://www.gnu.org/licenses/>\nProject partners:\n- Gustavo Soares <slot.mg@gmail.com>\n- Halexsandro Sales <halexsandro@gmail.com>\n- Janssen Lima <janssenreislima@gmail.com>\n "  --fb 0 0 0
}

INFORMATION () 
{

	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox " 
		This script aims to perform the installation automated systems:
		  - $zabbixVersion   [http://zabbix.com]
		  -- zabbix-server-mysql
		  -- zabbix-agent" 
	--fb 0 0 0

}

END_MSG ()
{
	clear
	
	whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "

		Copyright:
		- Verdanatech Solucoes em TI, $versionDate
		Thank you for using our script. We are at your disposal to contact.
		$devMail

		Install:
        Zabbix Proxy 3.4 by Mariadb		

	"  --fb 0 0 0

}

SET_TIME_ZONE ()
{
	
# Configura timezone do PHP para o servidor
# Ref: http://php.net/manual/pt_BR/timezones.php
# 

whiptail --title "${TITULO}" --backtitle "${BANNER}" --msgbox "
Now we configure the servers timezone. Select the timezone that best meets!" \
--fb 10 50

while [ -z $timePart1 ]
do

timePart1=$(whiptail --title "${TITULO}" --backtitle "${BANNER}" --radiolist \
"Select the timezone for your Server!" 20 60 10 \
	"Africa" "" OFF \
	"America" "" OFF \
	"Antarctica" "" OFF \
	"Arctic" "" OFF \
	"Asia" "" OFF \
	"Atlantic" "" OFF \
	"Australia" "" OFF \
	"Europe" "" OFF \
	"Indian" "" OFF \
	"Pacific" "" OFF   \
3>&1 1>&2 2>&3)
done

case $timePart1 in

	Africa)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Abidjan" "" OFF \
			"Accra" "" OFF \
			"Addis_Ababa" "" OFF \
			"Algiers" "" OFF \
			"Asmara" "" OFF \
			"Asmera" "" OFF \
			"Bamako" "" OFF \
			"Bangui" "" OFF \
			"Banjul" "" OFF \
			"Bissau" "" OFF \
			"Blantyre" "" OFF \
			"Brazzaville" "" OFF \
			"Bujumbura" "" OFF \
			"Cairo" "" OFF \
			"Casablanca" "" OFF \
			"Ceuta" "" OFF \
			"Conakry" "" OFF \
			"Dakar" "" OFF \
			"Dar_es_Salaam" "" OFF \
			"Djibouti" "" OFF \
			"Douala" "" OFF \
			"El_Aaiun" "" OFF \
			"Freetown" "" OFF \
			"Gaborone" "" OFF \
			"Harare" "" OFF \
			"Johannesburg" "" OFF \
			"Juba" "" OFF \
			"Kampala" "" OFF \
			"Khartoum" "" OFF \
			"Kigali" "" OFF \
			"Kinshasa" "" OFF \
			"Lagos" "" OFF \
			"Libreville" "" OFF \
			"Lome" "" OFF \
			"Luanda" "" OFF \
			"Lubumbashi" "" OFF \
			"Lusaka" "" OFF \
			"Malabo" "" OFF \
			"Maputo" "" OFF \
			"Maseru" "" OFF \
			"Mbabane" "" OFF \
			"Mogadishu" "" OFF \
			"Monrovia" "" OFF \
			"Nairobi" "" OFF \
			"Ndjamena" "" OFF \
			"Niamey" "" OFF \
			"Nouakchott" "" OFF \
			"Ouagadougou" "" OFF \
			"Porto-Novo" "" OFF \
			"Sao_Tome" "" OFF \
			"Timbuktu" "" OFF \
			"Tripoli" "" OFF   3>&1 1>&2 2>&3)
	done
	;;

	America)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Adak" "" OFF \
			"Anchorage" "" OFF \
			"Anguilla" "" OFF \
			"Antigua" "" OFF \
			"Araguaina" "" OFF \
			"Argentina/Buenos_Aires" "" OFF \
			"Argentina/Catamarca" "" OFF \
			"Argentina/ComodRivadavia" "" OFF \
			"Argentina/Cordoba" "" OFF \
			"Argentina/Jujuy" "" OFF \
			"Argentina/La_Rioja" "" OFF \
			"Argentina/Mendoza" "" OFF \
			"Argentina/Rio_Gallegos" "" OFF \
			"Argentina/Salta" "" OFF \
			"Argentina/San_Juan" "" OFF \
			"Argentina/San_Luis" "" OFF \
			"Argentina/Tucuman" "" OFF \
			"Argentina/Ushuaia" "" OFF \
			"Aruba" "" OFF \
			"Asuncion" "" OFF \
			"Atikokan" "" OFF \
			"Atka" "" OFF \
			"Bahia" "" OFF \
			"Bahia_Banderas" "" OFF \
			"Barbados" "" OFF \
			"Belem" "" OFF \
			"Belize" "" OFF \
			"Blanc-Sablon" "" OFF \
			"Boa_Vista" "" OFF \
			"Bogota" "" OFF \
			"Boise" "" OFF \
			"Buenos_Aires" "" OFF \
			"Cambridge_Bay" "" OFF \
			"Campo_Grande" "" OFF \
			"Cancun" "" OFF \
			"Caracas" "" OFF \
			"Catamarca" "" OFF \
			"Cayenne" "" OFF \
			"Cayman" "" OFF \
			"Chicago" "" OFF \
			"Chihuahua" "" OFF \
			"Coral_Harbour" "" OFF \
			"Cordoba" "" OFF \
			"Costa_Rica" "" OFF \
			"Creston" "" OFF \
			"Cuiaba" "" OFF \
			"Curacao" "" OFF \
			"Danmarkshavn" "" OFF \
			"Dawson" "" OFF \
			"Dawson_Creek" "" OFF \
			"Denver" "" OFF \
			"Detroit" "" OFF \
			"Dominica" "" OFF \
			"Edmonton" "" OFF \
			"Eirunepe" "" OFF \
			"El_Salvador" "" OFF \
			"Ensenada" "" OFF \
			"Fort_Nelson" "" OFF \
			"Fort_Wayne" "" OFF \
			"Fortaleza" "" OFF \
			"Glace_Bay" "" OFF \
			"Godthab" "" OFF \
			"Goose_Bay" "" OFF \
			"Grand_Turk" "" OFF \
			"Grenada" "" OFF \
			"Guadeloupe" "" OFF \
			"Guatemala" "" OFF \
			"Guayaquil" "" OFF \
			"Guyana" "" OFF \
			"Halifax" "" OFF \
			"Havana" "" OFF \
			"Hermosillo" "" OFF \
			"Indiana/Indianapolis" "" OFF \
			"Indiana/Knox" "" OFF \
			"Indiana/Marengo" "" OFF \
			"Indiana/Petersburg" "" OFF \
			"Indiana/Tell_City" "" OFF \
			"Indiana/Vevay" "" OFF \
			"Indiana/Vincennes" "" OFF \
			"Indiana/Winamac" "" OFF \
			"Indianapolis" "" OFF \
			"Inuvik" "" OFF \
			"Iqaluit" "" OFF \
			"Jamaica" "" OFF \
			"Jujuy" "" OFF \
			"Juneau" "" OFF \
			"Kentucky/Louisville" "" OFF \
			"Kentucky/Monticello" "" OFF \
			"Knox_IN" "" OFF \
			"Kralendijk" "" OFF \
			"La_Paz" "" OFF \
			"Lima" "" OFF \
			"Los_Angeles" "" OFF \
			"Louisville" "" OFF \
			"Lower_Princes" "" OFF \
			"Maceio" "" OFF \
			"Managua" "" OFF \
			"Manaus" "" OFF \
			"Marigot" "" OFF \
			"Martinique" "" OFF \
			"Matamoros" "" OFF \
			"Mazatlan" "" OFF \
			"Mendoza" "" OFF \
			"Menominee" "" OFF \
			"Merida" "" OFF \
			"Metlakatla" "" OFF \
			"Mexico_City" "" OFF \
			"Miquelon" "" OFF \
			"Moncton" "" OFF \
			"Monterrey" "" OFF \
			"Montevideo" "" OFF \
			"Montreal" "" OFF \
			"Montserrat" "" OFF \
			"Nassau" "" OFF \
			"New_York" "" OFF \
			"Nipigon" "" OFF \
			"Nome" "" OFF \
			"Noronha" "" OFF \
			"North_Dakota/Beulah" "" OFF \
			"North_Dakota/Center" "" OFF \
			"North_Dakota/New_Salem" "" OFF \
			"Ojinaga" "" OFF \
			"Panama" "" OFF \
			"Pangnirtung" "" OFF \
			"Paramaribo" "" OFF \
			"Phoenix" "" OFF \
			"Port-au-Prince" "" OFF \
			"Port_of_Spain" "" OFF \
			"Porto_Acre" "" OFF \
			"Porto_Velho" "" OFF \
			"Puerto_Rico" "" OFF \
			"Rainy_River" "" OFF \
			"Rankin_Inlet" "" OFF \
			"Recife" "" OFF \
			"Regina" "" OFF \
			"Resolute" "" OFF \
			"Rio_Branco" "" OFF \
			"Rosario" "" OFF \
			"Santa_Isabel" "" OFF \
			"Santarem" "" OFF \
			"Santiago" "" OFF \
			"Santo_Domingo" "" OFF \
			"Sao_Paulo" "" OFF \
			"Scoresbysund" "" OFF \
			"Shiprock" "" OFF \
			"Sitka" "" OFF \
			"St_Barthelemy" "" OFF \
			"St_Johns" "" OFF \
			"St_Kitts" "" OFF \
			"St_Lucia" "" OFF \
			"St_Thomas" "" OFF \
			"St_Vincent" "" OFF \
			"Swift_Current" "" OFF \
			"Tegucigalpa" "" OFF \
			"Thule" "" OFF \
			"Thunder_Bay" "" OFF \
			"Tijuana" "" OFF \
			"Toronto" "" OFF \
			"Tortola" "" OFF \
			"Vancouver" "" OFF \
			"Virgin" "" OFF \
			"Whitehorse" "" OFF \
			"Winnipeg" "" OFF \
			"Yakutat" "" OFF   3>&1 1>&2 2>&3)
		done
		;;
		

	Antarctica)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Casey" "" OFF \
			"Davis" "" OFF \
			"DumontDUrville" "" OFF \
			"Macquarie" "" OFF \
			"Mawson" "" OFF \
			"McMurdo" "" OFF \
			"Palmer" "" OFF \
			"Rothera" "" OFF \
			"South_Pole" "" OFF \
			"Syowa" "" OFF \
			"Troll" "" OFF \
			"Vostok"  "" OFF    3>&1 1>&2 2>&3)
	done
	;;

	Arctic)
	while [ -z $timePart2 ]
	do

		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Longyearbyen" "" OFF    3>&1 1>&2 2>&3)
	done
	;;

	Asia)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Aden" "" OFF \
			"Almaty" "" OFF \
			"Amman" "" OFF \
			"Anadyr" "" OFF \
			"Aqtau" "" OFF \
			"Aqtobe" "" OFF \
			"Ashgabat" "" OFF \
			"Ashkhabad" "" OFF \
			"Baghdad" "" OFF \
			"Bahrain" "" OFF \
			"Baku" "" OFF \
			"Bangkok" "" OFF \
			"Beirut" "" OFF \
			"Bishkek" "" OFF \
			"Brunei" "" OFF \
			"Calcutta" "" OFF \
			"Chita" "" OFF \
			"Choibalsan" "" OFF \
			"Chongqing" "" OFF \
			"Chungking" "" OFF \
			"Colombo" "" OFF \
			"Dacca" "" OFF \
			"Damascus" "" OFF \
			"Dhaka" "" OFF \
			"Dili" "" OFF \
			"Dubai" "" OFF \
			"Dushanbe" "" OFF \
			"Gaza" "" OFF \
			"Harbin" "" OFF \
			"Hebron" "" OFF \
			"Ho_Chi_Minh" "" OFF \
			"Hong_Kong" "" OFF \
			"Hovd" "" OFF \
			"Irkutsk" "" OFF \
			"Istanbul" "" OFF \
			"Jakarta" "" OFF \
			"Jayapura" "" OFF \
			"Jerusalem" "" OFF \
			"Kabul" "" OFF \
			"Kamchatka" "" OFF \
			"Karachi" "" OFF \
			"Kashgar" "" OFF \
			"Kathmandu" "" OFF \
			"Katmandu" "" OFF \
			"Khandyga" "" OFF \
			"Kolkata" "" OFF \
			"Krasnoyarsk" "" OFF \
			"Kuala_Lumpur" "" OFF \
			"Kuching" "" OFF \
			"Kuwait" "" OFF \
			"Macao" "" OFF \
			"Macau" "" OFF \
			"Magadan" "" OFF \
			"Makassar" "" OFF \
			"Manila" "" OFF \
			"Muscat" "" OFF \
			"Nicosia" "" OFF \
			"Novokuznetsk" "" OFF \
			"Novosibirsk" "" OFF \
			"Omsk" "" OFF \
			"Oral" "" OFF \
			"Phnom_Penh" "" OFF \
			"Pontianak" "" OFF \
			"Pyongyang" "" OFF \
			"Qatar" "" OFF \
			"Qyzylorda" "" OFF \
			"Rangoon" "" OFF \
			"Riyadh" "" OFF \
			"Saigon" "" OFF \
			"Sakhalin" "" OFF \
			"Samarkand" "" OFF \
			"Seoul" "" OFF \
			"Shanghai" "" OFF \
			"Singapore" "" OFF \
			"Srednekolymsk" "" OFF \
			"Taipei" "" OFF \
			"Tashkent" "" OFF \
			"Tbilisi" "" OFF \
			"Tehran" "" OFF \
			"Tel_Aviv" "" OFF \
			"Thimbu" "" OFF \
			"Thimphu" "" OFF \
			"Tokyo" "" OFF \
			"Ujung_Pandang" "" OFF \
			"Ulaanbaatar" "" OFF \
			"Ulan_Bator" "" OFF \
			"Urumqi" "" OFF \
			"Ust-Nera" "" OFF \
			"Vientiane" "" OFF \
			"Vladivostok" "" OFF \
			"Yakutsk" "" OFF \
			"Yekaterinburg" "" OFF     3>&1 1>&2 2>&3)
	done
	;;

	Atlantic)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Azores" "" OFF \
			"Bermuda" "" OFF \
			"Canary" "" OFF \
			"Cape_Verde" "" OFF \
			"Faeroe" "" OFF \
			"Faroe" "" OFF \
			"Jan_Mayen" "" OFF \
			"Madeira" "" OFF \
			"Reykjavik" "" OFF \
			"South_Georgia" "" OFF \
			"St_Helena" "" OFF \
			"Stanley" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Australia)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"ACT" "" OFF \
			"Adelaide" "" OFF \
			"Brisbane" "" OFF \
			"Broken_Hill" "" OFF \
			"Canberra" "" OFF \
			"Currie" "" OFF \
			"Darwin" "" OFF \
			"Eucla" "" OFF \
			"Hobart" "" OFF \
			"LHI" "" OFF \
			"Lindeman" "" OFF \
			"Lord_Howe" "" OFF \
			"Melbourne" "" OFF \
			"North" "" OFF \
			"NSW" "" OFF \
			"Perth" "" OFF \
			"Queensland" "" OFF \
			"South" "" OFF \
			"Sydney" "" OFF \
			"Tasmania" "" OFF \
			"Victoria" "" OFF \
			"West" "" OFF \
			"Yancowinna" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Europe)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Amsterdam" "" OFF \
			"Andorra" "" OFF \
			"Athens" "" OFF \
			"Belfast" "" OFF \
			"Belgrade" "" OFF \
			"Berlin" "" OFF \
			"Bratislava" "" OFF \
			"Brussels" "" OFF \
			"Bucharest" "" OFF \
			"Budapest" "" OFF \
			"Busingen" "" OFF \
			"Chisinau" "" OFF \
			"Copenhagen" "" OFF \
			"Dublin" "" OFF \
			"Gibraltar" "" OFF \
			"Guernsey" "" OFF \
			"Helsinki" "" OFF \
			"Isle_of_Man" "" OFF \
			"Istanbul" "" OFF \
			"Jersey" "" OFF \
			"Kaliningrad" "" OFF \
			"Kiev" "" OFF \
			"Lisbon" "" OFF \
			"Ljubljana" "" OFF \
			"London" "" OFF \
			"Luxembourg" "" OFF \
			"Madrid" "" OFF \
			"Malta" "" OFF \
			"Mariehamn" "" OFF \
			"Minsk" "" OFF \
			"Monaco" "" OFF \
			"Moscow" "" OFF \
			"Nicosia" "" OFF \
			"Oslo" "" OFF \
			"Paris" "" OFF \
			"Podgorica" "" OFF \
			"Prague" "" OFF \
			"Riga" "" OFF \
			"Rome" "" OFF \
			"Samara" "" OFF \
			"San_Marino" "" OFF \
			"Sarajevo" "" OFF \
			"Simferopol" "" OFF \
			"Skopje" "" OFF \
			"Sofia" "" OFF \
			"Stockholm" "" OFF \
			"Tallinn" "" OFF \
			"Tirane" "" OFF \
			"Tiraspol" "" OFF \
			"Uzhgorod" "" OFF \
			"Vaduz" "" OFF \
			"Vatican" "" OFF \
			"Vienna" "" OFF \
			"Vilnius" "" OFF \
			"Volgograd" "" OFF \
			"Warsaw" "" OFF \
			"Zagreb" "" OFF \
			"Zaporozhye" "" OFF \
			"Zurich" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Indian)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Antananarivo" "" OFF \
			"Chagos" "" OFF \
			"Christmas" "" OFF \
			"Cocos" "" OFF \
			"Comoro" "" OFF \
			"Kerguelen" "" OFF \
			"Mahe" "" OFF \
			"Maldives" "" OFF \
			"Mauritius" "" OFF \
			"Mayotte" "" OFF \
			"Reunion" "" OFF      3>&1 1>&2 2>&3)
	done
	;;

	Pacific)
	while [ -z $timePart2 ]
	do
		timePart2=$(whiptail --title  "${TITULO}" --backtitle "${BANNER}" --radiolist \
		"Select the timezone for your Server!" 20 50 12 \
			"Apia" "" OFF \
			"Auckland" "" OFF \
			"Bougainville" "" OFF \
			"Chatham" "" OFF \
			"Chuuk" "" OFF \
			"Easter" "" OFF \
			"Efate" "" OFF \
			"Enderbury" "" OFF \
			"Fakaofo" "" OFF \
			"Fiji" "" OFF \
			"Funafuti" "" OFF \
			"Galapagos" "" OFF \
			"Gambier" "" OFF \
			"Guadalcanal" "" OFF \
			"Guam" "" OFF \
			"Honolulu" "" OFF \
			"Johnston" "" OFF \
			"Kiritimati" "" OFF \
			"Kosrae" "" OFF \
			"Kwajalein" "" OFF \
			"Majuro" "" OFF \
			"Marquesas" "" OFF \
			"Midway" "" OFF \
			"Nauru" "" OFF \
			"Niue" "" OFF \
			"Norfolk" "" OFF \
			"Noumea" "" OFF \
			"Pago_Pago" "" OFF \
			"Palau" "" OFF \
			"Pitcairn" "" OFF \
			"Pohnpei" "" OFF \
			"Ponape" "" OFF \
			"Port_Moresby" "" OFF \
			"Rarotonga" "" OFF \
			"Saipan" "" OFF \
			"Samoa" "" OFF \
			"Tahiti" "" OFF \
			"Tarawa" "" OFF \
			"Tongatapu" "" OFF \
			"Truk" "" OFF \
			"Wake" "" OFF \
			"Wallis" "" OFF \
			"Yap" "" OFF      3>&1 1>&2 2>&3)
	done
	;;
	
esac

}

# Script start

clear

[ ! -e /usr/bin/whiptail ] && { echo 'ERRO! Not found WHIPTAIL PKG'; exit; }

MAIN_MENU

while true
do
	case $menu01Option in

		1)
			# Zabbix Proxy 
			REQ_TO_USE
			SET_REPOS
			LAMP_INSTALL
			ZABBIX_INSTALL
			INTEGRA
			END_MSG
			kill $$
		;;
	
		2)
			# Sobre
			ABOUT
			MAIN_MENU
		;;
	
		3)
			# Sair
			END_MSG
			kill $$
		;;

	esac

done