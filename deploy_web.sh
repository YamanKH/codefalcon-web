#!/bin/bash

echo "Starting deployment process..."

# Commit any source changes first
echo "Checking for source changes to commit..."
git add .
git status
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  echo "Committing source changes..."
  git commit -m "Update source code $(date '+%Y-%m-%d %H:%M:%S')"
  if [ $? -ne 0 ]; then
    echo "Git commit failed."
    exit 1
  fi
  echo "Source changes committed."
fi

echo "Pushing source changes to remote repository..."
git push origin main

if [ $? -ne 0 ]; then
  echo "Git push failed. Aborting deployment."
  exit 1
fi

echo "Git push succeeded."

echo "Building Flutter web application..."
flutter build web

if [ $? -ne 0 ]; then
  echo "Flutter build failed. Aborting deployment."
  exit 1
fi

echo "Flutter build succeeded."

echo "Navigating to build/web directory..."
cd build/web

echo "Current directory: $(pwd)"
echo "Files in build/web: $(ls -la)"

echo "Checking if wrangler is available for Cloudflare deployment..."
if command -v wrangler &> /dev/null; then
  echo "Wrangler is installed. Deploying to Cloudflare Pages..."
  wrangler pages deploy . --project-name code-falcon-website
  if [ $? -ne 0 ]; then
    echo "Cloudflare Pages deployment failed."
    exit 1
  fi
  echo "Cloudflare Pages deployment succeeded."
else
  echo "Wrangler not found. Install with 'npm i -g wrangler' if needed for Cloudflare deployment."
  echo "Build complete. Note: Cloudflare Pages deployment skipped."
fi
