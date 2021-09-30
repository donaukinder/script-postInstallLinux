#!/usr/bin/env bash

sudo apt update
sudo apt install apache2 mysql-server php7.4 php-pear php-mbstring php-curl php-gd php-mysql zsh git curl git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev curl -y

# Nodejs e npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install  nodejs yarn -y


DIRETORIO_DOWNLOADS="/home/donaukinder/Downloads/programas"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/e7d7e9a9348e6a8cc8c03f877d39cb72e5dfb1ff/code_1.60.0-1630494279_amd64.deb"
MYSQL_WORKBENCH="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.26-1ubuntu21.04_amd64.deb"
MEGA="https://mega.nz/linux/MEGAsync/xUbuntu_21.04/amd64/megasync-xUbuntu_21.04_amd64.deb"

wget -c "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE" -P "$DIRETORIO_DOWNLOADS"
wget -c "$MYSQL_WORKBENCH" -P "$DIRETORIO_DOWNLOADS"
wget -c "$MEGA" -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install -f -y && sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# ----------------------------- Composer ----------------------------- #
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
