#!/bin/bash
# Step 1: Create a new user and set a password (change into that user after)

useradd admin
usermod -aG wheel admin
passwd admin
su admin

#Step 2: Play around with dnf get some basic utilities installed

dnf update 
sudo dnf update 
sudo dnf upgrade
sudo dnf install lm_sensors
sudo dnf install openssh-clients
sudo dnf install openssh-server
sudo dnf install git

#Step 3: Set up SSH 

ssh-keygen
ls -l ~/.ssh    
cat ~/.id_rsa.pub
scp ~/.id_rsa.pub admin@bastion:/home/admin
# Have them install a terminal client on their local computers and use that to acecss their machines so they can test that ssh is working
sudo vim /etc/ssh/sshd_config
# Disable password authentication here
sudo systemctl enable --now sshd

# Step 4: Set up firewalld

sudo firewall-cmd --add-port=22/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart firewalld

#Step 5: Play around with bashcrawl

git clone https://gitlab.com/slackermedia/bashcrawl.git
cd bashcrawl
cd entrance 
cat scroll 

#Step 6: Once they get the hang of basic terminal movement commands move on to setting up basic hello world page in nginx

sudo dnf install nginx
sudo systemctl enable -now nginx

#Step 7: Enable the hello world page through firewalld

sudo firewall-cmd --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart firewalld

# Step 8: Paths can be split here
# Option 1: Play around more with the linux terminal , https://overthewire.org/wargames/bandit/bandit33.html
# Option 2: play around in HTML by editing index.html 
# Option 3: Learn how the nginx configuration works



