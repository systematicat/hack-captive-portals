## Hack Captive portals script

This script is using MAC-spoofing technique. This method is the only one which is present in all wireless and some wired  
Captive portals by design. Once a host is authorized by the Captive portal, its MAC and IP address are allowed  
unrestricted access.  
All we need to do is sniff traffic on the network, find a host that is authorized, and spoof its IP and MAC address.  
Spoofing a MAC is dependent on your network card and driver but most modern network devices today support it.  
The downside of course is that you have to observe someone already authenticated, but in places such as a crowded airport  
lobby this may be less difficult than it seems.  

<p align="center">
    <img src=/screenshot.png alt="Hack Captive portal">
</p>

### Fork information

I am not the greatest bug fixer. However, I troubleshoot really good. The problem with this script is that if it fails to authenticate with the captive portal once,it cannot operate any further. This workaround fixes the issue by copying and removing the script every time it is used.


### Installation and usage
You need `sipcalc` and `nmap` for this script. Then download .sh script and run it. 
```
sudo apt -y install sipcalc nmap
wget https://raw.githubusercontent.com/systematicat/hack-captive-portals/master/hack-captive.sh
sudo chmod u+x setup.sh
sudo ./setup.sh
sudo capee.sh
```

> Tested in Elementary OS Juno (which is based on Ubuntu 18.04), and in Kali Linux with different Captive portals in lots of places.
