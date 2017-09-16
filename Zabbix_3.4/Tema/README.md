

##                                      Alterando logo e Plano de Fundo do Zabbix 3.2 x 3.4!

##### A ideia e customizar as imagens do servidor Zabbix e Inserir um plano de fundo customizado com a logo da empresa.

##### Mudanca realizada no Zabbix Server 3.2 e 3.4


##
##### 1) Vamos acessar o Zabbix Server com o aplicativo winscp:

##### https://winscp.net/download/WinSCP-5.11.1-Portable.zip


![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados.PNG)

##
##### 2) Em LLD:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-lld.PNG)

##
##### 3) Em Graficos:

##
* 01- Disponibilidade

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-disponibilidade.PNG)

##
* 02- Latencia

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-latencia.PNG)

##
* 03- Perda de Pacotes

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-perda-de-pacote.PNG)

##
* 04- Tempo Ligado

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-tempo-ligado.PNG)

##
* 05 Paginas Impressas

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-paginas-impressas.PNG)

##
* 06 Paginas Por Dia

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-paginas-por-dia.PNG)

##
* 07 Paginas Por Semana

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-paginas-por-semana.PNG)

##
* 08 Paginas Por Mes

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-paginas-por-mes.PNG)

##
* 09 Tempo de Vida do Fusor

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-vida-do-fusor.PNG)

##
* 10 Nivel de Papel na Bandeja Tray 1

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-bandeja-01.PNG)

##
* 11 Nivel de Papel na bandeja Tray 2

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-bandeja-02.PNG)

##
* 12 Nivel de Papel na bandeja MP Tray

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-mp-01.PNG)

##
* 13 Nivel do Black Toner

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-toner-black.PNG)

##
* 14 Nivel do Cyan 

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-toner-cyan.PNG)

##
* 15 Nivel do Magenta

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-toner-magenta.PNG)

##
* 16 Nivel do Yellow

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-coletados-toner-yellow.PNG)


## Configurações Adicionais!

##### 1) Vamos acessar o arquivo de configuração abaixo e inserir a unidade de medida para informar as paginas impressas com os valores reais.

##### com o comando vim vamos editar o arquivo.
##### # vim /usr/share/zabbix/include/func.inc.php

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-editar-frontend.PNG)


##### 2) Vamos seguir ate a linha 618 e inserir na blackList a unidade de medida para postar as informações desejadas.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/impressora-lld-dados-editar-frontend-unidade.PNG)


##
## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587






