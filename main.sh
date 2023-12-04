#!/bin/bash
#MIT Licence
#Copyright (c) Matthew Yen
CHOICE=$(whiptail --title "System Configurations" --menu "Choose an option" 25 78 16 \
"<-- Back" "Return to the main menu." \
"Add users" "Add users to the system." \
"Modify User" "Modify an existing user." \
"List Users" "List all users on the system." \
"Add Group" "Add a user group to the system." \
"Modify Group" "Modify a group and its list of members." \
"List Groups" "List all groups on the system." 3>&1 1>&2 2>&3)
