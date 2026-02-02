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
│   └── custom-head.html     # Schema.org JSON-LD (WebSite, Organization, SoftwareApplication)
├── _posts/                  # Blog posts
├── assets/images/           # OG image, post images
├── index.md                 # Home page (layout: home)
├── about.md                 # About page (layout: page)
├── methods.md               # Methodology (layout: page)
├── data.md                  # Data explorer page (layout: page)
├── for-llms.md              # LLM context page (sitemap: false)
├── robots.txt               # Crawler directives, references llms.txt
├── llms.txt                 # LLM-readable project context
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

## Known Issues

- Duplicate `WebSite` Schema.org block on homepage (one from `jekyll-seo-tag`, one from `custom-head.html`)
- `jekyll-seo-tag` renders author as `@type: Person` but config value `"New York Benchmarking Project"` is an organization
- No Twitter/X account configured (`twitter:site` tag is absent)

## Companion Repo

The Rails data application lives at `../nybenchmark-app`. See its `CLAUDE.md` for development context, domain rules, and TODO list. Changes to the app require Docker, feature branches, CI (`dci`), and Kamal deploy.
