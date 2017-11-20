


##                                      Comandos utilizados Zabbix Agente!

##### A ideia e utilizar de forma simples os Comandos do Zabbix Agente.


##
##### 1) Vamos utilizar os comandos abaixo:

Versão:
```sh
zabbix_get -V 
```
![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Windows/Comandos-agente-versao.PNG)

##
Exemplos:
```sh
zabbix_get -h
```
![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Windows/Comandos-agente-exemplos.PNG)

##
##### 2) Vamos utilizar o comando para verificar servicos:

```sh
zabbix_get -s (IP DO HOST) -p 10050 -k service.discovery | python -m json.tool
```
![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Windows/Comandos-servicos.PNG)

##
## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
