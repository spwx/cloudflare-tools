# Only allow Cloudflare to access your webserver

Original version of script: https://github.com/Paul-Reed/cloudflare-ufw

## Installation

Clone this repo:
`git clone https://github.com/spwx/cloudflare-tools`
`cd cloudflare-tools/ufw-rules`

Copy the script to /usr/local/sbin/cloudflare-dyndns:
`cp cloudflare-ufw.sh /usr/local/sbin/cloudflare-ufw.sh`

Make it executable:
`chmod u+x /usr/local/sbin/cloudflare-ufw.sh`


## Optional: use systemd to run this every week

Copy the unit files to the systemd directory:
`cp cloudflare-ufw.{timer,service} /etc/systemd/system/`


Start the timer:
`sudo systemctl start cloudflare-ufw.timer`
`sudo systemctl enable cloudflare-ufw.timer`


## Useful commands

To make sure the timer is running:
`sudo systemctl list-timers`

To see the logs:
`sudo journalctl -u cloudflare-ufw`
