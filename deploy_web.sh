#!/bin/bash

echo "Building Flutter web application..."
flutter build web

if [ $? -ne 0 ]; then
  echo "Flutter build failed. Aborting deployment."
  exit 1
fi

echo "Navigating to build/web directory..."
cd build/web

echo "Adding changes to Git..."
git add .

echo "Committing changes..."
git commit -m "Update web build $(date +%Y-%m-%d %H:%M:%S)"

echo "Pushing to remote repository..."
git push origin main

echo "Deployment complete!"
