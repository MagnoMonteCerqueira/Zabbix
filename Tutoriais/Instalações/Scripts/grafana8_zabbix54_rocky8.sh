#!/bin/bash

# Desabilitar selinux
sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
sudo setenforce 0

# Configurar o firewall
sudo firewall-cmd --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

## Repositório
sudo tee /etc/yum.repos.d/grafana.repo <<EOL
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOL

## Instalação grafana
sudo dnf -y install grafana

## Inicializar serviço
sudo systemctl enable --now grafana-server