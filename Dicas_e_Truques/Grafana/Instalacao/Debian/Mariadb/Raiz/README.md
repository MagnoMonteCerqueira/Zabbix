

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/banner_instalacao_grafana_zabbix_3.4.png)

##                                      Tutorial de instalação Raiz do Grafana 4.5.2 no Debian 9 (x64) Stretch com banco de dados MariaBD!


## Introdução.

Zabbix é um software que monitora diversos parâmetros de uma rede como a integridade e desempenho dos servidores. Oferece excelentes relatórios e visualização de dados de recursos com base nos dados armazenados, e usa um mecanismo de notificação flexível que permite aos usuários configurar e-mail com alertas para qualquer evento, o que permite uma reação rápida para os problemas do servidor.
Zabbix e Open Source e multiplataforma, livre de custos de licenciamento, sendo utilizada para monitorar a disponibilidade e o desempenho de aplicações, ativos e serviços de rede por todo o mundo.

Na lista abaixo temos algumas vantagens de se utilizar o Zabbix:

* Solução Open Source;
* Suporte para SNMP (v1, v2 e v3);
* Monitoramento distribuído com administração centralizada na web;
* Agentes de alta performance (software de cliente para Linux, Solaris, HP-UX, AIX, FreeBSD, OpenBSD, OS X, Tru64/OSF1, , Windows Server Windows Desktop);
* Permissões flexíveis de usuário;
* Interface baseada na web.


## Requisitos:

Servidor Debian 9, Zabbix Server 3.4, Mariadb.


## Instalação.

##
###### 1)  Vamos acessar o servidor via ssh baixar o pacote de instalação:

```sh
$ cd /tmp
$ wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.5.2_amd64.deb
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz01.PNG)

##
###### 2)  Execute o comando abaixo para iniciar a instalação:

```sh
$ dpkg -i grafana_4.5.2_amd64.deb
$ apt-get install -y adduser libfontconfig apt-transport-https
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz02.PNG)

##
###### 3) Edite o arquivo /etc/apt/sources.list e inserir o repositorio abaixo:

```sh
$ deb  https://packagecloud.io/grafana/stable/debian stretch main 
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz03.PNG)

##
###### 4)  Instalando o Grafana, vamos efetuar o update dos pacotes e iniciar a instalação:

```sh
$ apt-get update && apt-get install grafana
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz04.PNG)

##
###### 5)  Iniciando o servidor Grafana, execute os comandos abaixo:

Inicie o servidor (serviço init.d).
```sh
$ service grafana-server start 
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz05.PNG)

Inicie o servidor (via systemd).
```sh
$ systemctl daemon-reload
$ systemctl start grafana-server
$ systemctl start grafana-server
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz6.PNG)

Iniciando o Grafana no boot do sistema.
```sh
$ update-rc.d grafana-server defaults
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz07.PNG)

Ative o serviço do sistema para que o Grafana comece no início.
```sh
$ systemctl enable grafana-server.service
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz08.PNG)

##
###### 6)  Verificando logs do servidor Grafana, execute os comandos abaixo:
Por padrão, Grafana irá gerar logs em:
```sh
$ tail -f /var/log/grafana/grafana.log
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz09.PNG)

##
###### 7)  Verificando base de dados do servidor Grafana:
A configuração padrão especifica um banco de dados sqlite3 localizado em:
```sh
$ cd /var/lib/grafana/
$ ls
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz10.PNG)

##
###### 8)  Configurações do servidor Grafana:
O arquivo de configuração está localizado em: 
```sh
$ vi /etc/grafana/grafana.ini
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz11.PNG)


## Configurando banco de dados Mariadb.

###### 1)  Etapas detalhadas de configurações do banco de dados para o servidor do Grafana:
No Servidor do Mariadb, vamos criar o banco de dados para uso do Grafana: 
```sh
$ create database grafana;
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz12.PNG)

##
###### 2)  Criando o usuario do banco de dados para o servidor do Grafana:
Criando o usuario para uso do banco do Grafana: 
```sh
$ GRANT USAGE ON `grafana`.* to 'grafana'@'%' identified by 'bancografana';
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz13.PNG)

##
###### 3)  Dando privilegios para o usuario do banco de dados para o servidor do Grafana:
Dando privilegios para o usuario para uso do banco do Grafana: 
```sh
$ GRANT ALL PRIVILEGES ON `grafana`.* to 'grafana'@'%' with grant option;
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz14.PNG)

##
Criando as tabelas do banco do Grafana: 
```sh
$ use grafana;
$ create table `session` (`key`   char(16) not null,`data`  blob,`expiry` int(11) unsigned not null,primary key (`key`) )  ENGINE=MyISAM default charset=utf8;
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz14-1.PNG)

##
###### 4)  Atualizando as tabelas do servidor Mariadb:
Atualizando as tabelas: 
```sh
$ flush privileges;
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz15.PNG)

## Configurando o Grafana para conexao com Mariadb:

##
###### 1)  Configurando o servidor do Grafana para acesso ao banco Mariadb:
Configurando acesso ao Mariadb: 

```sh
$ vi /etc/grafana/grafana.ini
```
```sh
$ [database]
$ # Either "mysql", "postgres" or "sqlite3", it's your choice
$ type = mysql
$ host = 127.0.0.1:3306
$ name = grafana
$ user = grafana
$ password =bancografana
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz16.PNG)
##

```sh
$ [session]
$ provider = mysql
$ provider_config = `grafana:grafanamysqluserpasswd@tcp(127.0.0.1:3306)/grafana` 
$ provider = mysql
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz16-1.PNG)

##
###### 2)  Configurando o servidor do Grafana para acesso ao banco Mariadb:
Reniciando o Grafana: 

```sh
$  systemctl restart grafana-server
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz17.PNG)


##
###### 2)  Configurando o servidor do Grafana para acesso ao banco Mariadb:
Reniciando o Grafana: 

```sh
$  systemctl restart grafana-server
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz18.PNG)


## Acessando o Grafana via web:

##
###### 1)  Acessar o servidor Grafana via web:
para acessar o servidor grafana via web , vamos inserir as informações abaixo em seu navegador:

```sh
$  http://IP-SERVIDOR:3000
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz19.PNG)

##
```sh
$ Usuario: admin
$ Senha: admin
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz20.PNG)


## Plugin de integracao Zabbix Server x Grafana:

###### 1)  Acessar o servidor Grafana via ssh:
Após a instalação do Grafana, devemos instalar o Plugin do Zabbix via Grafana CLI:

```sh
$  grafana-cli plugins install alexanderzobnin-zabbix-app
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz21.PNG)
##

###### 2)  Vamos reiniciar o serviço do Grafana:
Após a instalação do Plugin, devemos reiniciar o Grafana:

```sh
$  /etc/init.d/grafana-server restart
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz22.PNG)
##

###### 3)  Vamos configurar o plugin instalado no Grafana:
Acessar o grafana via web (http://IP-DO-SERVIDOR-GRAFANA:3000) => plugins => App, Clique no Plugin do Zabbix

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz23.PNG)
##

###### 4)  Vamos Ativar o plugin instalado no Grafana:
Clique em Enable no Plugin do Zabbix

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz24.PNG)
##


## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587

