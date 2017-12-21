


![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Zabbix_3.2/src/img/zabbix.jpg)

## Configuração do Background Zabbix Server 3.4 Raiz!

Neste tutorial, vou explicar em detalhes como alterar as imagens do Zabbix Server como, logo, background, ícones, de forma raiz, reconfigurando os arquivos de folha de style e suas respectivas imagens.
Nas versões anteriores do Zabbix Server, a mudança era de forma tranquila aonde era possível apenas alterar dois arquivos de forma simples hospedadas dentro da pasta general.
Nas versões 3.0, 3.2, 3.4 temos dois arquivos de folha de styles (dark-theme.css,blue-theme.css) sendo dois temas diferentes.

Agora chega de delongas e vamos pôr a mão na massa!

## Requisitos:

Conhecimento em Linux.


## Configuração.

###### 1) Vamos acessar o servidor via ssh como root e navegar ate a pasta contendo os arquivos que vamos editar no Zabbix Server:
OBS: esta pasta tem localização diferente dependendo da forma de instalação via pacote ou codigo fonte!

```sh
$ cd /usr/share/zabbix/styles/
```
##
```sh
$ vi blue-theme.css
```
##
###### 2) Vamos navegar pelo arquivo ate a linha mencionada abaixo (linha 40), vamos comentar a linha background-color:, apos este vamos inserir a imagem desejada apontando para o local da hospedagem da imagem de sua escolha! 

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/Background/background-01.PNG)

##
Comentar linha:
```sh
$ /* background-color: #ebeef0; */
```
##
Inserir imagem:

```sh
$ background:url("../img/login-zabbix.jpg");
```

##
###### 3) Vamos atualizar a pagina de login apos fazermos uma limpeza dados temporarios de navegação: 

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/Background/background-02.PNG)

##
###### 4) Centralizando a imagem:
Em casos de alta resolução e commun o tamanho da imagem nao se adequar, vamos inserir o codigo abaixo para evitarmos esses problema:

Configuração:
```sh
$ background:url("../img/login-zabbix.jpg") no-repeat center center fixed;
$ -webkit-background-size: cover;
$ -moz-background-size: cover;
$ -o-background-size: cover;
```
![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/Background/background-03.PNG)
##

Resultado:

![Alt Text](https://github.com/MagnoMonteCerqueira/Zabbix/blob/master/Dicas_e_Truques/src/img/Zabbix_Server/Background/background-04.PNG)


## Contatos:


* Telegram: @Magnopeem
* Skype: magnopeem_rj@hotmail.com
* E-mail: magnopeem@gmail.com
* Linkedin: https://br.linkedin.com/in/magno-monte-cerqueira-976b1587





## Copyright "©"  

The zabbix templates and softwares available here are released under the GNU General Public License (GPL) version 2. The formal terms of the GPL can be found at http://www.fsf.org/licenses/.








<b/>
