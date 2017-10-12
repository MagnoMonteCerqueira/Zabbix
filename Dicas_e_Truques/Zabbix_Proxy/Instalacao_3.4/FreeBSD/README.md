
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-3.4-pfsense.png)

##                                      Tutorial de instalação Nutela do Zabbix Proxy 3.4 no PFSense 2.3 com banco de dados Sqlite3!


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

Servidor Pfsense 2.3.

## Instalação.

##
###### 1)  Vamos acessar o servidor via web e verificar os pacotes disponibilizados para instalação:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-01.PNG)

##
###### 2)  Apos acessar o servidor PFSense via ssh e iniciar a instalação do Zabbix Proxy 3.4:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-02.PNG)


Selecione a opçao 8 para iniciar o shell.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-03.PNG)


Digite o comando abaixo para acessar a diretorio temporario:

```sh
$ cd /tmp
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-04.PNG)

Vamos baixar o script de instalação do Zabbix proxy 3.4 com o comando abaixo:
```sh
$ fetch  https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Proxy/Instalacao_3.4/FreeBSD/Arquivos/zabbix-proxy-3.4-pfsense.sh
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-05.PNG)

Vamos configurar o script de instalação para ser executado:
```sh
$ chmod +x zabbix-proxy-3.4-pfsense.sh
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-06.PNG)


Nesta etapa vamos executar o instalador:
```sh
$ ./zabbix-proxy-3.4-pfsense.sh
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-07.PNG)


Sera iniciado a instalação do Zabbix proxy 3.4:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-08.PNG)


Apos a execução do script, vai ser instalado de forma simples o Zabbix proxy 3.4 

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-09.PNG)



## Verificação.

##
###### 1)  Vamos acessar o servidor via web e verificar os pacotes instalados do Zabbix proxy 3.4:

Serviços:

```sh
$ http://PFSense via web => Serviços => Zabbix Proxy LTS
```

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-10.PNG)

Status serviços:

```sh
$ http://PFSense via web => Status => Servicos:
```

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/PFsense/zabbix-proxy-3.4-pfsense-11.PNG)



Material de Referencia:

Site: http://verdanatech.com

Material: http://verdanatech.com/zabbix-proxy-3-4-no-pfsense/

##

## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587

