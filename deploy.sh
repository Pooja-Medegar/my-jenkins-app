#!/bin/bash
echo "Deploying app to EC2..."

# Create target directory if not exists
sudo mkdir -p /var/www/myapp

# Copy application files
sudo cp -r * /var/www/myapp/

echo "Deployment complete!"
