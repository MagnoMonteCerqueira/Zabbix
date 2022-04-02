#!/bin/bash

# Desabilitar selinux
sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
setenforce 0

# Configurar o firewall
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=10051/tcp --permanent
firewall-cmd --add-port=162/udp --permanent
firewall-cmd --reload

# BANCO DE DADOS
## Repositório
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf -y module disable postgresql

## Instalação
dnf -y install postgresql13 postgresql13-server

## Configuração
/usr/pgsql-13/bin/postgresql-13-setup initdb
sed -i "s/ident/md5/g" /var/lib/pgsql/13/data/pg_hba.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /var/lib/pgsql/13/data/postgresql.conf

## Inicialização
systemctl enable --now postgresql-13

## Criação de usuário e do banco de dados do Zabbix
sudo -u postgres psql -c "CREATE USER zabbix WITH ENCRYPTED PASSWORD 'Z4bb1xD4t4b4s3'" 2>/dev/null
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix 2>/dev/null

# ZABBIX SERVER
## Repositório
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-1.el8.noarch.rpm

## Instalação
dnf -y install zabbix-server-pgsql zabbix-sql-scripts

## Configuração do banco de dados
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/create.sql.gz | sudo -u zabbix PGPASSWORD=Z4bb1xD4t4b4s3 psql -hlocalhost -Uzabbix zabbix 2>/dev/null

## Configuração do zabbix server
sed -i "s/# DBHost=localhost/DBHost=localhost/" /etc/zabbix/zabbix_server.conf
sed -i "s/# DBPassword=/DBPassword=Z4bb1xD4t4b4s3/" /etc/zabbix/zabbix_server.conf

## Inicialização
systemctl enable --now zabbix-server

# ZABBIX FRONTEND
## Instalação
dnf -y install zabbix-web-pgsql zabbix-nginx-conf

## Configuração do php-fpm
echo "php_value[date.timezone] = America/Sao_Paulo" >> /etc/php-fpm.d/zabbix.conf

## Configuração do setup web do zabbix
sudo tee /etc/zabbix/web/zabbix.conf.php <<EOL
<?php
    \$DB["TYPE"] = "POSTGRESQL";
    \$DB["SERVER"] = "localhost";
    \$DB["PORT"] = "5432";
    \$DB["DATABASE"] = "zabbix";
    \$DB["USER"] = "zabbix";
    \$DB["PASSWORD"] = "Z4bb1xD4t4b4s3";
    \$DB["SCHEMA"] = "";
    \$DB["ENCRYPTION"] = false;
    \$DB["KEY_FILE"] = "";
    \$DB["CERT_FILE"] = "";
    \$DB["CA_FILE"] = "";
    \$DB["VERIFY_HOST"] = false;
    \$DB["CIPHER_LIST"] = "";
    \$DB["VAULT_URL"] = "";
    \$DB["VAULT_DB_PATH"] = "";
    \$DB["VAULT_TOKEN"] = "";
    \$DB["DOUBLE_IEEE754"] = true;
    \$ZBX_SERVER = "localhost";
    \$ZBX_SERVER_PORT = "10051";
    \$ZBX_SERVER_NAME = "zabbix";
    \$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
EOL

## Configuração do nginx para o zabbix na raiz do site, na porta 80
sed -i "s/#        listen          80;/        listen 80 default_server;\\n        listen [::]:80 default_server;/" /etc/nginx/conf.d/zabbix.conf
sed -i "s/#        server_name     example.com;/        server_name _;/" /etc/nginx/conf.d/zabbix.conf
sed -i "/.*listen.*/d" /etc/nginx/nginx.conf
sed -i "/.*server_name.*/d" /etc/nginx/nginx.conf

## Inicialização
systemctl enable --now php-fpm
sleep 5
systemctl enable --now nginx

# ZABBIX AGENT PARA O SERVER
## Instalação
dnf -y install zabbix-agent

## Inicialização
systemctl enable --now zabbix-agent

# ACESSE NO BROWSER http://ip_ou_hostname_do_zabbix

# !!!OPICIONAL!!! HABILITAR O TIMESCALEDB
# Repositório
sudo tee /etc/yum.repos.d/timescale_timescaledb.repo <<EOL
[timescale_timescaledb]
name=timescale_timescaledb
baseurl=https://packagecloud.io/timescale/timescaledb/el/$(rpm -E %{rhel})/\$basearch
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/timescale/timescaledb/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300
EOL

# Instalação
dnf -y install timescaledb-2-postgresql-13

# Parar o Zabbix Server
systemctl stop zabbix-server

# Configuração
echo "shared_preload_libraries = 'timescaledb'" > /var/lib/pgsql/13/data/postgresql.conf
sudo sed -i "s/max_connections = 20/max_connections = 50/" /var/lib/pgsql/13/data/postgresql.conf
echo "timescaledb.license=timescale" >> /var/lib/pgsql/13/data/postgresql.conf
sudo systemctl restart postgresql-13
sudo -u postgres timescaledb-tune --quiet --yes --pg-config=/usr/pgsql-13/bin/pg_config
echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql zabbix 2>/dev/null

# Migração do banco de dados
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/timescaledb.sql.gz | sudo -u zabbix psql zabbix

# Inicialização do sistema migrado
systemctl start zabbix-server
sleep 5
systemctl restart php-fpm
sleep 5
systemctl restart nginx