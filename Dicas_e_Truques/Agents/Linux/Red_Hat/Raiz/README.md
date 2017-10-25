
##                                      Instalação Zabbix Agente Linux Red Hat!

##### A ideia e instalar de forma simples o Zabbix Agente em Sistemas Operacionais Red Hat x CentOs.


##
##### 1) Vamos baixar e adicionar o repositório necessário para a versão desejada:

CentOS/RHEL 7:

```sh
$  rpm -Uvh http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-agent-3.4.0-1.el7.x86_64.rpm
```
##
CentOS/RHEL 6:

```sh
$  rpm -Uvh http://repo.zabbix.com/zabbix/3.4/rhel/6/x86_64/zabbix-agent-3.4.0-1.el6.x86_64.rpm
```
##
CentOS/RHEL 5:

```sh
$  rpm -Uvh http://repo.zabbix.com/zabbix/3.4/rhel/5/x86_64/zabbix-agent-3.4.0-1.el5.x86_64.rpm
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat01.PNG)


##
##### 2) Instale o zabbix-agent no Linux:
Depois de instalar os pacotes do repositório. Agora vamos instalar o zabbix-agent no seu sistema Linux.

```sh
$  yum install zabbix-agent zabbix-get
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat02.PNG)

##
##### 3) Configuração do zabbix-agent.conf:
Apos o zabbix-agent instalado, vamos fazer as devidas configurações necessarias.

```sh
$  Server=XXX.XXX.XXX.XXX
$ ServerActive=XXX.XXX.XXX.XXX
$ Hostname=Nome deste servidor
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat03.PNG)


##
##### 4) Nesta etapa , Vamos reniciar o agente apos as devidas configurações:
Reinicialização  necessaria.

```sh
$  /etc/init.d/zabbix-agent restart
ou
$ service zabbix-agent restart
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat03.PNG)


