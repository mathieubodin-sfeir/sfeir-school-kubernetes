.DEFAULT_GOAL := help

.PHONY: install dev serve css format env-check help

install: ## Install dependencies and populate web_modules/
	cd docs && npm install

dev: ## Start dev server with live reload + SCSS watch (port 4242)
	cd docs && npm start

serve: ## Start presentation server only, no SCSS watch (port 4242)
	cd docs && npm run serve

css: ## Compile SCSS once to docs/css/slides.css
	cd docs && npm run sass-once

format: ## Format source files with Prettier (requires prettier on PATH)
	npx prettier --write "**/*.{json,css,scss,md,js,ts}"

env-check: ## Verify required tools are available (node, npm, prettier)
	@echo "Checking dependencies..."
	@command -v node   >/dev/null 2>&1 && echo "  node      PASS" || echo "  node      FAIL — install Node.js"
	@command -v npm    >/dev/null 2>&1 && echo "  npm       PASS" || echo "  npm       FAIL — install Node.js"
	@command -v prettier >/dev/null 2>&1 && echo "  prettier  PASS" || echo "  prettier  FAIL — run: npm install -g prettier"
	@command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1 && command -v prettier >/dev/null 2>&1 || exit 1

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}'
