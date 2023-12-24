#!/bin/bash
# MIT LICENSE
# made by chatgpt

pass="M0nk3y!M0m3nt123!"

export NEWT_COLORS=' 
    root=blue 
    window=white 
    border=white 
    textbox=white 
    button=yellow,blue
    actlistbox=lightgray,blue 
    actsellistbox=white,blue
'

CHOICE=$(whiptail --menu "Choose an option" 20 50 10 \
  "1" "Users" \
  "2" "Packages" \
  "3" "Firewall" \
  "4" "Service Management" \
  "5" "File Management" \
  "6" "Malware Checks" \
  "7" "System Management" \
  "8" "Misc" \
  "9" "Finish" 3>&1 1>&2 2>&3)

case $CHOICE in
    "1")
        echo
        awk -F: '$6 ~ /\/home/ {print}' /etc/passwd # Lists all users
        ;;
    "2")
        comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) # Shows all manually installed packages
        ;;
    "3")
        sudo apt install ufw
        sudo ufw enable
        sudo ufw default deny incoming
        sudo ufw default allow outgoing
        ;;
    "4")
        # Nested menu for Service Management
        CHOICE2=$(whiptail --menu "Choose an option" 20 50 10 \
            "1" "Start Service" \
            "2" "Stop Service" \
            "3" "Restart Service" \
            "4" "Enable Service at Boot" \
            "5" "Disable Service at Boot" \
            "6" "Back" 3>&1 1>&2 2>&3)

        case $CHOICE2 in
            "1")
                # Add code for starting a service
                echo "Starting service..."
                ;;
            "2")
                # Add code for stopping a service
                echo "Stopping service..."
                ;;
            "3")
                # Add code for restarting a service
                echo "Restarting service..."
                ;;
            "4")
                # Add code for enabling a service at boot
                echo "Enabling service at boot..."
                ;;
            "5")
                # Add code for disabling a service at boot
                echo "Disabling service at boot..."
                ;;
            "6")
                # Go back to the main menu
                ;;
            *)
                ;;
        esac
        ;;
    "5")
        # Add code for File Management
        ;;
    "6")
        # Add code for Malware Checks
        ;;
    "7")
        # Add code for System Management
        ;;
    "8")
        # Add code for Misc
        ;;
    "9")
        # Add code for finishing and cleanup
        ;;
    *)
        ;;
esac
