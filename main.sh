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
  "9" "Close" 3>&1 1>&2 2>&3)

case $CHOICE in
    "1")
        awk -F: '{if ($3 < 1000) { print $1 ":" $3 } }' /etc/passwd
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
        # Prompts user to choose which critical service
        CHOICE2=$(whiptail --menu "Choose an option" 20 50 10 \
             "1" "Users" \
              "2" "Packages" \
             "3" "Firewall" \
             "4" "Service Management" \
             "5" "Service Management" \
              "6" "Malware Checks" \
             "7" "System Management" \
             "8" "Misc" \
             "9" "Close" 3>&1 1>&2 2>&3)
    ;;
    "5")
        # Changes file permissions for files
        sudo chmod 644 /etc/group
        sudo chown root:root /etc/group
        sudo chmod 644 /etc/passwd
        sudo chown root:root /etc/passwd
        sudo chmod 400 /etc/shadow
        sudo chown root:shadow /etc/shadow
        sudo chmod 755 /etc/grub.d
        sudo chown root:root /etc/grub.d
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
        echo "poop"
    ;;
esac
