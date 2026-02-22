#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo snap install just --classic
sudo apt install tree
echo 'Run script OMZ ✅ '
echo 'Install ansible 🏃'
sudo apt install ansible -y
echo '---> version of ansible ✅'
ansible --version

#bash /home/lyleangseng712/installation/OMZ.sh