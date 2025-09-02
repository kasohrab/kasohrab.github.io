# kasohrab's Personal Website

[![Deploy Hugo site to Pages](https://github.com/kasohrab/kasohrab/actions/workflows/hugo.yml/badge.svg)](https://github.com/kasohrab/kasohrab/actions/workflows/hugo.yml)
[![Hugo](https://img.shields.io/badge/Hugo-0.149.0-blue.svg)](https://gohugo.io)
[![Theme](https://img.shields.io/badge/Theme-hugo--theme--reimu-purple.svg)](https://github.com/D-Sketon/hugo-theme-reimu)

> Personal website and blog built with Hugo and deployed to GitHub Pages

🌐 **Live Site**: [https://kasohrab.github.io](https://kasohrab.github.io)

## About

This is my personal website and blog where I share my thoughts, experiences, and projects as a software engineer. The site features:

- **About Page**: Learn more about me and my background
- **Blog**: Technical posts and personal thoughts
- **CV/Resume**: My professional experience and skills
- **Projects**: Showcase of my work and contributions

## Tech Stack

- **Static Site Generator**: [Hugo](https://gohugo.io) v0.149.0
- **Theme**: [hugo-theme-reimu](https://github.com/D-Sketon/hugo-theme-reimu) by D-Sketon
- **Hosting**: GitHub Pages
- **Deployment**: GitHub Actions (automated)
- **Domain**: Custom domain support ready

## Features

- ✨ Responsive design with dark/light mode
- 📱 Mobile-optimized layout
- 🔍 Search functionality
- 📊 Analytics ready
- 🚀 Fast loading and SEO optimized
- 📝 Markdown-based content management
- 🔗 Social media integration

## Quick Start

### Prerequisites
- [Hugo](https://gohugo.io/installation/) v0.149.0+ (extended version)
- [Go](https://golang.org/dl/) v1.21+
- [Git](https://git-scm.com/)

### Development

```bash
# Clone the repository
git clone https://github.com/kasohrab/kasohrab.git
cd kasohrab

# Install dependencies
make install

# Start development server
make dev
```

Visit [http://localhost:1313](http://localhost:1313) to see the site.

### Available Commands

```bash
make help          # Show all available commands
make dev           # Start development server
make build         # Build for production
make clean         # Clean build artifacts
make new-post TITLE="My Post"  # Create new blog post
make deploy-check  # Verify build works
```

## Content Management

### Creating Blog Posts

```bash
# Using make command (recommended)
make new-post TITLE="My Amazing Post"

# Using Hugo directly
hugo new post/my-amazing-post.md
```

### Content Structure

```
content/
├── _index.md          # Homepage
├── about.md           # About page
├── cv.md             # Resume/CV
├── archives/          # Blog archives
└── post/             # Blog posts
    ├── _index.md     # Blog index
    └── *.md          # Individual posts
```

## Customization

### Site Configuration
- Edit `hugo.toml` for basic site settings
- Modify `config/_default/params.yml` for theme configuration
- Update `data/social.yml` for social media links

### Theme Customization
- Override layouts in `layouts/` directory
- Add custom CSS/JS in `assets/` directory
- Customize colors and fonts in theme configuration

## Deployment

The site is automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.

### Manual Deployment
```bash
# Build the site
make build

# The built site will be in the public/ directory
```

### Custom Domain Setup
1. Add a `CNAME` file to the `static/` directory
2. Configure DNS settings with your domain provider
3. Update `baseURL` in `hugo.toml`

## Project Structure

```
kasohrab/
├── .github/
│   └── workflows/
│       └── hugo.yml      # GitHub Actions deployment
├── archetypes/           # Content templates
├── assets/              # CSS, JS, images
├── config/
│   └── _default/
│       └── params.yml   # Theme configuration
├── content/             # Site content (Markdown)
├── data/
│   └── social.yml       # Social media links
├── layouts/             # Custom templates
├── static/              # Static assets
├── hugo.toml           # Hugo configuration
├── package.json        # NPM scripts
├── Makefile           # Development commands
├── SETUP.md           # Setup documentation
├── DEVELOPMENT.md     # Development guide
└── README.md          # This file
```

## Contributing

This is my personal website, but if you notice any issues or have suggestions:

1. [Open an issue](https://github.com/kasohrab/kasohrab/issues)
2. Submit a pull request
3. Reach out via [email](mailto:kasohrab@example.com)

## License

This project is open source and available under the [MIT License](LICENSE).

The content (blog posts, personal information) is copyrighted and may not be reused without permission.

## Contact

- **GitHub**: [@kasohrab](https://github.com/kasohrab)
- **LinkedIn**: [kasohrab](https://linkedin.com/in/kasohrab)
- **Email**: [kasohrab@example.com](mailto:kasohrab@example.com)
- **Website**: [kasohrab.github.io](https://kasohrab.github.io)

---

⭐ If you found this project helpful, consider giving it a star!

*Built with ❤️ using Hugo and deployed with GitHub Actions*