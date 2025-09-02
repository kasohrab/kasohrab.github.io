.PHONY: help dev build clean preview new-post update-theme install
.DEFAULT_GOAL := help

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install dependencies and setup
	@echo "Installing Hugo dependencies..."
	@hugo mod get -u
	@hugo mod tidy
	@echo "Setup complete!"

dev: ## Start development server
	@echo "Starting Hugo development server..."
	@hugo server --port 1313 --buildDrafts --bind 0.0.0.0

build: ## Build the site for production
	@echo "Building site..."
	@hugo --minify

clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf public

preview: ## Preview production build locally
	@echo "Starting preview server..."
	@hugo server --environment production --port 1314

new-post: ## Create a new blog post (usage: make new-post TITLE="My Post Title")
	@echo "Creating new post..."
	@hugo new post/$(shell echo "$(TITLE)" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g').md

update-theme: ## Update theme to latest version
	@echo "Updating theme..."
	@hugo mod get -u
	@hugo mod tidy

deploy-check: ## Check if site builds successfully
	@echo "Checking build..."
	@hugo --minify --quiet
	@echo "Build successful!"

serve-drafts: ## Serve site including draft posts
	@echo "Starting server with drafts..."
	@hugo server --buildDrafts --port 1313

serve-fast: ## Serve site with fast render mode
	@echo "Starting fast server..."
	@hugo server --disableFastRender=false --port 1313