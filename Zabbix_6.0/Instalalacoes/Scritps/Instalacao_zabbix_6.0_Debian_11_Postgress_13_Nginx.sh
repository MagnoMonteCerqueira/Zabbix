#!/bin/bash

# Faz p update dos pacotes no repositorio e instala as dependencias
apt-get update
apt-get -y install sudo
apt-get -y install gnupg2

# Install Zabbix repository
cd /tmp && wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-1+debian11_all.deb
dpkg -i zabbix-release_6.0-1+debian11_all.deb
apt update

# Install Zabbix server, frontend, agent e banco de dados
apt-get -y install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent postgresql-13

# Criar banco de dados e o usuario do banco
sudo -u postgres psql -c "create user zabbix with encrypted passwd 'zabbix'" 2>/dev/null
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix 2>/dev/null

# faz o upload das tabelas
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

# Configuração do zabbix server
sed -i "s/# DBHost=localhost/DBHost=localhost/" /etc/zabbix/zabbix_server.conf
sed -i "s/# DBPassword=/DBPassword=zabbix/" /etc/zabbix/zabbix_server.conf
 
# Configuração do postgres
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/13/main/postgresql.conf

# Configuração do nginx do zabbix
sed -i "s/#        listen          80;/        listen          80;/" /etc/zabbix/nginx.conf
sed -i "s/#        server_name     example.com;/        server_name     example.com;/" /etc/zabbix/nginx.conf
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/conf.d/zabbix.conf
sudo ln -s /etc/zabbix/nginx.conf /etc/nginx/sites-available/default
sudo ln -s /etc/zabbix/nginx.conf /etc/nginx/sites-enabled/default

# reinicia os serviços envolvidos e coloca para iniciar durante o reboot do sistema operacional
systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm postgresql@13-main 
systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm postgresql@13-main

