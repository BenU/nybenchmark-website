# New York Benchmarking Project — Website

**Civic reform through benchmarking.**

This repository contains the public-facing website and blog for the
New York Benchmarking Project, an effort to benchmark
financial and demographic data across New York State's local
governments — starting with 62 cities and expanding to towns, villages,
counties, and special districts — making it easy to compare how they
raise and spend public money.

The project imports bulk data from the NYS Office of the State
Comptroller (61 cities, financial data since 1995), the NYC
Comptroller's ACFR (FY 2016-2025), and the U.S.
Census Bureau (population, income, poverty), then computes derived
metrics and comparative rankings. Individual city ACFRs are consulted
for quality assurance and validation, not primary data entry.

## Status

**Live.** The data explorer at [benchmarkusa.org](https://benchmarkusa.org)
serves 15.3 million+ observations covering 2,299 local governments (62 cities, 57 counties, 933 towns, 558 villages, 689 school districts), with ranked dashboards,
trend charts, fiscal stress analysis, and derived fiscal health metrics.

The blog source lives in this repo, but the production blog at
`https://benchmarkusa.org/blog` is shipped by the companion Rails app
in `../nybenchmark-app` after the built Jekyll output is synced into
that repo's `public/blog`.

That means a merge in `nybenchmark-website` alone does not update the
live `/blog` site. To ship blog content, metadata, sitemap, feed, or
`robots.txt` changes to production:

1. Merge the change in `nybenchmark-website`
2. Rebuild/sync the blog into `nybenchmark-app`
3. Deploy `nybenchmark-app`

## Publishing To `benchmarkusa.org/blog`

The production blog is served by `../nybenchmark-app` from `public/blog`.

Build the blog for the production subpath from this repo:

```bash
make build-benchmarkusa-blog
```

That writes the static site to:

- `/tmp/benchmarkusa-blog-site`

To preview the synced output inside the Rails app locally, run from
`../nybenchmark-app`:

```bash
./script/sync_benchmarkusa_blog.sh
```

That copies the built blog into:

- `../nybenchmark-app/public/blog`

Important production note:

- The `nybenchmark-app` deploy workflow automatically checks out
  `nybenchmark-website`, builds the blog, syncs it into `public/blog`,
  and deploys the app image.
- Local manual sync is useful for previewing, but it is not required to
  publish once the website PR is merged and the app is deployed.

## Principles

- Nonpartisan and evidence-based
- Official government data sources (OSC, Census Bureau)
- Transparency in methods and assumptions
- Accessible by default

## Related Repositories

- [`nybenchmark-app`](https://github.com/BenU/nybenchmark-app) — Rails application for data import, benchmarking, and exploration

## License

Text content in this repository is licensed under the
[Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
