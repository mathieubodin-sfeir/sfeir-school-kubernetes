# AGENTS.md

## What this repo is

A RevealJS slide deck for a SFEIR School Kubernetes training course. All content is in **French**. Exercises are hosted externally on killercoda.com — no local lab files exist.

## Critical: run commands from `docs/`, not the repo root

The root directory has no `package.json`. All npm commands must be run from `docs/`.

```sh
cd docs && npm install   # also auto-runs prepare (populates web_modules/)
cd docs && npm start     # dev server on port 4242 + SCSS watch (live-server + sass in parallel)
cd docs && npm run serve # serve only, no SCSS watch
cd docs && npm run sass-once  # compile SCSS once -> css/slides.css
```

Docker alternative (port 3000, no live reload):
```sh
cd docs && docker compose up
```

## web_modules/ must exist before the site works

`npm install` auto-runs `npm run prepare`, which copies `sfeir-school-theme` from `node_modules/` into `web_modules/`. If `web_modules/` is missing or stale, run:
```sh
cd docs && npm run prepare
```
Do **not** edit `docs/scripts/dont-touch/prepare-script.js`.

## No tests, no linter, no typecheck

`npm test` always exits 1 by design. The only code quality tool is **Prettier**:
- Config: `.prettierrc` — single quotes, 120 print width
- Applies to: `*.{json,css,scss,md,js,ts}`
- Runs automatically on staged files via `lint-staged` (on commit)
- To format manually: `npx prettier --write <file>`

## Slide content conventions

- Slides live in `docs/markdown/`, organized into numbered chapter directories (`00-` to `09-`).
- `##==##` separates slides (horizontal RevealJS navigation).
- `##--##` splits a slide into two columns (requires `class="two-column"` on the slide).
- `<!-- .slide: class="..." -->` sets RevealJS slide attributes.

**To add or remove a slide from the presentation**, edit `docs/scripts/slides.js` — comment/uncomment the file path. The markdown file is still rendered only if listed there.

## Port

Dev server runs on **port 4242** (not 3000 or 8080). Docker uses 3000.

## .opencode/ directory

Contains an AI agent plugin (Bun-based `serve` tool). Its `package.json` and lockfile are gitignored and unrelated to the presentation.

## No CI/CD in this repo

There is no `.github/` directory and no Makefile. No automated workflows.
