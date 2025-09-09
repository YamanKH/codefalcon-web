# Deploy Code Falcon Web Application

This document provides a simple bash script to build and deploy the Flutter web application to your remote GitHub repository (`https://github.com/YamanKH/code_falcon_web`).

**Important Notes:**
*   This script assumes you have `flutter` and `git` installed and configured on your system.
*   It also assumes that the `build/web` directory is already a Git repository linked to your remote (`https://github.com/YamanKH/code_falcon_web`).
*   This script is intended for quick updates. For more robust deployments, consider using CI/CD pipelines (e.g., GitHub Actions, Netlify's built-in CI/CD).

## Deployment Script

To deploy, navigate to the root of your `code_falcon` project in your terminal and run the following commands:

```bash
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
```

### How to use:
1.  Save the script above into a file (e.g., `deploy_web.sh`) in your project's root directory.
2.  Make the script executable: `chmod +x deploy_web.sh`
3.  Run the script from your project's root directory: `./deploy_web.sh`
