#!/usr/bin/env bash

sudo apt update

#PHP
sudo apt install apache2 mariadb-server php7.4 php-pear php-mbstring php-curl php-gd zsh php-mysql zsh git curl git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev curl snapd -y

# Nodejs e npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install  nodejs npm yarn -y


DIRETORIO_DOWNLOADS="/home/donaukinder/Downloads/programas"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
MYSQL_WORKBENCH="https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.26-1ubuntu21.04_amd64.deb"
MEGA="https://mega.nz/linux/MEGAsync/xUbuntu_21.04/amd64/megasync-xUbuntu_21.04_amd64.deb"

wget -c "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"
wget -c "$MYSQL_WORKBENCH" -P "$DIRETORIO_DOWNLOADS"
wget -c "$MEGA" -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install -f -y && sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## ------------------------ VSCODE --------------------------------------#
sudo snap install code --classic -y

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

#-------------------- oh my zsh ----------------------------------------#
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install -y fonts-powerline
