#!/bin/bash
# install nginx
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Hello from Terraform EC2 instance" | sudo tee /var/www/html/index.html