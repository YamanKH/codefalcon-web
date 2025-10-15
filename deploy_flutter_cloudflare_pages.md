# Deploy Flutter Web to Cloudflare Pages (Method 1 — Wrangler Direct Upload)

This quick guide shows how to deploy only your compiled Flutter web app (`build/web`) to **Cloudflare Pages** using **Wrangler**. No servers, no build pipeline—just push the folder.

---

## Prerequisites

- Flutter SDK installed and working (`flutter --version`)
- Node.js (includes `npm`)  
  - Check: `node -v` and `npm -v`
- A Cloudflare account

> Optional but handy:
> - Your custom domain (e.g., `codefalcon.me`) ready to connect after the first deploy.

---
## One command to Deploy only web folder to CloudFlare

```bash

cd build/web && wrangler pages deploy . --project-name code-falcon-website
```


## 1) Build your Flutter web app

From your Flutter project root:

```bash
flutter clean
flutter build web
```

This outputs static files to `build/web`.

---

## 2) Deploy with Wrangler (no Git needed)

Use **npx** (no global install):

```bash
npx wrangler pages deploy build/web
```

Or install Wrangler globally once:

```bash
npm i -g wrangler
wrangler pages deploy build/web
```

### What happens on first run?
- You’ll be asked to **log in** to Cloudflare in your browser (`wrangler login` wizard).
- Wrangler will **create a Pages project** (pick a name, e.g., `codefalcon-web`).
- It uploads **exactly** what’s inside `build/web/` and gives you a `*.pages.dev` URL.

---

## 3) Redeploys (next times)

Whenever you update your app:

```bash
flutter build web
npx wrangler pages deploy build/web
# or: wrangler pages deploy build/web
```

That’s it—instant updates.

---

## 4) Attach your custom domain (optional, recommended)

After the first deploy:

1. Cloudflare Dashboard → **Workers & Pages** → your Pages project.  
2. **Custom domains** → **Set up a domain** → enter `codefalcon.me`.  
3. Follow the DNS prompts (if your DNS is with Cloudflare it’s one-click; if not, add the shown CNAME at your registrar).  
4. Wait for SSL to be active (usually minutes).

---

## 5) SPA routing (Flutter Web)

Flutter web is a Single Page App. Cloudflare Pages will:
- Serve `index.html` for unknown routes **by default** (great for Flutter)  
- If you add a custom `404.html`, it will serve that instead (disables SPA fallback).  
**Recommendation:** Don’t include a custom `404.html` unless you really need it.

---

## 6) Common gotchas & fixes

- **“Command not found: wrangler”**  
  Use `npx wrangler ...` or install: `npm i -g wrangler`.

- **Auth issues**  
  Run: `wrangler login` then retry the deploy command.

- **Wrong folder**  
  Deploy **`build/web`**, not the project root.

- **Outdated output**  
  Always rebuild before deploy: `flutter build web`.

- **Cache not updating**  
  Hard refresh (Ctrl/Cmd + Shift + R) or clear cache; Pages is behind a CDN.

---

## 7) Optional scripts

Add a one-liner deploy script to your `package.json` (if you want to run via npm):

```json
{
  "scripts": {
    "deploy:pages": "flutter build web && wrangler pages deploy build/web"
  }
}
```

Run:

```bash
npm run deploy:pages
```

Or a simple shell script:

```bash
#!/usr/bin/env bash
set -e
flutter build web
npx wrangler pages deploy build/web
```

---

## 8) Quick checklist

- [ ] `flutter build web` completes without errors  
- [ ] `wrangler pages deploy build/web` succeeds  
- [ ] Preview works at `https://<project>.pages.dev`  
- [ ] (Optional) Custom domain added and SSL shows **Active**  

---

**You’re live!**  
If you want, share your Pages project name and whether your DNS is on Cloudflare or your registrar—I can give you the exact DNS record values for `codefalcon.me`.
