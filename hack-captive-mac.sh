#!/bin/bash

echo "Saving current mac address to mymac.txt"
oldmac=$(ifconfig en0 | grep ether | awk '{ print $NF }')
date >> mymac.txt
echo $oldmac >> mymac.txt
echo $oldmac

echo
echo "Finding network address"
myip=$(ifconfig en0 | grep "inet " | awk '{ print $2 }')
mygw=$(netstat -nr | grep -A2 Internet: | grep default | awk '{ print $2 }')
mynet=$(sipcalc ${myip}/24 | grep "Network address" | awk '{ print $NF }')/24
echo "IP: $myip - GW: $mygw - Net: $mynet"

echo
echo "Finding least used mac address ..."
for i in {1..15}
do
	echo "Scan $i of 15 ..."
	nmap -n -sn -PR -PS -PA -PU -T5 --exclude "$myip","$mygw" "$mynet" | awk '/for/ {print $5} ; /Address/ {print $3}'   | sed '$!N;s/\n/ - /' >> maclist.txt && echo >> maclist.txt
	sleep 2
done

echo
echo "Getting least used mac address"
macaddr=$(sort maclist.txt | grep - | uniq -c | sort | head -n1 | awk '{ print $4 }')
sort maclist.txt | grep - | uniq -c | sort | head -n10

echo "Setting mac address to $macaddr ..."
ifconfig en0 ether $macaddr

echo
echo "Now you should disconnect/reconnect your Wifi and you can change DNS to 8.8.8.8"
