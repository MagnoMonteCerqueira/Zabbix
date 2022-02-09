# template_impressora_lld_universal-version-0-0.1

## Overview

##### The idea of this template is to make life easier by being able to use a single template for the printers in the environment, saving valuable time instead of having a template for each host.
This template was created on top of Zabbix Server version 5.0, following RFC1759 and RFC3805 (Printer-MIB).
##
##### Links to the RFCs.

[RFC1759 Printer MIB v1](https://www.ietf.org/rfc/rfc1759.txt)

[RFC3805 Printer MIB v2](https://tools.ietf.org/html/rfc3805)

##
##### The template supports the following printers:
##### Samsung Manufacturer: 
##### Models: Samsung K-7400LX, Samsung CLX-8640, Samsung X-4220RX, Samsung M-5370LX, Samsung CLX-6260, Samsung M4510.
##
##### HP Manufacturer: 
##### Models: HP LaserJet 1212nf, HP LaserJet P2055dn, HP LaserJet HP3525dn.
##
##### Canon Manufacturer: 
##### Models: Canon IR C1335.
##
##### Kyocera Manufacturer: 
##### Models: Ecosys M2035DN.
##
##### Sharp Manufacturer: 
##### Models: MX-2010U.
##
##### Lexmark Manufacturer: 
##### Models: Lexmark_X656de.
##

Att:


Magno Monte Cerqueira

Follow me on social networks

[![Youtube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white&link=https://www.youtube.com/magnomontecerqueira?sub_confirmation=1)](https://www.youtube.com/magnomontecerqueira?sub_confirmation=1) [![Facebook Badge](https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white&link=https://www.facebook.com/MagnoMonteCerqueira)](https://www.facebook.com/MagnoMonteCerqueira) [![Linkedin Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&link=https://www.linkedin.com/in/magnomontecerqueira/)](https://www.linkedin.com/in/magnomontecerqueira/) [![Instagram Badge](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&link=https://www.instagram.com/magnomontecerqueira/)](https://www.instagram.com/magnomontecerqueira/) [![Canal Telegram Badge](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white&link=https://t.me/+VX1MrWlXIreS3d91)](https://t.me/+VX1MrWlXIreS3d91)
 [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=whitelink=https://github.com/MagnoMonteCerqueira)](https://github.com/MagnoMonteCerqueira)

---

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|01- LLD Discovery Hardware Description|<p>-</p>|`SNMP agent`|hrDeviceDescr<p>Update: 1d</p>|
|02- LLD Fuser Discovery|<p>-</p>|`SNMP agent`|prtMarkerFusorDescription<p>Update: 1d</p>|
|03- LLD Discovery Hardware Information|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 1d</p>|
|04- LLD Discovery Paper Level MP|<p>-</p>|`SNMP agent`|prtInputDescriptionMps<p>Update: 1d</p>|
|05- LLD Discovery Paper Level Tray|<p>-</p>|`SNMP agent`|prtInputDescriptionTrays<p>Update: 1d</p>|
|06- LLD Network Discovery|<p>-</p>|`SNMP agent`|ifDescr<p>Update: 1d</p>|
|07- LLD Discovery Toners|<p>-</p>|`SNMP agent`|prtMarkerSuppliesDescriptionToners<p>Update: 1d</p>|
|08- LLD Discovery Transfer Unit|<p>-</p>|`SNMP agent`|prtMarkerSuppliesDescriptionTransfer<p>Update: 1d</p>|
|09- LLD Discovery Unit Toner	|<p>-</p>|`SNMP agent`|prtMarkerSuppliesDescription<p>Update: 1d</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Count of Printed Pages Per Month|<p>-</p>|`Calculated`|contador_impressoes_mes<p>Update: md1h00m04</p>|
|Count of Printed Pages Per Week|<p>-</p>|`Calculated`|contador_impressoes_semana<p>Update: wd1h00m03</p>|
|Formations of Printed Pages per day|<p>-</p>|`Calculated`|contador_impressoes_dia<p>Update: h00m02</p>|
|Pages Printed Per Day|<p>-</p>|`Calculated`|impressoes_dia<p>Update: 10m</p>|
|Pages Printed Per Month|<p>-</p>|`Calculated`|impressoes_mes<p>Update: 10m</p>|
|Pages Printed Per Week|<p>-</p>|`Calculated`|impressoes_semana<p>Update: 10m</p>|
|ICMP loss|<p>-</p>|`Simple check`|icmppingloss<p>Update: 1m</p>|
|ICMP ping|<p>-</p>|`Simple check`|icmpping<p>Update: 1m</p>|
|ICMP response time|<p>-</p>|`Simple check`|icmppingsec<p>Update: 1m</p>|
|Total Printed Pages|<p>-</p>|`Simple check`|prtMarkerLifeCount.1.1<p>Update: 10m</p>|
|Uptime|<p>-</p>|`Simple check`|prtMarkerLifeCount.1.1<p>Update: 10m</p>|
|01- Equipment description|<p>-</p>|`SNMP agent`|hrDeviceDescr[{#SNMPVALUE}]<p>Update: 1d</p>|
|02- Description of Device Type Equipment|<p>-</p>|`SNMP agent`|hrDeviceType[{#SNMPVALUE}]<p>Update: 1d</p>|
|03- Description of Device Type Equipment Identification|<p>-</p>|`SNMP agent`|hrDeviceIndex[{#SNMPVALUE}]<p>Update: 1d</p>|
|04- Attached Devices|<p>-</p>|`SNMP agent`|hrDeviceIndex[{#SNMPVALUE}]<p>Update: 10m</p>|
|05- Devices On Equipment Error Status|<p>-</p>|`SNMP agent`|hrDeviceErrors[{#SNMPVALUE}]<p>Update: 10m</p>|



## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Ping loss is too high {HOST.NAME}|<p>-</p>|<p>**Expression**: {template_impressora_lld_universal.xml:icmppingloss.min(2m)}>10</p><p>**Recovery expression**: </p>|Warning|
|Printer {HOST.NAME} Has Restarted|<p>-</p>|<p>**Expression**: {template_impressora_lld_universal.xml:sysUpTimeInstance.last()}<600</p><p>**Recovery expression**: </p>|Information|
|Response time is too high on Printer {HOST.NAME}|<p>-</p>|<p>**Expression**: {template_impressora_lld_universal.xml:icmppingsec.avg(5m)}>0.15</p><p>**Recovery expression**: </p>|Warning|
|{HOST.NAME} does not respond to Ping|<p>-</p>|<p>**Expression**: {template_impressora_lld_universal.xml:icmpping.max(#3)}=0</p><p>**Recovery expression**: </p>|high|


## Dashboards
[Download Grafana Dashboards](https://grafana.com/grafana/dashboards/13304)
## 

### 01- cartridge information.

![Alt Text](https://grafana.com/api/dashboards/13304/images/9228/image)

### 02- printed page information.

![Alt Text](https://grafana.com/api/dashboards/13304/images/9229/image)

### 03- General information.

![Alt Text](https://grafana.com/api/dashboards/13304/images/9231/image)



