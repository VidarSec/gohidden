#!/bin/bash

set -eu

# status indicators
    greenplus='\e[1;33m[++]\e[0m'
    greenminus='\e[1;33m[--]\e[0m'

# silent mode
    silent=''                  # uncomment to see all output
    # silent='>/dev/null 2>&1' # uncomment to hide all output10
    export DEBIAN_FRONTEND=noninteractive
    export PYTHONWARNINGS=ignore

apt_update() {
    echo -e "\n  $greenplus running: apt update \n"
    eval apt -y update
    }

apt_upgrade() {
    echo -e "\n  $greenplus running: apt upgrade \n"
    eval apt -y upgrade
    }

apt_autoremove() {
    echo -e "\n  $greenplus running: apt autoremove \n"
    eval apt -y autoremove
    }

apt_update_complete() {
    echo -e "\n  $greenplus apt update - complete"
    }

apt_upgrade_complete() {
    echo -e "\n  $greenplus apt upgrade - complete"
    }

apt_autoremove_complete() {
    echo -e "\n  $greenplus apt autoremove - complete"
    }

install_nginx () {
    
    if [[ -f /var/lib/nginx ]]; then
      echo -e "\n  $greenminus  nginx already installed - skipping"
    else
    	echo -e "\n  $greenplus installing nginx"
      apt_update && apt_update_complete && apt -y install nginx
      echo -e "\n  $greenplus  nginx - installed "

    fi
    }
check_nginx () {
    systemctl start nginx
    systemctl enable nginx
    #systemctl status nginx
}

# Installing PHP and MariaDB Server
install_php_maria () {
    apt -y install php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-server mariadb-client

}

check_maria () {
    systemctl start mariadb
    systemctl enable mariadb
    #systemctl status mariadb
}

check_php () {
    systemctl start php7.4-fpm
    systemctl enable php7.4-fpm
    #systemctl status php7.4-fpm
}

# mysql secure
mysql_secure () {
    mysql_secure_installation
}

install_tor () {
    
    if [[ -f /var/lib/tor ]]; then
      echo -e "\n  $greenminus  tor already installed - skipping"
    else
    	echo -e "\n  $greenplus installing tor"
      apt_update && apt_update_complete && apt -y install tor
      echo -e "\n  $greenplus  tor - installed "
    fi
    }

#config tor
config_tor () {
    echo HiddenServiceDir /var/lib/tor/hidden_service >> /etc/tor/torrc
    echo HiddenServicePort 80 127.0.0.1:80 >> /etc/tor/torrc
    echo HiddenServiceVersion 3 >> /etc/tor/torrc
    service tor start
    service tor status
    service tor restart
}

apt_update
apt_upgrade
apt_autoremove
apt_update_complete
apt_upgrade_complete
apt_autoremove_complete
install_nginx
check_nginx
install_php_maria
check_maria
check_php
install_tor
config_tor
mysql_secure
