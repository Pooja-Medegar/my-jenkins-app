#!/bin/bash
set -e

echo "Deploying app to EC2..."

# Define app directory
APP_DIR="/var/www/myapp"

# Remove old files
sudo rm -rf $APP_DIR/*

# Copy new build files from Jenkins workspace
sudo cp -r * $APP_DIR/

# Restart Nginx (or Node.js/Python app if needed)
sudo systemctl restart nginx

echo "Deployment successful!"
