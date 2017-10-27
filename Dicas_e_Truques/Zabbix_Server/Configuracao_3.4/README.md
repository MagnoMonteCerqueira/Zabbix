##                                      Tutorial de Configuração Raiz do SNMP no Debian 9 (x64) Stretch!


## Introdução.

O protocolo simples de gerenciamento de rede (SNMP) é um protocolo padrão da Internet para gerenciar dispositivos em redes IP. net-snmp é a principal implementação SNMP para plataformas Linux e BSD. Nas ferramentas Ubuntu ou Debian net-snmp estão instaladas da seguinte forma:


## Requisitos:

Servidor Debian 9.


## Instalação.

###### 1) Vamos acessar o servidor via ssh e instalar o snmp:
```sh
$ apt update && apt-get install snmp snmpd snmp-mibs-downloader && download-mibs
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/SNMP/snmp01.PNG)

##
###### 2) Configurando o snmp:
vamos editar o arquivo snmp.conf com editor se sua preferencia e inserir os seguintes dados:
```sh
$ vi /etc/snmp/snmp.conf
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/SNMP/snmp02.PNG)


##
```sh
$ mibs +ALL
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/SNMP/snmp03.PNG)

##
###### 3) Reniciar o snmp:
```sh
$ /etc/init.d/snmpd restart
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/SNMP/snmp04.PNG)


## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
