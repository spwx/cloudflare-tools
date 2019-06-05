#!/bin/sh
# original version found here: https://github.com/Paul-Reed/cloudflare-ufw

# disable the firewall and delete all rules
ufw --force reset

# allow ssh
ufw allow ssh

# download the list of cloudflare IPs
DIR=`mktemp -d`
cd $DIR
wget --no-verbose https://www.cloudflare.com/ips-v4 -O ips-v4
wget --no-verbose https://www.cloudflare.com/ips-v6 -O ips-v6

# allow each cloudflare IP access to port 443
for cfip in `cat ips-v4`; do ufw allow from $cfip to any port 443 proto tcp; done
for cfip in `cat ips-v6`; do ufw allow from $cfip to any port 443 proto tcp; done

# clean up
rm -rf $DIR

# restart the firewall
ufw --force enable


# OTHER EXAMPLE RULES
# Examples to retrict to port 80
#for cfip in `cat ips-v4`; do ufw allow from $cfip to any port 80 proto tcp; done
#for cfip in `cat ips-v6`; do ufw allow from $cfip to any port 80 proto tcp; done

# Examples to restrict to port 443
#for cfip in `cat ips-v4`; do ufw allow from $cfip to any port 443 proto tcp; done
#for cfip in `cat ips-v6`; do ufw allow from $cfip to any port 443 proto tcp; done

# Example to allow cloudflare to access all ports
#for cfip in `cat ips-v4`; do ufw allow from $cfip; done
#for cfip in `cat ips-v6`; do ufw allow from $cfip; done
