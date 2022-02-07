# template_impressora_lld_universal-version-0-0.1

## Overview

##### The idea of this template is to make life easier by being able to use a single template for the printers in the environment, saving valuable time instead of having a template for each host.
This template was created on top of Zabbix Server version 3.4, following RFC1759 and RFC3805 (Printer-MIB).

##### Links to the RFCs.

[RFC1759 Printer MIB v1](https://www.ietf.org/rfc/rfc1759.txt)

[RFC3805 Printer MIB v2](https://tools.ietf.org/html/rfc3805)

##### The template supports the following printers:
Samsung Manufacturer:
Models: Samsung K-7400LX, Samsung CLX-8640, Samsung X-4220RX, Samsung M-5370LX, Samsung CLX-6260, Samsung M4510.
HP Manufacturer:
Models: HP LaserJet 1212nf, HP LaserJet P2055dn, HP LaserJet HP3525dn.
Canon Manufacturer:
Models: Canon IR C1335.
Kyocera Manufacturer:
Models: Ecosys M2035DN.
Sharp Manufacturer:
Models: MX-2010U.
Lexmark Manufacturer:
Models: Lexmark_X656de.
What comes with the template!


Att:


Magno Monte Cerqueira

Follow me on social networks

[![Youtube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white&link=https://www.youtube.com/magnomontecerqueira?sub_confirmation=1)](https://www.youtube.com/magnomontecerqueira?sub_confirmation=1) [![Facebook Badge](https://img.shields.io/badge/Facebook-1877F2?style=for-the-badge&logo=facebook&logoColor=white&link=https://www.facebook.com/MagnoMonteCerqueira)](https://www.facebook.com/MagnoMonteCerqueira) [![Linkedin Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&link=https://www.linkedin.com/in/magnomontecerqueira/)](https://www.linkedin.com/in/magnomontecerqueira/) [![Instagram Badge](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&link=https://www.instagram.com/magnomontecerqueira/)](https://www.instagram.com/magnomontecerqueira/) [![Canal Telegram Badge](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white&link=https://t.me/+VX1MrWlXIreS3d91)](https://t.me/+VX1MrWlXIreS3d91)

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
