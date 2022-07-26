#!/bin/bash

#This tool is made only for education purpose only !!!. And Creators of this tool will not responsible any thing done by you !!! so be wise.
#If you are going to change anything please give a god damn star to the original author.

 
# Functions
#.............................................................................................................

# User Options
options_list (){
	echo " "
	echo " This Script Need Root To Work ( First 'sudo su' then ./nmap.sh)"
	echo " All Available Nmap Scans:

	1 - Host Discovery
	2 - Scan TOP 100 Ports
	3 - Scan All Open Ports
	4 - Version Detector
	5 - OS Detector
	6 - CVE Detector"
	echo " "
	printf "Please Select A Option To Continue:"
	read option_1
	sleep 0.5
}

# Exit or Stay
exit_or_stay (){
	sleep 0.5
	printf "For Exit Press 1 or Press 2 For Return To Main Menu: "
	read option_2
	case $option_2 in
	1)
		sleep 0.5
		exit 1
		;;
	2)
		sleep 0.5
		exec $0
	esac

}

# Saving Result
save_result (){
    sleep 0.5
    echo ""
	printf "Do Also You Want To Save Result As Text File (y/n): "
	read txt
	if [[ $txt == y ]]; then
		echo ""
		printf "Enter A Name For Output txt File: "
		read txt_name
    fi
    
}

#............................................................................................................

# Calling Welcome Banner Function And User List(Options) Functons
sleep 0.5
options_list

# Storing Target IP
printf "Enter Target IP or IP Range To Scan: "
read target_ip

# Scanners
case $option_1 in
	1)
		# Host Discovery
		save_result
		echo ""
		echo "Running -sn"
		echo ""
		if [[ $txt == y ]]; then
		    nmap -sn $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -sn $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;
		
	2)
		# Top 100 Ports
        save_result
        echo ""
		echo "Running -Pn -sS -vv --open -top-ports 100 -oN output.txt"
		echo ""
        if [[ $txt == y ]]; then
		    nmap -Pn -sS -vv --open -top-ports 100 $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -Pn -sS -vv --open -top-ports 100 $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;

	3)
		# All Ports
		save_result
		echo ""
		echo "Running -Pn -sS -vv --open -p1-65535"
		echo ""
		if [[ $txt == y ]]; then
		    nmap -Pn -sS -vv --open -p1-65535 $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -Pn -sS -vv --open -p1-65535 $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;

	4)
		# Version Detector
		save_result
		echo ""
		echo "Running -Pn -sS -vv -sV"
		echo ""
		if [[ $txt == y ]]; then
		    nmap -Pn -sS -vv -sV $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -Pn -sS -vv -sV $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;

	5)
		# OS Detector
		save_result
		echo ""
		echo "Running -Pn -sS -vv -O"
		echo ""
		
		if [[ $txt == y ]]; then
		    nmap -Pn -sS -vv -O $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -Pn -sS -vv -O $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;

	6)
		# CVE Detector
		save_result
		echo ""
		echo "Running -Pn -sS -vv --script vuln"
		echo ""
		if [[ $txt == y ]]; then
		    nmap -Pn -sS -vv --script vuln $target_ip -oN Results/$txt_name
		    sleep 0.5
		    exit_or_stay

        else
            nmap -Pn -sS -vv --script vuln $target_ip
		    sleep 0.5
		    exit_or_stay
        
        fi
        ;;

esac
