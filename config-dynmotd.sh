#!/bin/sh
# 
# /etc/dynmotd.sh
# 
# Config script for DynMotd
# 
# Version  : 1.0
# Date : 30/03/2015 
# Auteur : Touffu - zero.sur.zero@gmail.com
# Compatible : CentOS 6&7
#

cp /etc/motd /etc/motd-maint
rm -f /etc/motd
touch /etc/motd
echo -en "\n\nsh /etc/dynmotd.sh" >> /etc/profile
touch /etc/dynmotd.sh
