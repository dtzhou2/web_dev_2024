#!/bin/bash
# Step 1: Enable the correct version of the node package (not sure if needed on CentOS Stream)

sudo dnf module disable nodejs
sudo dnf module enable nodejs:18

# Step 2: Install the correct version of the ndoe package

sudo dnf install nodejs
 
# Step 3: Install the dependencies and rest of packages needed

sudo dnf install git nginx 
npm install react-scripts

# Step 3: Download cherry and build cherry

git clone https://github.com/open-source-at-illinois/cherry.git
cd cherry/web

# Step 4: Build and prep cherry to be run

npm install
npm run build

# Step 5: Copy cherry to web directory and get SElinux to play nice

sudo mv ~/cherry /var/www/cherry
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/cherry(/.*)?" 
sudo restorecon -Rv /var/www/example.com/

# Step 6: Get nginx configuration to work properly

sudo cp cherry_template.j2 /etc/nginx/conf.d/cherry.conf

# Step 7: Autostart nginx

sudo systemctl enable --now nginx

# Step 8: Set the firewalld permissions properly

sudo firewalld --add-port=80/tcp --permanent
sudo firewalld --reload
sudo systemctl restart firewalld

# Step 9: Test / Your done