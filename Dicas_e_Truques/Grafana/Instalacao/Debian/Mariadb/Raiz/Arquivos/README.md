
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
$ wget  wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.5.2_amd64.deb
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz01.PNG)

##
###### 2)  Vamos executar o comando abaixo para iniciar a instalação:

```sh
$ dpkg -i grafana_4.5.2_amd64.deb
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz02.PNG)

##
###### 3)  Vamos Selecionar a instalação do Zabbix Server:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Grafana/grafanaraiz03.PNG)
