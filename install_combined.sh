#!/usr/bin/env bash
# set variables
username="deb"
iface="enp1s0"
ip_addr="192.168.122.50"
netmask="255.255.255.0"
gateway="192.168.122.1"
dns_domain="test.local"
dns_addr="1.1.1.1"

# install sudo, vim, tmux, ufw
apt update -y
apt install sudo vim tmux ufw -y

# add user to sudo group
useradd -aG $username

# configure static ip
cp ./interface_template interfaces

sed "s/interfacevalue/$iface/g" interfaces
sed "s/addressvalue/$ip_addr/" interfaces
sed "s/netmaskvalue/$netmask/" interfaces
sed "s/gatewayvalue/$gateway/" interfaces
sed "s/dns-searchvalue/$dns_domain/" interfaces
sed "s/dns-nameserversvalue/$dns_addr/" interfaces

cp ./interfaces /etc/network/interfaces

read -n 1 -p "y: Restart networking, reconnect via ssh to new IP: $ip_addr | n: manually restart networking:  " choice
echo 

case "$choice" in
    y|Y)
        systemctl restart networking
        ;;
    n|N)
        echo "Exiting."
        exit 1
        ;;
    *)
        echo "Invalid input."
        ;;
esac

exit 0


