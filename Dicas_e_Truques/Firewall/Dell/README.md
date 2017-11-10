


![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Firewall/Sonicwall/sonicwall-banner.jpg)

##                                      Tutorial de instalação Raiz do Zabbix Proxy 3.4 no Debian 9 (x64) Stretch com banco de dados MariaBD!


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

Servidor Debian 9, MariaDB, PHPMyAdmin.


## Instalação.

##
###### 1) Vamos acessar o servidor via ssh ou interface grafica e atualizar o repositório e atualizar o sistema como root:

```sh
$ apt update && apt upgrade 
```
##
###### 2) Para a instalação do Zabbix Proxy 3.4 é necessário incluir no repositório as informações atualizadas do Zabbix:

```sh
# cd /tmp
# wget https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Proxy/Instalacao/3.4/Debian/Raiz/Arquivos/zabbix-release_3.4-1%2Bstretch_all.deb
# dpkg -i zabbix-release_3.4-1+stretch_all.deb
# apt-get update
```
##
###### 3) Vamos instalar as dependencias necessarias para instalação do Zabbix Proxy:

```sh
# apt update && apt install vim build-essential snmp vim libssh2-1-dev libssh2-1 libopenipmi-dev libsnmp-dev wget libcurl4-gnutls-dev fping curl libcurl3-gnutls libcurl3-gnutls-dev libiksemel-dev libiksemel-utils libiksemel3 sudo libevent-dev libpcre3-dev 
 
```


## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
