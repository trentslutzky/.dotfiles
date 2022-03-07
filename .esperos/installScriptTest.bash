#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m'

echo 
echo " _________________________________________________"

printf "${NC}|${CYAN}   _____ ___________ _____ _____   _____ _____   ${NC}|\n"
printf "${NC}|${CYAN}  |     |  ___      |     |     | |  _  |  ___|  ${NC}|\n"
printf "${NC}|${CYAN}  |  |__|___  |  |  |  |__|  |__| | |_| |___  |  ${NC}|\n"
printf "${NC}|${CYAN}  |___________|  |__|________|    |_____|_____|  ${NC}|\n"
printf "${NC}|${CYAN}              |__|                               ${NC}|\n"

echo "|_________________________________________________|"
echo "|                                                 |"
echo "|   Welcome to the EsperOS installer. Please      |"
echo "|   follow the instructions that follow to set    |"
echo "|   up your system.                               |"
echo "|                                                 |"
echo "|                  Press any key to continue.     |"
read -n 1 -s -r -p "|_________________________________________________|"
echo 
echo 
echo "First we will set up hostname, username and password."
echo

hostname=""
while [[ "$hostname" == '' ]]
do
  read -p "Hostname: " hostname
  if [[ "$hostname" == '' ]]; then
    echo "Hostname cannot be blank."
  fi
done
echo

read -p "Username: " username
echo

password=""
passwordconfirm=" "

while [[ "$passwordconfirm" != "$password" ]]
do
  read -sp "Password: " password
  echo
  read -sp "Confirm Password: " passwordconfirm
  if [[ "$passwordconfirm" != "$password" ]]; then
    printf "\n\nPasswords do not match!\n\n"
  fi
done


echo
echo
printf "Hello ${CYAN}$username${NC} we can now start setting\n"
echo "up your system."
echo
echo ""

