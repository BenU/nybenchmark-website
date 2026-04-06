---
layout: page
title: Roadmap
permalink: /roadmap/
description: "What BenchmarkUSA has built and what's next: nationwide Census coverage, expanding multi-state financial data, and better comparison tools."
---

BenchmarkUSA is building an open, comprehensive platform for comparing how local governments raise and spend public money. The project started in New York and now includes nationwide Census coverage plus expanding multi-state financial data. Here is what we have built, what we are building next, and where the project is headed.

## What exists today

**A working data platform** at [benchmarkusa.org](https://benchmarkusa.org) with:

- **Nationwide Census coverage** — demographic data for municipalities across the United States, providing national context for local government comparisons
- **Multi-state financial coverage** — deep financial data in New York plus expanding state-level imports including California, Florida, and North Carolina
- **Ranked dashboards** — Cities ranked by Fund Balance %, Debt Service %, and Per-Capita Spending, making it immediately visible which cities are financially healthy and which are under stress
- **Per-city trend charts** — Revenue, expenditure, and balance sheet trends since 1995 for each city
- **Derived fiscal health metrics** — Fund Balance as a % of Expenditures, Debt Service as a % of Expenditures, and Per-Capita Spending — ratios that make comparison across cities of different sizes meaningful
- **Non-filer tracking** — Identification and public accountability for cities that fail to file required financial reports (approximately 20% of NY local governments file late or not at all)
- **Data quality infrastructure** — Exclusion of custodial pass-throughs and interfund transfers that would otherwise inflate expenditure figures by 40-50% for some cities; all-fund approach that handles the wide variation in how cities organize their budgets
- **Full documentation** — Public [methodology](https://benchmarkusa.org/methodology) and every data point traceable to its official source

## Near-term: Comparison tools

The data infrastructure is in place. The next phase makes it *actionable* for residents and policymakers:

- **Side-by-side city comparison** — Select two or more cities and compare them on any metric across years. How does your city's spending trajectory compare to its peers? Shareable URLs so comparisons can be embedded in news articles and policy discussions.
- **Metric-specific leaderboards** — Rank governments on individual spending categories. Which city spends the most on police per capita? Which has the lowest debt service burden? Today we rank on a limited set of summary metrics; this extends rankings to hundreds of specific line items.
- **Category drill-downs** — Break broad categories (Public Safety, Debt Service) into their components (Police, Fire, Interest on Debt, Debt Principal) and compare across governments. A resident asking "why is my city's Public Safety spending so high?" can see whether it's driven by police, fire, or something else — and how that compares to peers.

## Medium-term: Expanding coverage

- **New York City** ✅ — NYC data imported from the NYC Comptroller's ACFR (FY 2016-2025). Expenditures by functional category and agency, revenue by source, and fund balance classifications. NYC now appears in city rankings and comparisons.
- **Towns, villages, and counties** ✅ — 933 towns, 558 villages, and 57 counties imported from OSC (1995-present). Queryable and rankable alongside cities. Special districts (fire districts, LDCs, IDAs, libraries) still to come.
- **Crime and public safety data** — Import property and violent crime rates from state and federal sources. Essential context for evaluating public safety spending.
- **State aid dependency** — A derived metric measuring what share of each government's revenue comes from state aid, benchmarking fiscal independence across jurisdictions.

## Long-term: Context and insight

Raw spending numbers can mislead without context. A city with high per-capita spending might be responding to high poverty, high crime, or unique service obligations. The long-term goal is to move from "what" to "why":

- **Demographic overlay** — Visualize spending alongside poverty rates, population density, median income, and other Census variables that affect what local governments need to provide
- **Cross-entity-type analysis** — Compare cities vs. villages vs. towns on comparable per-capita metrics, controlling for differences in service responsibilities
- **Staffing benchmarks** — Import FTE staffing data by department (police, fire, public works) from ACFRs to compare not just what governments spend, but how many people they employ to deliver services
- **Automated data refresh** — Scheduled imports so the platform stays current as new OSC and Census data is released each year

## The case for this project

State comptrollers, finance departments, and federal data agencies do invaluable work collecting public finance data. But those sources are usually published in formats designed for auditors, regulators, or internal reporting workflows, not for residents and policymakers trying to compare one government to another.

No existing public tool makes it easy for a resident, journalist, or researcher to answer: *"How does my local government's police spending per capita compare to similar places? Is our debt service burden typical or unusual? Are we spending more or less than comparable communities on fire protection, and can the difference be explained by poverty, population, or service obligations?"*

That is what BenchmarkUSA is designed to do. We build on official public data — giving the source agencies full credit — and transform it into the comparative, accessible format that democratic accountability requires.

{% include cta-banner.html %}
