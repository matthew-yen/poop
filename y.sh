#!/bin/bash

# This script will list users, and allow the administrator to cull unnecessary users as desired

# ADD GROUP / PASSCHANGE FUNCTIONALITY

listusers() {
# List general users

clear
read -p "Displaying all general users on this system... [ENTER]"
echo
l=$(grep "^UID_MIN" /etc/login.defs)
l1=$(grep "^UID_MAX" /etc/login.defs)
awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( $3 >= min && $3 <= max ) print $0}' /etc/passwd | cut -d: -f1
echo
}

listusers
