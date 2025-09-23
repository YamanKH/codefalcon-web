# Code Falcon

Flutter web + mobile application for Code Falcon. This repository contains the source code; the production web build is published from a separate repo: [`YamanKH/code_falcon_web`](https://github.com/YamanKH/code_falcon_web).

---

## Prerequisites

- Flutter `3.24` or newer (`flutter doctor` should pass)
- Git
- Access to `https://github.com/YamanKH/code_falcon_web` (HTTPS or SSH)

> The instructions below assume you work from the project root (`code_falcon_project/`).

---

## Local Development

```bash
flutter pub get
flutter run                # pick a device or Chrome for web hot-reload
```

Static analysis:

```bash
flutter analyze
```

---

## Deploying the Web App

Only the generated `build/web` output should live in the `code_falcon_web` repo. The workflow below keeps the repos separate while making deployment quick.

### 1. One-time Setup

Clone the deploy repo inside `build/web`. This directory is recreated by Flutter, so we clone **after** a build and then reuse the `.git` folder on subsequent builds.

```bash
flutter build web --release

# remove previous build output (keep the new git checkout)
rm -rf build/web

# clone the deploy repo straight into build/web
git clone https://github.com/YamanKH/code_falcon_web.git build/web

# optional: switch to the branch you deploy from (default: main)
cd build/web
git checkout main
cd ../..
```

> You only need to do this once. The `build/web` folder now contains the deploy repo.

### 2. Deploy Flow (each release)

```bash
# from project root
flutter build web --release

cd build/web
git add .
git commit -m "Deploy web build $(date +%Y-%m-%d)"
git push origin main
cd ../..
```

Notes:

- `flutter build web` will rewrite all assets but keeps the `.git` directory intact.
- If the build produces no changes, `git status` will be clean and the commit step can be skipped.
- Need to reset? run `git clean -fdx` inside `build/web` (be careful: it wipes the build). Then repeat from **Deploy Flow**.

### Optional: Shell Script Helper

There is a ready-to-use script at `deploy_web.sh` (generated from `DEPLOY_WEB.md`). Once made executable (`chmod +x deploy_web.sh`), run:

```bash
./deploy_web.sh
```

The script runs `flutter build web`, commits, and pushes `build/web` to `origin main` (the deploy repo).

---

## Repository Layout

```
lib/               # Flutter application source
assets/            # static assets (images, animations, etc.)
web/               # base html shell, manifest, meta files
build/web/         # generated web build (git checkout of code_falcon_web)
DEPLOY_WEB.md      # detailed deployment notes / script template
deploy_web.sh      # optional helper script (create yourself)
```

---

## Troubleshooting

| Issue | Fix |
| --- | --- |
| `build/web` lost its git history after a clean build | Re-run **One-time Setup** (clone deploy repo back into `build/web`). |
| `git push` fails with authentication error | Ensure you have write access to `code_falcon_web` and are using correct HTTPS/SSH auth. |
| `flutter build web` fails | Check `flutter doctor`, upgrade dependencies, or run `flutter clean` before rebuilding. |

---

Happy coding! ✨

