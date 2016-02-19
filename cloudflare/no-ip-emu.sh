#!/bin/bash

# This script let's you use Cloudflare in a similar fashion to services
# like no-ip or dyndns. It requires cloudflare-cli to be installed:
#
#   sudo npm install -g cloudflare-cli
#
# Also, do not forget to configure your API token for cfcli after the
# above. 

# top level with caching enabled
DOMAIN=replaceme.com
# used as prefix for SSH host without CF caching enabled
DOMAIN_SSH=ssh

OLDIP=$(cfcli -f csv listrecords | grep "A,${DOMAIN}" | sed 's/,/ /g' | awk '{print $3}')
CURIP=$(wget http://ipinfo.io/ip -qO -)

if [ ! "${CURIP}" == "${OLDIP}" ]; then
  cfcli --ttl 300 editrecord ${DOMAIN_SSH}.${DOMAIN} ${CURIP}
  cfcli --ttl 300 editrecord ${DOMAIN} ${CURIP}  
  cfcli enablecf ${DOMAIN}
fi
