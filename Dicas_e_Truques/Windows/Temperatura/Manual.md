

##                                      Monitoramento de Temperatura de Servidores Windows com Zabbix Agente!


##### A ideia e monitorar de forma simples a temperatura do Servidor Windows com Zabbix Agente.

#### Pré requisito!

#### 1- [Zabbix Agente Instalado](https://github.com/MagnoMonteCerqueira/Zabbix/tree/master/Zabbix_3.4/Agents).

##
#### Ferramentas Necessárias:
##

#### 1- [Real Temp](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/Windows/Temperatura/Arquivos/RealTemp_370.zip).

#### 2- [Tail.exe e Gawk.exe](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/Windows/Temperatura/Arquivos/UnxUtils.zip).


##                                      Instalacao e Configuracao do RealTemp.


##
##### 1) Vamos baixar e descompactar o Real temp e disponibilizar o programa no C:\.


![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemp.PNG)

##
##### 2) Apos inserir o Real Temp no local desejado, vamos executalo!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/executar_realtemp.PNG)

##
##### 3) Com o programa iniciado, vamos verificar o arquivo RealTempLog.txt e suas informacoes!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemplog.PNG)

##
##### 4) Apos analisar o RealtempLog.txt , vamos verificar os campos que vamos utilizar (Coluna 4, 5 e 6)!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/realtemplogcol.PNG)

##
##### 5) Apos verificar o RealtempLog.txt , vamos configurar o RealTemp clicando em Settings e marcando as opcoes abaixo!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/configuracaorealtemp.PNG)



##                                      Instalacao e Configuracao do Tail.exe e Gawk.exe!


##
##### 1) Nesta Etapa , vamos descompactar a segunda ferramenta necessaria e inserir no System32.(tail.exe e Gawk.exe)!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/tail_gawk.PNG)

##
##### 2) Vamos efetuar um teste para validacao do ambiente ate aqui!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/testes.PNG)



##                                      Configurando o Zabbix Agente!

##
##### 2) Vamos efetuar a configuracao do Zabbix Agente, apos este reniciar o servico do Zabbix Agente!

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/Temperatura/configuracaodoagentezabbix.PNG)


##### Data da Coleta
UserParameter=data.coleta.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $1}"

##### Hora da Coleta
UserParameter=hora.coleta.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $2}"

##### MHZ
UserParameter=mhz.cpu.servidor,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $3}"

##### Temperatura Processador 0
UserParameter=temperatura.servidor.core0,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $4}"

##### Temperatura Processador 1
UserParameter=temperatura.servidor.core1,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $5}"

##### Utilizacao CPU
UserParameter=temperatura.cpu.servidor.load,tail -1 c:\realtemp\Realtemplog.txt | gawk "{print $6}"













##
## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
