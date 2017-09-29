
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Zabbix_server/banner_instalacao_zabbix_3.4.png)

##                                      Tutorial de instalação Raiz do Zabbix Server 3.4 no Debian 9 (x64) Stretch com banco de dados MariaBD!


##### Introdução.

Zabbix é um software que monitora diversos parâmetros de uma rede como a integridade e desempenho dos servidores. Oferece excelentes relatórios e visualização de dados de recursos com base nos dados armazenados, e usa um mecanismo de notificação flexível que permite aos usuários configurar e-mail com alertas para qualquer evento, o que permite uma reação rápida para os problemas do servidor.
Zabbix e Open Source e multiplataforma, livre de custos de licenciamento, sendo utilizada para monitorar a disponibilidade e o desempenho de aplicações, ativos e serviços de rede por todo o mundo.

Na lista abaixo temos algumas vantagens de se utilizar o Zabbix:

* Solução Open Source;
* Suporte para SNMP (v1, v2 e v3);
* Monitoramento distribuído com administração centralizada na web;
* Agentes de alta performance (software de cliente para Linux, Solaris, HP-UX, AIX, FreeBSD, OpenBSD, OS X, Tru64/OSF1, , Windows Server Windows Desktop);
* Permissões flexíveis de usuário;
* Interface baseada na web.


#### Requisitos:

Servidor Debian 9, Servidor web Apache2, PHP 7.0, MariaDB, PHPMyAdmin.

#### Pré requisito!

#### 1- [Zabbix Agente Instalado](https://github.com/MagnoMonteCerqueira/Zabbix/tree/master/Zabbix_3.4/Agents).

##
#### Ferramentas Necessárias:
##

#### 1- [Real Temp](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/Windows/Temperatura/Arquivos/RealTemp_370.zip).

#### 2- [Tail.exe e Gawk.exe](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/Windows/Temperatura/Arquivos/UnxUtils.zip).


##                                      Instalação e Configuração do RealTemp.


##
##### 1) Vamos baixar e descompactar o Real temp e disponibilizar o programa no C:\.


![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemp.PNG)

##
##### 2) Após inserir o Real Temp no local desejado, vamos executalo!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/executar_realtemp.PNG)

##
##### 3) Com o programa iniciado, vamos verificar o arquivo RealTempLog.txt e suas informações!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemplog.PNG)

##
##### 4) Após analisar o RealtempLog.txt , vamos verificar os campos que vamos utilizar!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemplogcol.PNG)

##
##### 5) Verificando o RealtempLog.txt , vamos configurar o RealTemp clicando em Settings e marcando as opções abaixo!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/configuracaorealtemp.PNG)



##                                      Instalação e Configuração do Tail.exe e Gawk.exe!


##
##### 1) Nesta Etapa , vamos descompactar a segunda ferramenta necessária e inserir no System32.(tail.exe e Gawk.exe)!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/tail_gawk.PNG)

##
##### 2) Vamos efetuar um teste para validação do ambiente ate aqui!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/testes.PNG)



##                                      Configurando o Zabbix Agente!

##
##### 2) Vamos efetuar a configuração do Zabbix Agente, Reiniciar o serviço do Zabbix Agente!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/configuracaodoagentezabbix.PNG)

```sh
##
##### Data da Coleta
UserParameter=data.coleta.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $1}"

##
##### Hora da Coleta
UserParameter=hora.coleta.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $2}"

##
##### MHZ
UserParameter=mhz.cpu.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $3}"

##
##### Temperatura Processador 0
UserParameter=temperatura.servidor.core0,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $4}"

##
##### Temperatura Processador 1
UserParameter=temperatura.servidor.core1,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $5}"

##
##### Utilizacao CPU
UserParameter=temperatura.cpu.servidor.load,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $6}"
```
##

##                                      Criando Template Para Zabbix Agente!

##
##### Vamos criar o template para coleta dos dados!

##### 1) Data da Coleta

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/datadacoleta.PNG)

##

##### 2) Frequência da CPU

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/frequenciadacpu.PNG)

##

##### 3) Hora da Coleta

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/horadacoleta.PNG)

##

##### 4) Temperatura da CPU 0

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/Temperaturacpu0.PNG)

##

##### 5) Temperatura da CPU 1

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/Temperaturacpu1.PNG)

##

##### 6) Utilizacao da CPU

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/utilizacaocpu.PNG)

##

##### 7) Resultado das Coletas!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/Resultadocoletas.PNG)

##### 8) Template Pronto!

[Template Temperatura](https://github.com/MagnoMonteCerqueira/Zabbix/tree/master/Zabbix_3.4/Windows/Temperatura)

##

## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
