#!/usr/bin/env bash
set -e 

# config 
echo "Configuring rootless docker"
echo

sudo apt install slirp4netns dbus-user-session docker-ce-rootless-extras uidmap -y
dockerd-rootless-setuptool.sh install

sudo systemctl disable docker.service
sudo systemctl stop docker.service

