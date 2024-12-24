#!/bin/bash

# Script to install aws cli and codedeploy agent

# Install aws cli
yum install pip -y
pip install awscli

# Install codedeploy agent
yum update
yum install ruby wget -y
cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
sudo service codedeploy-agent start
sudo service codedeploy-agent status

# install httpd
yum install httpd -y
echo "<h1>Deployed with CodeDeploy: v1.0</h1>" > /var/www/html/index.html
service httpd start; chkconfig httpd on
