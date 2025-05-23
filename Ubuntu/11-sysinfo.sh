#!/bin/bash

function color (){
  echo "\e[$1m$2\e[0m"
}

function findDeviceModel (){
  deviceName=""
  local hostName=$(hostname)

  if [ $hostName ]; then
    deviceName="$deviceModel - $hostName"
  else
    deviceName="$deviceModel"
  fi
}

deviceColor="38;5;16;48;5;249"
greetingsColor="38;5;103"
userColor="38;5;16;48;5;67"
codenameColor="38;5;108"
me=$(logname)
findDeviceModel

# Device Info
deviceLabel=" $(color $deviceColor " $deviceName ")"

# Greetings
me="$(color $userColor " $me ")"
codename="$(grep 'VERSION_CODENAME' /etc/os-release | cut -d '=' -f 2)"
greetings="$(color $greetingsColor "=> Welcome »") $me $(color $greetingsColor To) $(color $codenameColor $codename)\n"
greetings="$greetings$(color $greetingsColor "=> $(date +"%a %d %b %Y, %k:%M:%S")")\n"

# OS
greetings="$greetings$(color $greetingsColor "=> $(uname -srm)")"

# Print
echo -e "\n$deviceLabel"
echo -e "\n$greetings"
