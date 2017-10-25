
##                                      Instalação Zabbix Agente Linux Red Hat!

##### A ideia e instalar de forma simples o Zabbix Agente em Sistemas Operacionais Red Hat x CentOs.


##
##### 1) Vamos baixar e adicionar o repositório necessário para a verso desejada:

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
##### 2) Instale o zabbix-agent:
Depois de instalar os pacotes do repositório yum em nosso ambiente. Agora vamos instalar o zabbix-agent no seu sistema Linux.

```sh
$  yum install zabbix zabbix-agent
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat02.PNG)

##
##### 3) Configuração do zabbix-agent:
Depois de instalar os pacotes do repositório yum em nosso ambiente. Agora vamos instalar o zabbix-agent no seu sistema Linux.

```sh
$  yum install zabbix zabbix-agent
```

![Alt Text](https://raw.githubusercontent.com/MagnoMonteCerqueira/Zabbix/master/Dicas_e_Truques/src/img/Agents/Linux/Red_Hat/redhat03.PNG)

