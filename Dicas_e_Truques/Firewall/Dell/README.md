


![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Firewall/Sonicwall/sonicwall-banner.jpg)

##                                      Template para monitoramento Firewall Sonicwall!


## Introdução.

Década de 1990: no final da década de 1990, a empresa lançou um produto de segurança inicialmente chamado "Interpol" e mais tarde denominado "SonicWALL", um dispositivo de hardware dedicado com firewall e software VPN destinado ao mercado de pequenas empresas. À medida que as vendas para os dispositivos de segurança aceleravam rapidamente, a empresa saiu do negócio de rede add-on da Apple e reorientou-se exclusivamente como uma empresa de segurança de rede

## Requisitos:

Firewall Sonicwall

## Template para monitoramento.

A ideia desse template e facilitar a vida em poder utilizar um template unico para Firewall Sonicwall do ambiente ganhando tempo valioso ao invés de ter um template para cada host.

## O template da suporte para as seguintes Modelos:

1 => TZ 105
2 => TZ 215
3 => NSA 220
4 => NSA 3600

##
###### 1) Vamos acessar o servidor via ssh ou interface grafica e atualizar o repositório e atualizar o sistema como root:

```sh
$ apt update && apt upgrade 
```
##
###### 2) Para a instalação do Zabbix Proxy 3.4 é necessário incluir no repositório as informações atualizadas do Zabbix:

```sh
# cd /tmp
# wget https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/Zabbix_Proxy/Instalacao/3.4/Debian/Raiz/Arquivos/zabbix-release_3.4-1%2Bstretch_all.deb
# dpkg -i zabbix-release_3.4-1+stretch_all.deb
# apt-get update
```
##
###### 3) Vamos instalar as dependencias necessarias para instalação do Zabbix Proxy:

```sh
# apt update && apt install vim build-essential snmp vim libssh2-1-dev libssh2-1 libopenipmi-dev libsnmp-dev wget libcurl4-gnutls-dev fping curl libcurl3-gnutls libcurl3-gnutls-dev libiksemel-dev libiksemel-utils libiksemel3 sudo libevent-dev libpcre3-dev 
 
```


## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587
