#!/bin/bash

# Needs:
#   authgroup
#   user
#   server
source ${HOME}/.private/vpnsettings

if [ "$1" != "D" ]
then
 if [ -z "$USERNAME" ]
 then
  echo "USERNAME not specified"
  exit 1
 fi
 kextload /Library/Extensions/tun.kext
 openconnect -l -b -v \
   -u ${user} \
   --authgroup ${authgroup} \
   --script=${HOME}/.config/scripts/openconnect/vpnc-mod.sh \
   --no-cert-check \
   --csd-user=${LOGNAME} \
   --csd-wrapper=${HOME}/.config/scripts/openconnect/cstub.sh \
   https://${server}
fi

if [ "$COMMAND" == "D" ]
then
 killall openconnect
fi

