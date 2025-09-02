# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This is a Hugo static site for a personal website and blog. Use these commands for development:

### Primary Commands (via Makefile - Recommended)
```bash
make dev           # Start development server with drafts on port 1313
make build         # Build production site with minification
make clean         # Remove build artifacts (public/ directory)
make preview       # Preview production build on port 1314
make new-post TITLE="Post Title"  # Create new blog post with URL-friendly filename
make update-theme  # Update hugo-theme-reimu theme to latest version
make deploy-check  # Verify production build succeeds
make install       # Install dependencies and setup Hugo modules
```

### Alternative Commands (via npm scripts)
```bash
npm run dev        # Start development server 
npm run build      # Production build
npm run clean      # Clean build directory
npm run preview    # Production preview
npm run mod:update # Update Hugo modules
```

### Direct Hugo Commands
```bash
hugo server --buildDrafts --port 1313 --bind 0.0.0.0  # Development with drafts
hugo --minify                                          # Production build
hugo new post/filename.md                              # Create new blog post
hugo mod get -u && hugo mod tidy                       # Update theme modules
```

## Architecture and Structure

### Hugo Configuration
- **Static Site Generator**: Hugo with Go modules for theme management
- **Theme**: `hugo-theme-reimu` by D-Sketon (imported via Go module)
- **Base URL**: https://kasohrab.github.io/ (configured in hugo.toml)
- **Deployment**: GitHub Pages via GitHub Actions

### Content Architecture
```
content/
├── _index.md          # Homepage content
├── about.md           # About page
├── cv.md             # CV/Resume page
├── archives/
│   └── _index.md     # Blog archives page
└── post/             # Blog posts directory
    ├── _index.md     # Blog index page
    └── *.md          # Individual blog posts
```

### Configuration Structure
- `hugo.toml` - Main Hugo configuration (baseURL, modules, title)
- `config/_default/params.yml` - Theme-specific settings (author, social links, dark mode, etc.)
- `data/` - Contains YAML files for site data
- `go.mod` - Hugo module dependencies (theme management)

### Key Directories
- `archetypes/` - Content templates for new posts
- `assets/` - Source files (CSS, JS) processed by Hugo
- `static/` - Static assets copied directly to output
- `layouts/` - Custom template overrides for the theme
- `public/` - Generated site output (not committed)
- `resources/` - Hugo's processing cache

### Theme Customization
- Theme is managed as a Hugo module, not a Git submodule
- Override theme templates by creating files in `layouts/` with same path structure
- Customize theme settings in `config/_default/params.yml`
- Add custom CSS/JS in `assets/` directory

### Development Workflow
1. Run `make dev` to start development server with live reload
2. Create content in `content/` directory using Markdown
3. New blog posts: `make new-post TITLE="Title Here"` (auto-generates URL-friendly filename)
4. Theme updates: `make update-theme` (updates Go module)
5. Production testing: `make deploy-check` before deployment

### Important Notes
- **ALWAYS READ THE THEME README FIRST**: Before making any theme customizations, read the hugo-theme-reimu README at https://github.com/D-Sketon/hugo-theme-reimu to understand proper configuration options
- Always use `make` commands when available - they include proper error handling
- The site uses Hugo modules for theme management (not Git submodules)
- Development server includes drafts and enables live reload
- Production builds are minified and exclude draft content
- GitHub Actions handles automatic deployment to GitHub Pages on main branch pushes

## Theme Visual Customizations (hugo-theme-reimu)

### Avatar/Profile Image
```bash
# Create avatar directory and add image
mkdir -p static/avatar/
# Add your avatar image as: static/avatar/avatar.webp (recommended format)
# Or use: static/avatar/avatar.jpg, static/avatar/avatar.png
```
Then in `config/_default/params.yml`:
```yaml
avatar: "/avatar/avatar.webp"  # Enable custom avatar
gravatar: false                # Disable Gravatar if using custom avatar
```

### Blog Post Cover Images
Create `data/covers.yml` for random cover images:
```yaml
# Random cover images for blog posts
covers:
  - /images/cover1.jpg
  - /images/cover2.jpg
  - /images/cover3.webp
  - https://example.com/external-image.jpg
```

For individual post covers, add to post front matter:
```yaml
---
title: "My Post"
cover: "/images/my-post-cover.jpg"  # Custom cover
# OR
cover: "rgb(255, 99, 71)"          # Gradient color background
# OR  
cover: false                       # No cover image
---
```

### Favicon and Tab Icons
Add these files to `static/` directory:
```bash
static/
├── favicon.ico                 # Traditional favicon (16x16, 32x32)
├── favicon-16x16.png          # 16x16 PNG favicon
├── favicon-32x32.png          # 32x32 PNG favicon
├── apple-touch-icon.png       # 180x180 for iOS home screen
├── android-chrome-192x192.png # 192x192 for Android
├── android-chrome-512x512.png # 512x512 for Android
└── site.webmanifest           # Web app manifest
```

Example `static/site.webmanifest`:
```json
{
    "name": "kasohrab",
    "short_name": "kasohrab",
    "icons": [
        {
            "src": "/android-chrome-192x192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "/android-chrome-512x512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ],
    "theme_color": "#ffffff",
    "background_color": "#ffffff",
    "display": "standalone"
}
```

### Mouse Pointer Customization (Reimu Theme Feature)
Add to `config/_default/params.yml`:
```yaml
# Reimu mouse pointer effects
cursor:
  enable: true                   # Enable custom cursor
  reimu: true                   # Enable Reimu character cursor
  animation: true               # Enable cursor animations
```

### Custom Backgrounds and Styling
Create `assets/css/custom.css`:
```css
/* Custom background */
body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    /* OR */
    background-image: url('/images/background.jpg');
    background-attachment: fixed;
    background-size: cover;
}

/* Custom post card backgrounds */
.post-card {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
}

/* Dark mode backgrounds */
[data-theme="dark"] body {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
}

/* Custom mouse cursor */
* {
    cursor: url('/images/cursor.png'), auto;
}

a:hover {
    cursor: url('/images/cursor-hover.png'), pointer;
}
```

Reference the custom CSS in your layout by creating `layouts/partials/head.html`:
```html
{{ if resources.Get "css/custom.css" }}
<link rel="stylesheet" href="{{ (resources.Get "css/custom.css" | minify).RelativePermalink }}">
{{ end }}
```

### Theme Colors and Styling
Add to `config/_default/params.yml`:
```yaml
# Custom theme colors
colors:
  primary: "#667eea"           # Primary accent color
  secondary: "#764ba2"         # Secondary accent color
  background: "#ffffff"        # Background color
  text: "#333333"             # Text color

# Custom fonts
fonts:
  body: "Inter, sans-serif"    # Body font
  heading: "Merriweather, serif"  # Heading font
  code: "JetBrains Mono, monospace"  # Code font

# Animation settings
animations:
  enable: true                 # Enable page animations
  duration: 300               # Animation duration in ms
```

### Loading Additional Assets
Place images in appropriate directories:
- `static/images/` - For backgrounds, covers, icons (copied as-is)
- `assets/images/` - For processed images (resized, optimized by Hugo)
- `static/avatar/` - For avatar/profile images
- `static/` - For favicons and root-level assets

### Testing Visual Changes
```bash
make dev          # Start development server
# Visit http://localhost:1313 to see changes
# Changes to assets/ require server restart
# Changes to static/ are copied immediately
```

## Visual Customization Lessons Learned

### Avatar Configuration (CRITICAL)
The theme expects avatar configuration in a specific format:
```yaml
# In config/_default/params.yml
avatar: "filename.jpg"  # Just filename, NOT full path like "/avatar/filename.jpg"
```
- Avatar file must be in `static/avatar/` directory
- Configuration uses only the filename, not the full path
- Theme automatically looks in the avatar directory

### Background Image Setup (PREFERRED METHOD)
Use the theme's built-in banner system instead of custom CSS overrides:
```yaml
# In config/_default/params.yml
banner: "images/your-background.jpg"
```
- Place background image in `static/images/` directory
- Theme handles background display, sizing, and positioning
- Works better than CSS overrides which can conflict with theme styles

### Custom CSS Integration
Use the theme's injector system for custom styles:
```yaml
# In config/_default/params.yml
injector:
  head_end: '<link rel="stylesheet" href="/css/custom.css">'
```
- Place CSS files in `static/css/` directory for direct serving
- Avoid complex Hugo asset pipeline for simple customizations
- Use injector instead of custom layout overrides when possible

### CSS Strategy for Theme Compatibility
- **DO**: Work with theme's existing classes and structure
- **DON'T**: Use aggressive `!important` overrides on core elements
- **DO**: Use theme's built-in configuration options first
- **DON'T**: Override theme backgrounds with custom CSS when banner option exists
- **DO**: Test changes incrementally and check Hugo rebuild logs

### Debugging Visual Issues
1. Check if Hugo detects and rebuilds after changes (`make dev` logs)
2. Verify files are accessible: `curl -I http://localhost:1313/path/to/file`
3. Check browser network tab for 404s or CSS conflicts
4. Use browser dev tools to inspect actual HTML structure and CSS classes
5. Read theme documentation for built-in customization options before custom CSS
- https://github.com/D-Sketon/hugo-reimu-template/blob/main/config/_default/params.yml always try to update the params first (can read the link for option list) instead of trying to modify more code