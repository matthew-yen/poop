#!/bin/bash
#MIT LICENSE

pass="M0nk3y!M0m3nt123!"

export NEWT_COLORS=' 
    root=blue 
    window=white 
    border=white 
    textbox=white 
    button=yellow,blue
    actlistbox=lightgray,blue 
    actsellistbox=white,blue
'\

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
        #Prompts user to choose which critical service
        CHOICE2=$(whiptail --menu "Choose a critical service:" 20 50 10 \
             "1" "OpenSSH" \
             "2" "Vsftpd" \
             "3" "PostgreSQL" \
             "4" "Service Management" \
             "5" "Service Management" \
             "6" "Malware Checks" \
             "7" "Close" 3>&1 1>&2 2>&3)
        case $CHOICE2 in
            "1")
                ;;
            "2")
                ;;
            "3")
                ;;
            "4")
                ;;
            "5")
                ;;
            "6")
                ;;
            "7")
                ;;
            *)
                ;;
        esac
        ;;             

    "5")
        #Changes file permissions for files
        sudo chmod 644 /etc/group
        sudo chown root:root /etc/group
        sudo chmod 644 /etc/passwd
        sudo chown root:root /etc/passwd
        sudo chmod 400 /etc/shadow
        sudo chown root:shadow /etc/shadow
        sudo chmod 755 /etc/grub.d
        sudo chown root:root /etc/grub.d
        echo "Changed file permissions."
        echo "Finding all prohibited files"
        find . -name '*'    # Lists all prohibited files
        lsattr -Ra 2>/dev/null /|awk '$1 ~ /i/ && $1 !~ /^\// {print}'  # Lists all files with immutable permissions
    ;;
    "6")
      echo "poop"
    ;;
    "7")
        echo "poop"
    ;;
    "8")
        echo "poop"
    ;;
    "9")
        read -p "Finishing and rebooting. Continue? (y/n): " poop;
        if [ "$poop" == "n" ]; then
            
            
        else
        fi
    ;;
esac
