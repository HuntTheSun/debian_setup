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
#variablen einstellen 
bash install_combined.sh
```

4. Neustarten (oder aus und einloggen) und neu ssh verbinden
```
reboot 0
```

5. install_ordner zum home-verzeichnis user kopieren
```
sudo mv /root/debian_setup .
```



