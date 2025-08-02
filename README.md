0. per ssh auf die installierte debian VM verbinden
```
ssh username@ip
```

1. git installieren  
```
su - 
apt install git -y
```

2. git repo herunterladen
```
git clone https://github.com/HuntTheSun/debian_setup && cd debian_setup
```

3. Variablen einstellen & skript ausführen
```
ip a #interfacename wahrscheinlich entweder enp1s0 oder eth0
nano install_combined.sh #variablen einstellen 
bash install_combined.sh
```

4. Neustarten (oder aus und einloggen) und neu ssh verbinden
```
reboot 0
ssh username@neue_ip
```

5. install_ordner ins home-verzeichnis user bringen und vom root verzeichnis loeschen
```
cd ~
git clone https://github.com/HuntTheSun/debian_setup
sudo rm -rf /root/debian_setup
cd debian_setup
```

6. install docker
```
sudo bash install_docker.sh
```

7. configure docker rootless
```
bash docker_rootless.sh
```

8. install and config ufw firewall
```
bash firewall.sh
```

