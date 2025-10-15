# CodeFalcon Web

A modern Flutter web application for CodeFalcon - Your trusted technology partner.

## Features

- Responsive design with Arabic/English language support
- Interactive contact form
- Social media integration
- Project showcase
- Team member profiles
- Services section
- Calculator tool

## Getting Started

### Prerequisites

- Flutter SDK (^3.9.0)
- Node.js and npm (for deployment)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YamanKH/codefalcon-web.git
cd codefalcon-web
```

2. Install Flutter dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d web
```

## Deployment

### Automatic Deployment (GitHub Actions)

This project uses GitHub Actions for automatic deployment to Cloudflare Pages. When you push to the `main` branch, the following happens automatically:

1. Flutter web app is built
2. Static files are deployed to Cloudflare Pages
3. Your site is live at your configured domain

### Manual Deployment

If you prefer manual deployment, use the provided script:

```bash
./deploy_web.sh
```

Or deploy directly with Wrangler:

```bash
flutter build web
cd build/web
wrangler pages deploy . --project-name code-falcon-website
```

## Setting up Cloudflare API Token

For automatic deployment, you need to add Cloudflare credentials to your GitHub repository secrets:

1. Go to your GitHub repository → Settings → Secrets and variables → Actions
2. Add the following secrets:
   - `CLOUDFLARE_API_TOKEN`: Your Cloudflare API token
   - `CLOUDFLARE_ACCOUNT_ID`: Your Cloudflare account ID

### How to get Cloudflare API Token:

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to My Profile → API Tokens
3. Create a new token with "Edit" permissions for Cloudflare Pages
4. Copy the token and add it to GitHub secrets

### How to get Cloudflare Account ID:

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Your Account ID is visible in the URL or under Account Home

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app/
│   ├── routes/               # App routing
│   └── modules/
│       └── home/             # Home module
│           ├── home_view.dart # Main home view
│           ├── home_controller.dart # Home controller
│           └── widgets/      # Home widgets
└── calculator/               # Calculator module
```

## Technologies Used

- Flutter Web
- GetX (State management)
- Google Fonts (Typography)
- Font Awesome (Icons)
- Cloudflare Pages (Hosting)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is private and proprietary to CodeFalcon.