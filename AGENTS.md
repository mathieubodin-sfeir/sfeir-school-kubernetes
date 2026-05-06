# AGENTS.md

## What this repo is

A RevealJS slide deck for a SFEIR School Kubernetes training course. All content is in **French**. Exercises are hosted externally on killercoda.com — no local lab files exist.

## Commands

Use only the Makefile targets:

- `make install`  : Install dependencies and populate web_modules/
- `make dev`      : Start dev server with live reload + SCSS watch (port 4242)
- `make serve`    : Start presentation server only, no SCSS watch (port 4242)
- `make css`      : Compile SCSS once to docs/css/slides.css
- `make format`   : Format source files with Prettier (requires prettier on PATH)
- `make env-check`: Verify required tools are available (node, npm, prettier)
- `make help`     : Show available targets

## Slide content conventions

- Slides live in `docs/markdown/`, organized into numbered chapter directories (`00-` to `09-`).
- `##==##` separates slides (horizontal RevealJS navigation).
- `##--##` splits a slide into two columns (requires `class="two-column"` on the slide).
- `<!-- .slide: class="..." -->` sets RevealJS slide attributes.

**To add or remove a slide from the presentation**, edit `docs/scripts/slides.js` — comment/uncomment the file path. The markdown file is still rendered only if listed there.

## Port

Dev server runs on **port 4242** (not 3000 or 8080). Docker uses 3000.

## No CI/CD in this repo

There is no `.github/` directory. No automated workflows.

## Compound engineering integration

All files produced by skills related to the compound engineering plugin must be stored in the `.compound-engineering` folder:

| Compound engineering document type | location                          | Read | Write |
| ---------------------------------- | --------------------------------- | ---- | ----- |
| Ideation                           | .compound-engineering/ideates     | Yes  | Yes   |
| Brainstormings                     | .compound-engineering/brainstorms | Yes  | Yes   |
| Plans                              | .compound-engineering/plans       | Yes  | Yes   |
| Review                             | .compound-engineering/reviews     | Yes  | Yes   |
| Solutions                          | .compound-engineering/solutions   | Yes  | Yes   |
