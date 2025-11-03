#!/bin/bash
set -e

echo "Deploying app to EC2..."

# Define app directory
APP_DIR="/var/www/myapp"

# Remove old files
rm -rf $APP_DIR/*

# Copy new build files from Jenkins workspace
cp -r * $APP_DIR/

# Restart Nginx (or Node.js/Python app if needed)
systemctl restart nginx

echo "Deployment successful!"
