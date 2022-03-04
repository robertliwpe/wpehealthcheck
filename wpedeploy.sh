#!/bin/bash

printf "\r\n\r\n"
printf '\e[1;34m%-6s\e[m' "WP Engine Install Health Checker"

printf "\r\n\r\n=====================================================================================\r\n\r\n"

printf "Ensure that SSH Gateway access has been properly configured for your WP Engine Account \r\n\r\nhttps://wpengine.com/support/ssh-gateway/\r\n\r\n"
printf "If a prompt to add the install to known hosts occurs type YES and press enter.\r\n\r\n"

printf "This script will run standard WP CLI commands as well as run wp-healthcheck CLI \r\ncommands before self cleanup.\r\n\r\n"
printf '\e[1;31m%-6s\e[m' "Find the github repo here: git clone https://github.com/robertliwpe/wpehealthcheck.git"

printf "\r\n"

printf "\r\n=====================================================================================\r\n"

printf "\r\nPlease list your WP Engine installs with SPACE between:\r\n"

read wpeinstall

for wpi in $wpeinstall; do printf "\r\nTarget WPE Install: $wpi \r\n" && ssh $wpi@$wpi.ssh.wpengine.net "cd ~/sites/$wpi/ && bash -s" < ./wphealth.sh; done
