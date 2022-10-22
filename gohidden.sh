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
    
    if [[ -f /usr/bin/nginx ]]; then
      echo -e "\n  $greenminus  nginx already installed - skipping"
    else
    	echo -e "\n  $greenplus installing nginx"
      apt_update && apt_update_complete && apt -y install nginx
      echo -e "\n  $greenplus  nginx - installed "
    fi
    }

apt_update
apt_upgrade
apt_autoremove
apt_update_complete
apt_upgrade_complete
apt_autoremove_complete
install_nginx
