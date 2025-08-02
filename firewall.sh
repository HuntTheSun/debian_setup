#!/usr/bin/env bash
set -e

sudo apt install ufw

sudo ufw default deny incoming
sudo ufw allow ssh

sudo ufw enable

exit 0
