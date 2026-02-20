---
layout: post
title: "NYC Financial Data: Why the Largest City Needs Its Own Import Pipeline"
date: 2026-02-19
permalink: /nyc-financial-data/
description: "NYC is 40% of New York State but was missing from our dataset. We built a custom ACFR import — 77 metrics, 10 years, 763 observations of audited actuals. Here's what we found."
categories: [data-sources, data-quality]
tags: [nyc, acfr, osc, fund-balance, gasb-54, excel-parsing, data-pipeline]
author: Ben Unger
---

*NYC is now live on [NY Benchmark](https://app.nybenchmark.org/entities/nyc). Here's the story of why it wasn't there before, what we imported, and what surprised us.*

## The missing 40%

New York City is home to 8.3 million people — roughly 40% of New York State's population. It runs the largest municipal government in the country, with a $117 billion budget that dwarfs every other city in the state combined.

And until today, it wasn't in our dataset.

The reason is structural: NYC has its own [Comptroller](https://comptroller.nyc.gov/) and does not file Annual Financial Reports with the NYS Office of the State Comptroller (OSC). Every other city in the state — all 61 of them — files with OSC. NYC operates under an entirely separate reporting system.

This isn't a data gap we could fix by asking nicely. It required building a separate import pipeline from scratch.

## Why ACFR, not budget data

NYC publishes financial data through multiple channels: the [Checkbook NYC](https://www.checkbooknyc.com) transparency portal, the annual budget, and the Annual Comprehensive Financial Report (ACFR). We evaluated all three.

**Budget data was tempting** — it's well-structured and available through an API. But a municipal budget is a plan, not a record. It reflects political priorities and revenue forecasts at the time of adoption. What actually happens over the next twelve months can look very different. Departments overspend or underspend. Revenue comes in above or below projections. Emergency spending appears that nobody budgeted for. Some governments track closely to their budgets; others treat them more like rough guidelines.

For NYC specifically, the gaps are large. Revenue projections can miss by 4-9%, and expenditure estimates can differ by billions. The [Citizens Budget Commission](https://cbcny.org/), the [Independent Budget Office](https://www.ibo.nyc.ny.gov/), and the Comptroller's own analysis all document this pattern. If you're comparing cities to each other — which is the entire point of benchmarking — you need to compare what they actually spent and collected, not what they hoped to.

**The ACFR is audited actuals.** An independent auditor has verified the numbers. This is the same standard we use for every other city in the state (via OSC filings), and it's the standard that credit rating agencies, the Government Finance Officers Association, and academic researchers rely on. Since FY 2022, the NYC Comptroller has published downloadable Excel files containing the ACFR's statistical tables. The Ten Year Trend tables give us FY 2016-2025 from a single download.

Maintaining audited-actuals-only across all 62 cities is worth the extra work. Mixing budget data for one city with ACFR data for the rest would undermine every comparison on the site.

## What we imported

From the FY 2025 ACFR statistical tables:

- **Expenditures** by functional category (General Government, Public Safety, Education, etc.) and by agency (~90 agencies including Police, Fire, DOE, CUNY, Sanitation, and more)
- **Revenue** by source (real estate tax, income tax, sales tax, federal grants, state grants, charges for services, etc.)
- **Fund balances** by GASB 54 classification (Restricted, Committed, Assigned, Unassigned) for General Fund and all governmental funds

In total: **77 metrics, 10 fiscal years (FY 2016-2025), 763 observations**.

We mapped NYC's functional categories to OSC's `level_1_category` names (e.g., NYC's "Public Safety and Judicial" becomes "Public Safety") so that cross-city comparisons work. Agency-level detail goes into `level_2_category`, giving NYC richer drill-down data than most other cities have.

One important caveat: the Department of Education's $34.1 billion appears as a city expenditure line item under "Education." But unlike upstate cities where school districts are separate entities with their own per-pupil metrics, NYC's DOE is part of the city government. We capture the spending total but don't yet break it down as a school district with enrollment-normalized metrics. That's a future project — and a significant one, given that NYC's education budget alone is larger than the total budget of most US states.

## The 98 agencies we haven't mapped yet

NYC's ACFR lists 134 individual agencies across 13 functional categories. We mapped 36 of them to individual `level_2_category` entries — the major departments like Police, Fire, DOE, Sanitation, and so on. The remaining 98 are captured in their category totals (no spending is lost at the aggregate level) but aren't broken out individually yet.

Some of these unmapped agencies are uniquely NYC:

| Group | Count | FY 2025 Total | Notes |
|-------|-------|---------------|-------|
| District Attorneys | 5 | $510.6M | One per borough — other cities have DAs at the county level |
| Borough Presidents | 5 | $32.6M | No equivalent in any other NY city |
| Community Boards | 55 | $17.7M | ~$300K each, hyper-local advisory bodies |
| Campaign Finance Board | 1 | $144.9M | NYC's public matching funds program |
| Board of Elections | 1 | $273.4M | Most cities handle this at county level |

These aren't data gaps — they're structural differences in how NYC governs compared to every other city in the state. Borough Presidents, Community Boards, and a citywide DA system with five offices don't exist anywhere else. Mapping them to OSC-compatible categories requires careful judgment about where they fit, and in some cases they simply don't have a clean equivalent.

## Parsing the Excel files

The technical challenge wasn't the data itself — it was extracting it from Excel files that were clearly designed for human reading, not machine processing.

The ACFR statistical tables are formatted for print. Agency names spill across multiple rows because they're too long for a single cell. Category headers like "General Government:" sit on their own row with no numeric data. Some categories span multiple pages and repeat with "(cont.)" appended. The fund balance file has decorative filler text between section headers.

A few specific headaches:

**Multi-row agency names.** "260 Department of Youth and Community Development" spans three rows in the spreadsheet — the name on the first two rows (text only, no numbers), the data on the third. The importer accumulates text-only rows and prepends them when it hits a data row.

**Category headers vs. name fragments.** Both are text-only rows with no numbers. The difference: category headers end with a colon. But some category names *also* span two rows ("Parks, Recreation, and / Cultural Activities:"), so the importer has to distinguish between a legitimate two-row header and filler text that accumulated before the real header.

**Filler text accumulation.** The fund balance file has rows like "Capital projects," "Debt service," "Noncurrent mortgage loans" sitting between "Reserved for:" and "Committed for:" — descriptive labels with no data. If the importer naively combines all accumulated text with the next colon-terminated header, you get nonsense. The fix: only combine if exactly one text row was accumulated (a legitimate two-row header). Three or more accumulated rows get discarded as filler.

We verified the parser's output against exact dollar amounts from the published ACFR PDF. Police Department: $6,610,389,000. Total Expenditures: $109,610,157,000. Real Estate Tax: $34,756,900,000. Every number matches to the dollar.

## The fund balance surprise

This was the most interesting finding. When you look up a typical NY city's fiscal health, one of the key metrics is **Fund Balance %** — Unassigned General Fund Balance (account code A917) as a percentage of expenditures. This tells you how many months of reserves a city has.

NYC's General Fund has **no unassigned fund balance**. Zero.

This doesn't mean NYC is broke. It means NYC classifies its reserves differently:

- **Restricted:** $2.0 billion (legally restricted for specific purposes)
- **Committed:** $1.97 billion (the Revenue Stabilization Fund — NYC's rainy day fund, committed by City Council resolution)

Under GASB 54, "Committed" is one step below "Assigned" and two steps below "Unassigned." NYC's policy is to park its reserves in the Committed classification, which has a higher bar for release (requires City Council action). This is arguably *more* fiscally conservative than leaving reserves as "Unassigned."

We've updated our Fund Balance % metric to use **Available Fund Balance** — the sum of Committed, Assigned, and Unassigned balances. This is what credit rating agencies (Moody's, S&P) and the [GFOA](https://www.gfoa.org/) actually look at. Under this definition, NYC's $1.97B Committed balance shows up correctly. The old metric (Unassigned only) would have shown 0% — a classification artifact, not a sign of financial weakness. Buffalo had the same problem in some years after moving reserves to their Committed rainy day fund.

We've also added domain notes in our [MCP server](https://nybenchmark.org/mcp) to flag NYC's unique fund balance structure for AI tools that query the data.

## Key numbers (FY 2025)

| Metric | Value |
|--------|-------|
| Total Expenditures | $109.6 billion |
| Total Revenue | $117.7 billion |
| Police Department | $6.6 billion |
| Fire Department | $2.5 billion |
| Department of Education | $34.1 billion |
| Real Estate Tax | $34.8 billion |
| Committed Fund Balance (GF) | $2.0 billion |

For context, NYC's police budget alone ($6.6B) is larger than the entire budget of any other city in the state. Per-capita and percentage metrics are the only meaningful way to compare NYC with its peers.

## What's next

- **MCP server** — Our [MCP server](https://nybenchmark.org/mcp) lets AI tools like Claude query NYC and all other city data directly, with domain-aware caveats that flag comparability issues like fund balance classification automatically.
- **Agency-level drill-downs** — The remaining 98 agencies, including District Attorneys, Borough Presidents, and Community Boards, will get individual mappings in a future update.
- **Historical extension** — The FY 2022 ACFR ZIP extends some metrics back to FY 2005. A future import will add that historical depth.
- **DOE as a school district** — Breaking out the Department of Education's $34.1B with per-pupil and enrollment-normalized metrics, comparable to our upstate school district data.

NYC is live now at [app.nybenchmark.org/entities/nyc](https://app.nybenchmark.org/entities/nyc).

{% include cta-banner.html %}
