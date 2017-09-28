##                                      Template SNMP em LLD Para Nobreak!

##### A ideia desse template e facilitar a vida em poder utilizar um template para monitoramento de nobreak.

##### Este template foi criado sobre a versao do Zabbix Server 3.4.0

### O template da suporte para as seguintes nobreak APC/UPS:

##### Fabricante Schneider:
##### Modelos: Smart-UPS RT 6000 XL.


##### O que acompanha o template!

##
##### 1) Dados Coletados:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/dadoscoletados.PNG)

##
##### 2) Em LLD:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/lld.PNG)

##
##### 3) Em Graficos:

##
* 01- Disponibilidade.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/disponibilidade.PNG)

##
* 02- Latencia.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/latencia.PNG)

##
* 03- Perda de Pacotes.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/perdadepacote.PNG)

##
* 04- Tempo Ligado.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/tempoligado.PNG)

##
* 05- Carga da bateria.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/cargadabateria.PNG)

##
* 06- Tempo Estimado de uso em Bateria.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/tempoestimado.PNG)

##
* 07- Temperatura.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/temperatura.PNG)

##
* 08- Informacoes de Entrada de Carga.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/informacoesdeentrada.PNG)

##
* 09- Informacoes de Saida de Carga.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/informacoesdesaida.PNG)

##
* 10- Informacoes de By-Pass.

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.4/src/img/UPS/informacoesdebypass.PNG)




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

