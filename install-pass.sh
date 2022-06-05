#!/usr/bin/env bash

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update


sudo apt install apache2 mariadb-server  git curl git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev curl snapd zsh -y

sudo add-apt-repository ppa:ondrej/php -y

sudo apt install php php-pear php-mbstring php-curl php-gd zsh php-mysql -y


# Nodejs e npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install  nodejs -y

## ------------------------ Programas --------------------------------------#
DIRETORIO_DOWNLOADS="/home/donaukinder/Downloads/programas"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

wget -c "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install -f -y && sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## ------------------------ Dev --------------------------------------#
sudo snap install code --classic
sudo snap install mysql-workbench-community
sudo snap connect mysql-workbench-community:password-manager-service
sudo snap connect mysql-workbench-community:ssh-keys

# ----------------------------- Composer ----------------------------- #
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# ---------------------------------------------------------------------- #

#-------------------- oh my zsh ----------------------------------------#
sudo apt-get install -y fonts-powerline
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
