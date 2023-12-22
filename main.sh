#!/bin/bash
#MIT LICENSE
CHOICE=$(whiptail --menu "Choose an option" 18 100 10 \
  "Users" "A description for the tiny option." \
  "Packages" "A description for the small option." \
  "Firewall" "A description for the medium option." \
  "Service Management" "A description for the large option." \
  "Malware Checks" "A description for the huge option." \
  "System Management" "A description for the large option." \
  "Misc" "A description for the large option." \
  "Close" "A description for the large option." 3>&1 1>&2 2>&3)

if [ -z "$CHOICE" ]; then
  echo "No option was chosen (user hit Cancel)"
else
  echo "The user chose $CHOICE"
fi
