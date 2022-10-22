#!/bin/bash
#
# gohidden.sh  Author: Vidar
# git clone https://github.com/Dewalt-arch/pimpmykali
# Usage: sudo ./pimpmykali.sh  ( defaults to the menu system )
# command line arguments are valid, only catching 1 arguement
#
# Full Revision history can be found in changelog.txt
# Standard Disclaimer: Author assumes no liability for any damage

# revision var
    revision="1.5.9"

# unicorn puke:
    red=$'\e[1;31m'
    green=$'\e[1;32m'
    blue=$'\e[1;34m'
    magenta=$'\e[1;35m'
    cyan=$'\e[1;36m'
    yellow=$'\e[1;93m'
    white=$'\e[0m'
    bold=$'\e[1m'
    norm=$'\e[21m'
    reset=$'\e[0m'

# more unicorn puke...*sigh* added for senpai, taste the rainbow!
# now with 100% more unicorn puke! enjoy a color for no color!!
    color_nocolor='\e[0m'
    color_black='\e[0;30m'
    color_grey='\e[1;30m'
    color_red='\e[0;31m'
    color_light_red='\e[1;31m'
    color_green='\e[0;32m'
    color_light_green='\e[1;32m'
    color_brown='\e[0;33m'
    color_yellow='\e[1;33m'
    color_blue='\e[0;34m'
    color_light_blue='\e[1;34m'
    color_purple='\e[0;35m'
    color_light_purple='\e[1;35m'
    color_cyan='\e[0;36m'
    color_light_cyan='\e[1;36m'
    color_light_grey='\e[0;37m'
    color_white='\e[1;37m'

# nuke impacket function launch_code generator
    launch_codes_alpha=$(echo $((1 + RANDOM % 9999)))
    launch_codes_beta=$(echo $((1 + RANDOM % 9999)))
    launch_codes_charlie=$(echo $((1 + RANDOM % 9999)))

# status indicators
    greenplus='\e[1;33m[++]\e[0m'
    greenminus='\e[1;33m[--]\e[0m'
    redminus='\e[1;31m[--]\e[0m'
    redexclaim='\e[1;31m[!!]\e[0m'
    redstar='\e[1;31m[**]\e[0m'
    blinkexclaim='\e[1;31m[\e[5;31m!!\e[0m\e[1;31m]\e[0m'
fourblinkexclaim='\e[1;31m[\e[5;31m!!!!\e[0m\e[1;31m]\e[0m'

# silent mode
        silent=''                  # uncomment to see all output
# silent='>/dev/null 2>&1' # uncomment to hide all output10
export DEBIAN_FRONTEND=noninteractive
export PYTHONWARNINGS=ignore

check_for_root () {
    if [ "$EUID" -ne 0 ]
        then echo -e "\n\n Script must be run with sudo ./gohidden.sh or as root \n"
        exit
        fi
                }

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