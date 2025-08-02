#!/usr/bin/env bash
set -e

apt update -y 
apt install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

docker run hello-world

# config 
echo "Configuring rootless docker"
echo

apt install slirp4netns dbus-user-session docker-ce-rootless-extras -y
dockerd-rootless-setuptool.sh install

