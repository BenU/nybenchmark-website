---
sitemap: false
---

# Claude Code Context

This file provides essential context for Claude Code sessions working on the NY Benchmarking Project blog/marketing site.

## Project Overview

- **Site:** https://nybenchmark.org
- **Companion app:** https://app.nybenchmark.org (separate repo: `../nybenchmark-app`)
- **Purpose:** Jekyll blog and marketing site for the New York Benchmarking Project, a civic-tech initiative comparing financial data across NY State local governments
- **Repo:** https://github.com/BenU/nybenchmark-website

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Static site generator | Jekyll 4.4.x |
| Theme | Minima 2.5 (default, no custom skin) |
| Hosting | GitHub Pages (legacy/automatic build) |
| Domain | nybenchmark.org (via Cloudflare) |
| Plugins | jekyll-feed (RSS), jekyll-sitemap, jekyll-seo-tag (via Minima) |

## Site Structure

```
├── _config.yml              # Jekyll configuration
├── _includes/
│   ├── custom-head.html     # Custom CSS + Schema.org JSON-LD
│   ├── header.html          # Custom nav (overrides Minima): Blog, Methods, Roadmap, About, Data App
│   ├── footer.html          # Custom 3-column footer (overrides Minima): contact, site links, app deep links
│   ├── cta-banner.html      # Reusable CTA banner (included on content pages and blog posts)
│   ├── head.html            # Head with SEO, analytics, custom-head include
│   └── google-analytics.html # GA4 snippet
├── _layouts/
│   ├── home.html            # Homepage layout (overrides Minima)
│   └── post.html            # Blog post layout with CTA banner + social sharing
├── _posts/                  # Blog posts
├── assets/images/           # OG image, post images
├── index.md                 # Home page: stats bar, CTA cards, deep links to app
├── about.md                 # About page (layout: page)
├── methods.md               # Methodology (layout: page)
├── data.md                  # Data explorer page (not in nav, kept for existing links)
├── for-llms.md              # LLM context page (sitemap: false)
├── robots.txt               # Crawler directives, references llms.txt
├── llms.txt                 # LLM-readable project context
├── Makefile                 # Local dev: make serve, make install, make build
├── Gemfile / Gemfile.lock   # Ruby dependencies
└── CLAUDE.md                # This file
```

## Blog Post Conventions

All posts use this front matter pattern:

```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD
description: "SEO-friendly description for meta tags and social sharing."
categories: [category1, category2]
tags: [tag1, tag2, tag3]
author: Ben Unger
---
```

- **`description`** is used by `jekyll-seo-tag` for `og:description`, `meta description`, and Twitter Cards
- **`categories`** and **`tags`** generate archive pages via Minima and help with SEO topic clustering
- **`date`** should always be explicit to ensure correct `article:published_time`
- **`image`** can be set per-post to override the site-wide default `og:image`

## SEO & Discoverability

| Component | Implementation |
|-----------|---------------|
| Meta tags / OpenGraph / Twitter Cards | `jekyll-seo-tag` (bundled with Minima) |
| Schema.org JSON-LD | Auto-generated `BlogPosting` per post + custom blocks in `custom-head.html` |
| Default OG image | `/assets/images/og-default.png` (set in `_config.yml`) |
| RSS/Atom feed | `jekyll-feed` plugin → `/feed.xml` |
| Sitemap | `jekyll-sitemap` plugin → `/sitemap.xml` |
| robots.txt | Manual, allows all bots, references sitemap and `llms.txt` |
| LLM context | `llms.txt` + `/for-llms` page (excluded from sitemap) |
| Google Search Console | Registered, sitemap submitted |

## Deployment

Push to `main` triggers GitHub Pages automatic build. Monitor build status at:
https://github.com/BenU/nybenchmark-website/actions

After deploying new posts, request indexing in Google Search Console via URL Inspection.

## Post-Deploy Verification

After pushing to `main`, verify the deploy succeeded and changes are live. Cloudflare CDN may serve stale content briefly after a build completes.

1. **Confirm build succeeded:**
   ```bash
   gh api repos/BenU/nybenchmark-website/actions/runs --jq '.workflow_runs[0] | {status, conclusion, head_sha: .head_sha[:7]}'
   ```

2. **Verify affected pages return 200** (check homepage + any pages that were added or changed):
   ```bash
   curl -s -o /dev/null -w "%{http_code}" https://nybenchmark.org/
   curl -s -o /dev/null -w "%{http_code}" https://nybenchmark.org/<path-to-changed-page>
   ```

3. **Spot-check meta tags** on any page where front matter, `_config.yml`, or `custom-head.html` changed:
   ```bash
   curl -s https://nybenchmark.org/<path> | grep -E 'og:(title|description|image|url|type)|twitter:(card|image)'
   ```

4. **Verify homepage links** if posts were added, removed, or renamed:
   ```bash
   curl -s https://nybenchmark.org/ | grep -o 'href="[^"]*"'
   ```

Use `WebFetch` sparingly for meta tag checks -- it strips `<head>` content during markdown conversion. Use `curl` via Bash instead.

## Local Development

Requires Homebrew Ruby (macOS system Ruby is too old for Jekyll 4.4). PATH is configured in `~/.zshrc`.

```bash
make install    # bundle install
make serve      # jekyll serve --livereload → http://localhost:4000
make build      # jekyll build (no server)
jserve          # shell alias, same as make serve
```

Note: changes to `_config.yml` require a server restart (Jekyll does not live-reload config changes).

## Design System

The site uses Minima 2.5 with custom overrides in `custom-head.html`:

- **Brand color:** `#1a5276` (navy) — used for headings, CTA buttons, card borders, hover states
- **Hover accent:** `#2980b9` (medium blue) — CTA button hover
- **Stats bar:** Horizontal stat counters on the landing page
- **CTA cards:** 2x2 grid of deep-link cards to app features (landing page only)
- **CTA banner:** Light blue banner (`#f0f6fa`) included at the bottom of all content pages and blog posts via `cta-banner.html`
- **Footer:** 3-column layout — contact/tagline, site links, app deep links

When adding new pages, include `{% include cta-banner.html %}` at the bottom of the content.

## Important Constraints

- **The application repo (`nybenchmark-app`) is private.** Do not add links to its GitHub repo on public-facing pages. The blog repo is public.
- **No open-source references.** The project is described as a "civic-tech initiative", not "open-source". This was intentionally changed site-wide.
- **Data counts:** The platform currently has 2.1M+ data points. Update this number when it changes significantly.

## Known Issues

- Duplicate `WebSite` Schema.org block on homepage (one from `jekyll-seo-tag`, one from `custom-head.html`)
- `jekyll-seo-tag` renders author as `@type: Person` but config value `"New York Benchmarking Project"` is an organization
- No Twitter/X account configured (`twitter:site` tag is absent)
- Sass `@import` deprecation warnings from Minima 2.5 (cosmetic, no functional impact — will be resolved when Minima updates)

## TODO

1. [x] **Verify deploy** — Fifty-state review post confirmed live at `https://nybenchmark.org/2026/02/02/state-local-government-financial-data.html`. GitHub Actions outage resolved by pushing an empty commit to retrigger the build.
2. [x] **Request GSC indexing** — New post URL submitted in Google Search Console via URL Inspection.
3. [x] **Landing page redesign** — Stats bar, CTA button + deep-link cards, removed old single text link.
4. [x] **Nav/footer overhaul** — Blog + external Data App link in nav; 3-column footer with site links and app deep links.
5. [x] **Remove open-source references** — Removed site-wide; app repo links removed from public pages.
6. [x] **Update data counts** — All references updated from 975K/661K to 2.1M+.

## Companion Repo

The Rails data application lives at `../nybenchmark-app`. See its `CLAUDE.md` for development context, domain rules, and TODO list. Changes to the app require Docker, feature branches, CI (`dci`), and Kamal deploy.
