# Dynamic DNS with Cloudflare

## This python script does the following things

1. Gets the current IP address from https://icanhazip.com
2. Tests if the address is IPv4 or IPv6
3. Checks the specified cloudflare zone file
4. Updates each specified record with the new IP (if necessary)

## Installation

Install the requirement:
`sudo apt install python3-requests`

Clone this repo:
`git clone https://github.com/spwx/cloudflare-tools`
`cd cloudflare-tools/dynamic-dns`

*Edit the section of the file labeled "EDIT THIS"*
`vi cloudflare-dyndns`

Copy it to /usr/local/sbin/cloudflare-dyndns:
`cp cloudflare-dnydns /usr/local/sbin/cloudflare-dyndns`

Make it executable:
`chmod u+x /usr/local/sbin/cloudflare-dyndns`

### Optional: use systemd to run this every 10 minutes

Copy the unit files to the systemd directory:
`cp cloudflare-dyndns.service /etc/systemd/system/`
`cp cloudflare-dyndns.timer /etc/systemd/system/`

Start the timer:
`sudo systemctl start cloudflare-dyndns.timer`
`sudo systemctl enable cloudflare-dyndns.timer`

To make sure the timer is running:
`sudo systemctl list-timers`

To see the logs:
`sudo journalctl -u cloudflare-dyndns`
