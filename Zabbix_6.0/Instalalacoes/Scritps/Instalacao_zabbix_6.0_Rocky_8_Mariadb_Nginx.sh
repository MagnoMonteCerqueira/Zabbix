#!/bin/bash

# Desabilita o selinux no rocky 8
sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
setenforce 0

# Configurar firewall 
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=10050/tcp --permanent
firewall-cmd --add-port=10051/tcp --permanent
firewall-cmd --reload

# baixa o repositorio 
cd /tmp 
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-1.el8.noarch.rpm
dnf clean all

# Instala os pacotes necessarios
dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent mariadb-server 

# inicia o banco de dados
systemctl start mariadb.service

# cria banco
mysql -e "create database zabbix character set utf8mb4 collate utf8mb4_bin"
mysql -e "create user zabbix@localhost identified by 'zabbix'"
mysql -e "grant all privileges on zabbix.* to zabbix@localhost"


# faz upload das tabelas
 zcat /usr/share/doc/zabbix-sql-scripts/mysql/server.sql.gz | mysql zabbix


# Configuração do zabbix server
sudo sed -i "s/# DBHost=localhost/DBHost=localhost/" /etc/zabbix/zabbix_server.conf
sudo sed -i "s/# DBPassword=/DBPassword=zabbix/" /etc/zabbix/zabbix_server.conf

# reinicia os servicos e habilita para iniciar no boot
systemctl restart zabbix-server zabbix-agent httpd php-fpm mariadb.service
systemctl enable zabbix-server zabbix-agent httpd php-fpm mariadb.service

