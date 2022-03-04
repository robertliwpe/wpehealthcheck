# Health Checker for WP Engine Installs

***Note: This will ONLY work with WP Engine Installs***

Ensure that SSH Gateway access has been properly configured for your WP Engine Account

https://wpengine.com/support/ssh-gateway/

If a prompt to add the install to known hosts occurs type YES and press enter.

This script will run standard WP CLI commands as well as run wp-healthcheck CLI
commands before self cleanup to help analyze the health of your installs.

Simply clone down this entire repo with `git clone https://github.com/robertliwpe/wpehealthcheck.git` 
Then navigate to the directory and `chmod +x ./wpedeploy.sh`.
To execute simply invoke `./wpedeploy.sh`.
