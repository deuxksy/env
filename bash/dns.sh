#!/usr/bin/env bash
IP=$(curl -s ifconfig.co)
curl -s "https://<USERNAME>:<PASSWORD>@domains.google.com/nic/update?hostname=<SUBDOMAIN>.zzizily.com&myip=${IP}"