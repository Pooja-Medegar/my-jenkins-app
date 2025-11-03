#!/bin/bash
APP_DIR="/var/www/myapp"

echo "🚀 Starting deployment..."

# Clean old files
sudo rm -rf $APP_DIR/*
sudo mkdir -p $APP_DIR

# Copy new files from Jenkins workspace (transferred by scp)
sudo cp -r /tmp/myapp/* $APP_DIR/

# Move index.html to Nginx web root
sudo cp $APP_DIR/index.html /usr/share/nginx/html/

# Restart Nginx
sudo systemctl restart nginx

echo "✅ Deployment completed successfully!"
