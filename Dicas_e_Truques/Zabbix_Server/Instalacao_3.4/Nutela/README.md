
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/banner_instalacao_zabbix_3.4.png)

##                                      Tutorial de instalação Nutela do Zabbix Server 3.4 no Debian 9 (x64) Stretch com banco de dados MariaBD!


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

Servidor Debian 9.


## Instalação.

##
###### 1)  Vamos acessar o servidor via ssh ou interface grafica e baixar o script de instalação:

```sh
$ cd /tmp
$ wget  https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Server/Instalacao_3.4/Nutela/Arquivos/instalador-zabbix.sh
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela01.PNG)

##
###### 2)  Vamos executar o comando abaixo para iniciar a instalação:

```sh
$ chmod +x instalador-zabbix.sh && ./instalador-zabbix.sh 
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela02.PNG)

##
###### 3)  Vamos Selecionar a instalação do Zabbix Server:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela03.PNG)

##
###### 4)  Sera informado a versao do Debian, cliquei em OK:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela04.PNG)

##
###### 5)  Aguarde a instalação:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela05.PNG)

##
###### 6)  Vamos inserir uma senha para o banco de dados do Zabbix Server:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela06.PNG)

##
###### 7)  Sera solicitado para configurar Timezone da sua regiao clique em OK:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela07.PNG)

##
###### 8) Selecione o pais, Clique em OK:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela08.PNG)

##
###### 9)  Selecione o estado, clique em OK:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela9.PNG)

##
###### 10)  No final da instalação sera informado um resumo de todas as informações de acesso, clique em OK:
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/nutela10.PNG)
##

## Configuração Zabbix Server.

###### 1) Acessando via web o IP do Zabbix Server, clique em Next step.
##
Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao01.PNG)
##
Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao02.PNG)
##
Insira a senha criada para usuario Zabbix, Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao03.PNG)
##
Em Name Coloque o nome que desejar, Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao04.PNG)
##
Em Pre-Instalação veja o resumo das configurações, Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao05.PNG)
##
Em Install, Clique em Next step:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao06.PNG)
##
Na tela de username e password (tela inicial do Zabbix Server) coloque no primeiro acesso o usuário e senha padrões são: Admin/zabbix:
##
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/instalacao07.PNG)
##


Material de Referencia:

Site: http://verdanatech.com
##
Material: http://verdanatech.com/integrando-zabbix-glpi-e-telegram/

##

## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587

