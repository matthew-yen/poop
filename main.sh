#!/bin/bash
#MIT LICENSE

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
  "5" "Malware Checks" \
  "6" "System Management" \
  "7" "Misc" \
  "8" "Close" 3>&1 1>&2 2>&3)

case $CHOICE in
	"1")
		echo "poop"
	;;
	"2")
		echo "poop"
	;;
	"3")
		sudo apt install ufw
		sudo ufw enable
	;;
	"4")
		echo "poop"
	;;
	"5")
		echo "poop"
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
esac
