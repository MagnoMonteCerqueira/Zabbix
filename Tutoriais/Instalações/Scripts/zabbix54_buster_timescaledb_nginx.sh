#!/bin/bash

# Dependencias DEBIAN
sudo apt-get -q update
sudo apt-get -q -y install gnupg2

# BANCO DE DADOS
## Repositório
sudo echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

## Instalação
sudo apt-get -q update
sudo apt-get -q -y install postgresql-13

## Inicialização
sudo systemctl enable --now postgresql@13-main

## Configuração
sudo sed -i "s/ident/md5/g" /etc/postgresql/13/main/pg_hba.conf
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/13/main/postgresql.conf
sudo systemctl restart postgresql@13-main

## Criação de usuário e do banco de dados do Zabbix
sudo -u postgres psql -c "CREATE USER zabbix WITH ENCRYPTED PASSWORD 'Z4bb1xD4t4b4s3'" 2>/dev/null
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix 2>/dev/null

# ZABBIX SERVER
## Repositório
wget --quiet https://repo.zabbix.com/zabbix/5.4/debian/pool/main/z/zabbix-release/zabbix-release_5.4-1+debian10_all.deb
sudo dpkg -i zabbix-release_5.4-1+debian10_all.deb

## Instalação
sudo apt-get -q update
sudo apt-get -q -y install zabbix-server-pgsql zabbix-sql-scripts

## Configuração do banco de dados
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/create.sql.gz | sudo -u zabbix psql zabbix

## Configuração do zabbix server
sudo sed -i "s/# DBHost=localhost/DBHost=localhost/" /etc/zabbix/zabbix_server.conf
sudo sed -i "s/# DBPassword=/DBPassword=Z4bb1xD4t4b4s3/" /etc/zabbix/zabbix_server.conf

## Inicialização
sudo systemctl enable --now zabbix-server

# ZABBIX FRONTEND
## Instalação
sudo apt-get -q -y install zabbix-frontend-php php7.3-pgsql zabbix-nginx-conf

## Configuração do php-fpm
sudo echo "php_value[date.timezone] = #{PHP_TIMEZONE}" >> /etc/zabbix/php-fpm.conf

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

## Configuração do suporte ao português brasileiro e outras linguas
mkdir -p /var/lib/locales/supported.d/
rm -f /var/lib/locales/supported.d/local
cat /usr/share/zabbix/include/locales.inc.php | grep display | grep true | awk '{$1=$1};1' | cut -d"'" -f 2 | sort | xargs -I '{}' bash -c 'echo "{}.UTF-8 UTF-8"' >> /etc/locale.gen
dpkg-reconfigure --frontend noninteractive locales

## Configuração do nginx para o zabbix na raiz do site, na porta 80
sudo sed -i "s/#        listen          80;/        listen 80 default_server;\\n        listen [::]:80 default_server;/" /etc/zabbix/nginx.conf
sudo sed -i "s/#        server_name     example.com;/        server_name _;/" /etc/zabbix/nginx.conf
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/conf.d/zabbix.conf
sudo ln -s /etc/zabbix/nginx.conf /etc/nginx/sites-available/default
sudo ln -s /etc/zabbix/nginx.conf /etc/nginx/sites-enabled/default

## Inicialização
systemctl enable --now php7.3-fpm
sleep 5
systemctl enable --now nginx

# ZABBIX AGENT PARA O SERVER
## Instalação
sudo apt-get -q -y install zabbix-agent

## Inicialização
systemctl enable --now zabbix-agent

# ACESSE NO BROWSER http://ip_ou_hostname_do_zabbix

# !!!OPICIONAL!!! HABILITAR O TIMESCALEDB
# Repositório
sudo echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/timescaledb.list
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -

# Instalação
sudo apt-get -q update
sudo apt-get -q install -y timescaledb-2-postgresql-13

# Parar o Zabbix Server
systemctl stop zabbix-server

# Configuração
sudo -u postgres timescaledb-tune --quiet --yes
sudo sed -i "s/max_connections = 20/max_connections = 50/" /etc/postgresql/13/main/postgresql.conf
sudo systemctl restart postgresql@13-main
echo "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;" | sudo -u postgres psql zabbix 2>/dev/null

# Migração do banco de dados
cat /usr/share/doc/zabbix-sql-scripts/postgresql/timescaledb.sql | sudo -u zabbix psql zabbix

# Inicialização do sistema migrado
systemctl start zabbix-server
sleep 5
systemctl restart php7.3-fpm
sleep 5
systemctl restart nginx