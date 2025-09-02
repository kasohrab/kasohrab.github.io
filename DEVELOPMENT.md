# Development Guide

This guide covers the local development workflow for the kasohrab personal website.

## Quick Start

```bash
# Start development server
make dev
# or
npm run dev
# or 
hugo server --buildDrafts

# Visit http://localhost:1313
```

## Available Commands

### Make Commands (Recommended)
```bash
make help          # Show all available commands
make install       # Install and setup dependencies
make dev           # Start development server
make build         # Build for production
make clean         # Clean build artifacts
make preview       # Preview production build
make new-post TITLE="My New Post"  # Create new blog post
make update-theme  # Update theme to latest version
make deploy-check  # Verify build works
```

### NPM Scripts
```bash
npm run dev        # Start development server
npm run build      # Build for production
npm run clean      # Clean build directory
npm run preview    # Preview production build
npm run mod:update # Update Hugo modules
```

### Direct Hugo Commands
```bash
hugo server --buildDrafts           # Development server with drafts
hugo server --environment production # Production preview
hugo --minify                       # Production build
hugo new post/my-new-post.md        # Create new post
hugo mod get -u && hugo mod tidy    # Update theme
```

## Development Workflow

### Daily Development
1. **Start the development server**: `make dev`
2. **Edit content** in the `content/` directory
3. **Modify theme settings** in `config/_default/params.yml`
4. **Add static assets** to the `static/` directory
5. **View changes** at http://localhost:1313 (auto-reload enabled)

### Creating New Content

#### Blog Posts
```bash
# Using make (creates properly formatted filename)
make new-post TITLE="My Amazing Blog Post"

# Using Hugo directly
hugo new post/my-amazing-blog-post.md
```

#### Regular Pages
```bash
hugo new about.md
hugo new projects.md
```

### Content Structure
```
content/
├── _index.md          # Homepage content
├── about.md           # About page
├── cv.md             # CV/Resume page
├── archives/
│   └── _index.md     # Blog archives
└── post/             # Blog posts
    ├── _index.md     # Blog index
    ├── hello-world.md
    └── my-development-setup.md
```

### Configuration Files
- `hugo.toml` - Basic Hugo configuration
- `config/_default/params.yml` - Theme-specific settings
- `data/social.yml` - Social media links configuration

### Theme Customization

#### Update Theme
```bash
make update-theme
```

#### Override Theme Templates
Create files in `layouts/` directory with the same structure as the theme.

#### Custom CSS/JS
Add files to `assets/` directory and reference them in your templates.

### Building and Testing

#### Development Build
```bash
make dev
# Includes drafts, enables live reload, shows detailed output
```

#### Production Preview
```bash
make preview
# Builds with production settings, minified output, no drafts
```

#### Final Build
```bash
make build
# Creates minified production build in public/ directory
```

## Troubleshooting

### Server Won't Start
- Check if port 1313 is already in use
- Verify Hugo configuration syntax
- Run `hugo version` to ensure Hugo is installed

### Theme Issues
- Update theme: `make update-theme`
- Check theme documentation
- Verify configuration in `params.yml`

### Build Errors
- Check markdown syntax in content files
- Verify front matter format
- Run `hugo --verbose` for detailed error messages

### Module Issues
```bash
hugo mod clean        # Clean module cache
hugo mod get -u       # Re-download modules
hugo mod tidy         # Update go.mod and go.sum
```

## Performance Tips

- Use `hugo server --disableFastRender=false` for faster rebuilds
- Optimize images before adding to `static/`
- Use Hugo's image processing for responsive images
- Test build time with `hugo --templateMetrics`

## Content Guidelines

### Front Matter Template
```yaml
---
title: "Post Title"
date: 2024-09-02T10:00:00-00:00
draft: false
description: "Brief description for SEO"
tags: ["tag1", "tag2"]
categories: ["Category"]
---
```

### Markdown Best Practices
- Use proper heading hierarchy (H1 -> H2 -> H3)
- Add alt text to images: `![Alt text](image.jpg)`
- Use relative links for internal pages: `[About](/about/)`
- Add code language for syntax highlighting: ```javascript

## Git Workflow
```bash
git add .
git commit -m "Add new blog post about X"
git push origin main
```

## Deployment
See GitHub Pages deployment section in main documentation.

---

*For more advanced topics, see SETUP.md*