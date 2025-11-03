#!/bin/bash
APP_DIR="/home/ec2-user/myapp"

echo "🚀 Starting deployment..."

# Step 1: Clean old code
rm -rf $APP_DIR/*
echo "✅ Old code removed."

# Step 2: Copy new build files
cp -r /tmp/newbuild/* $APP_DIR/
echo "✅ New code copied."

# Step 3: Restart the app
if pgrep node; then
  pkill node
  echo "🔁 Restarting Node.js app..."
  nohup node $APP_DIR/server.js > app.log 2>&1 &
elif pgrep python3; then
  pkill python3
  echo "🔁 Restarting Python app..."
  nohup python3 $APP_DIR/app.py > app.log 2>&1 &
fi

echo "🎉 Deployment complete!"
