---
layout: page
title: Methods
permalink: /methods/
description: "How NY Benchmark works: bulk data from the NYS Comptroller and U.S. Census Bureau, derived fiscal health metrics, and the data principles behind our comparisons."
---

This project benchmarks New York State local governments using bulk data from official government sources. The goal is to publish comparable metrics with clear provenance so that readers can evaluate claims, reproduce results, and improve the dataset.

For a more detailed technical discussion, see the [Methodology page on the app](https://app.nybenchmark.org/methodology).

## Data sources

### NYS Office of the State Comptroller (OSC)

The [OSC](https://www.osc.ny.gov/local-government/data) collects standardized Annual Financial Reports from local governments across New York State. This is an invaluable public resource — the Comptroller's office does the hard work of defining reporting standards and gathering data from thousands of jurisdictions.

NY Benchmark imports OSC data for all 61 cities that file with the Comptroller. (NYC has its own Comptroller and publishes its data separately through [Checkbook NYC](https://www.checkbooknyc.com).) The dataset spans **1995 through the present** and includes revenue, expenditure, and balance sheet data at the fund and account-code level — over **647,000 individual observations**.

### U.S. Census Bureau

Demographic data (population, median household income, poverty rates, and more) is imported from the Census Bureau's [American Community Survey](https://www.census.gov/programs-surveys/acs) 5-year estimates, covering **2012 through the present** — over **14,000 observations** across 62 cities.

### NYC Checkbook (planned)

New York City publishes its financial data through [Checkbook NYC](https://www.checkbooknyc.com). Import of this data is planned, which will bring the largest municipal government in the country into the benchmarking dataset.

## What NY Benchmark adds

The raw data from OSC and Census is publicly available, but it is not designed for benchmarking. OSC publishes annual CSVs organized by year and fund — useful for auditors and researchers, but not structured for the kind of cross-city, multi-year comparisons that residents and policymakers need.

NY Benchmark transforms this data into something comparable:

- **Derived metrics** — Fund Balance as a % of Expenditures, Debt Service as a % of Expenditures, Per-Capita Spending — that distill complex financial statements into numbers you can compare across cities of different sizes.
- **Fund normalization** — An all-fund approach that includes spending from General, Water, Sewer, Highway, and other funds while excluding custodial pass-throughs (Trust & Agency fund) and interfund transfers that would otherwise double-count or inflate totals.
- **Trend charts** — Data since 1995 visualized per city, so you can see trajectories, not just snapshots.
- **Rankings** — Cities ranked on key fiscal health metrics, surfacing both best practices and outliers.

### Coming soon

- **Side-by-side comparison** — Select two or more cities and compare them on any metric, with population-adjusted context.
- **Metric leaderboards** — Rank all cities on specific spending categories (e.g., police spending per capita, fire department costs, debt service burden).
- **Category drill-downs** — Break down broad categories (Public Safety, Debt Service) into their components (Police, Fire, Interest, Principal) across cities.
- **Cross-entity-type analysis** — Compare cities vs. villages vs. towns on comparable metrics, once those entity types are imported.
- **Demographic context** — Understand spending differences in light of poverty rates, population density, and other factors that affect what local governments need to provide.

## Data principles

### 1) Official sources first
Data is imported from official government databases (OSC, Census Bureau) rather than secondary summaries or news reports. Individual city ACFRs are consulted for quality assurance and validation — see the [Audit Time](https://nybenchmark.org/2026/01/29/audit-time.html) blog post for an example of this verification process.

### 2) Provenance is mandatory
Each data point traces to a source: the OSC dataset and year, the Census survey and variable, or (for manually-entered data) a specific document and page number.

### 3) Conservative interpretation
When reporting practices differ across jurisdictions, the project prefers conservative, well-documented approaches over aggressive normalization. For example, the all-fund approach was chosen specifically to handle the fact that cities organize their funds differently — some run water and sewer through the General Fund, others use separate Enterprise funds.

### 4) Definitions are explicit
Derived metrics like Fund Balance % and Debt Service % have specific, documented formulas. When definitions are revised (as happened when custodial pass-throughs and interfund transfers were excluded), the change is documented and applied consistently across all cities and years.

### 5) Comparisons require context
Raw numbers can mislead. Per-capita normalization is a start, but meaningful benchmarking will ultimately require demographic, economic, and service-level context. This is an ongoing effort.

## Known limitations

- **Late and non-filing cities** — Four cities (Mount Vernon, Ithaca, Rensselaer, Fulton) have not filed recent financial reports with the OSC. Their data ends at their last filing year. See the [Non-Filers page](https://app.nybenchmark.org/non-filers) for details.
- **NYC is separate** — New York City is not in the OSC system and will require a separate data import from Checkbook NYC.
- **Reporting differences** — Cities organize their funds and accounts differently. The all-fund approach handles most of this, but edge cases exist (see the [Methodology page](https://app.nybenchmark.org/methodology) for specifics on custodial pass-throughs and the Plattsburgh debt service case).
- **Census margins of error** — ACS 5-year estimates for smaller cities can have wide confidence intervals, particularly for income and poverty metrics.

## Corrections and contributions

If you believe a metric is incorrect or ambiguous, please email [contact@nybenchmark.org](mailto:contact@nybenchmark.org) with the city, fiscal year, specific metric, and a citation to the relevant source.

Methods will evolve as the dataset grows; changes will be documented publicly.

{% include cta-banner.html %}
