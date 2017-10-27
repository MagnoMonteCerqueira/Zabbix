![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/zabbix.jpg)

##                                      Tutorial de instalação Raiz do Zabbix Server 3.4 no CentOs (x64) com banco de dados MariaBD!


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

Servidor CentOs 7,Apache2, MariaDB, PHPMyAdmin.


## Instalação.

##
###### 1)  vamos acessar o servidor via ssh ou interface grafica e atualizar o repositório como root:

```sh
$ apt update && apt upgrade 
```
##
###### 2)  Para a instalação do Zabbix Server 3.4 é necessário incluir no repositório as informações atualizadas do Zabbix:

```sh
# cd /tmp
# wget https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Server/Instalacao/3.4/Debian/Raiz/Arquivos/zabbix-release_3.4-1%2Bstretch_all.deb
# dpkg -i zabbix-release_3.4-1+stretch_all.deb
# apt update && apt install zabbix-server-mysql zabbix-frontend-php zabbix-agent vim php7.0-bcmath php7.0-mbstring php-sabre-xml -y
```

##
###### 3)  Após todos os passos anteriores, vamos acessar a mariadb e criar banco de dados e usuario para utilização do Zabbix Server:

```sh
# mariadb
```
##
```sh
# create database zabbix character set utf8 collate utf8_bin;
```
##
```sh
# grant all privileges on zabbix.* to zabbix@localhost identified by 'SENHA-USUARIO-ZABBIX';
```

##
```sh
# quit;
```
##
###### 4)  Apos banco de dados criado e usuario para acesso do Zabbix Server e hora de importar o esquema de tabelas e dados padrões do sistema:

```sh
# zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix
```

Digite a senha do usuario zabbix criado anteriormente para importar as tabelas.

##
###### 5)  Vamos editar o arquivo de configuração do Zabbix Server e inserir as informações abaixo:

```sh
# vim /etc/zabbix/zabbix_server.conf
```
##
```sh
#...
DBHost=localhost
#...
DBName=zabbix
#...
DBUser=zabbix
#...
DBPassword=SENHA-USUARIO-ZABBIX
#...
```
##
###### 6)  Vamos editar o arquivo de configuração do Zabbix Server dentro do Apache e inserir as informações abaixo:

```sh
# vim /etc/apache2/conf-enabled/zabbix.conf
```
##

Na Linha 19 e 28 remova o comentario (#) e coloque a data e hora de sua regiao.

```sh
#  php_value date.timezone Europe/Riga
```
##

No meu caso:
```sh
#  php_value date.timezone America/Sao_Paulo
```
##



###### 7)  Vamos Reiniciar o servidor Apache e iniciar os servicos do Zabbix Server e Zabbix Agent:
##
Apache:
```sh
# /etc/init.d/apache2 restart
```
##
Zabbix Server
```sh
# systemctl enable zabbix-server
```
##
Zabbix Agent
```sh
# systemctl enable zabbix-agent
```

###### 8)  A interface web do Zabbix estará disponível em http://SEU-IP/zabbix através do seu navegador, vamos configurar o Zabbix Server via web:


###### 8.1) Acessando via web o IP do Zabbix Server, clique em Next step.
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



##

## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
