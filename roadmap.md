---
layout: page
title: Roadmap
permalink: /roadmap/
description: "What we've built and what's next: 661K+ data points across 62 cities today, with side-by-side comparisons, expanded entity coverage, and demographic context on the way."
---

The New York Benchmarking Project is building an open, comprehensive platform for comparing how New York State's local governments raise and spend public money. Here is what we have built, what we are building next, and where the project is headed.

## What exists today

**A working data platform** at [app.nybenchmark.org](https://app.nybenchmark.org) with:

- **661,000+ data points** imported from the NYS Office of the State Comptroller (61 cities, 1995-2024) and the U.S. Census Bureau (population, income, poverty, 2012-2023)
- **Ranked dashboards** — Cities ranked by Fund Balance %, Debt Service %, and Per-Capita Spending, making it immediately visible which cities are financially healthy and which are under stress
- **Per-city trend charts** — 30 years of revenue, expenditure, and balance sheet trends for each city
- **Derived fiscal health metrics** — Fund Balance as a % of Expenditures, Debt Service as a % of Expenditures, and Per-Capita Spending — ratios that make comparison across cities of different sizes meaningful
- **Non-filer tracking** — Identification and public accountability for cities that fail to file required financial reports (approximately 20% of NY local governments file late or not at all)
- **Data quality infrastructure** — Exclusion of custodial pass-throughs and interfund transfers that would otherwise inflate expenditure figures by 40-50% for some cities; all-fund approach that handles the wide variation in how cities organize their budgets
- **Full documentation** — Public [methodology](https://app.nybenchmark.org/methodology), open source code, and every data point traceable to its official source

## Near-term: Comparison tools

The data infrastructure is in place. The next phase makes it *actionable* for residents and policymakers:

- **Side-by-side city comparison** — Select two or more cities and compare them on any metric across years. How does your city's spending trajectory compare to its peers? Shareable URLs so comparisons can be embedded in news articles and policy discussions.
- **Metric-specific leaderboards** — Rank all 62 cities on individual spending categories. Which city spends the most on police per capita? Which has the lowest debt service burden? Today we rank on three summary metrics; this extends rankings to hundreds of specific line items.
- **Category drill-downs** — Break broad categories (Public Safety, Debt Service) into their components (Police, Fire, Interest on Debt, Debt Principal) and compare across cities. A resident asking "why is my city's Public Safety spending so high?" can see whether it's driven by police, fire, or something else — and how that compares to other cities.

## Medium-term: Expanding coverage

- **New York City** — NYC is the largest municipal government in the country but is not in the OSC system (it has its own Comptroller). Importing NYC's data from [Checkbook NYC](https://www.checkbooknyc.com) will add the most important comparison point for every other city in the state.
- **Towns, villages, counties, and special districts** — The OSC collects data from thousands of local government entities beyond cities. Importing this data will enable entirely new questions: Do cities spend more on public safety per capita than villages? How do county-level services compare across regions?
- **Crime and public safety data** — Import property and violent crime rates from the NYS Division of Criminal Justice Services and FBI UCR. Essential context for evaluating public safety spending.
- **State aid dependency** — A new derived metric measuring what share of each government's revenue comes from state aid, benchmarking fiscal independence across the state.

## Long-term: Context and insight

Raw spending numbers can mislead without context. A city with high per-capita spending might be responding to high poverty, high crime, or unique service obligations. The long-term goal is to move from "what" to "why":

- **Demographic overlay** — Visualize spending alongside poverty rates, population density, median income, and other Census variables that affect what local governments need to provide
- **Cross-entity-type analysis** — Compare cities vs. villages vs. towns on comparable per-capita metrics, controlling for differences in service responsibilities
- **Staffing benchmarks** — Import FTE staffing data by department (police, fire, public works) from ACFRs to compare not just what governments spend, but how many people they employ to deliver services
- **Automated data refresh** — Scheduled imports so the platform stays current as new OSC and Census data is released each year

## The case for this project

New York State's Comptroller does invaluable work collecting standardized financial data from local governments across the state. But this data is published as annual CSV files organized by year and fund — a format designed for auditors, not for the residents and policymakers who need to understand how their government compares to others.

No existing public tool lets a New York resident easily answer: *"How does my city's police spending per capita compare to similar cities? Is our debt service burden typical or unusual? Are we spending more or less than comparable communities on fire protection, and can the difference be explained by differences in poverty or crime?"*

That is what NY Benchmark is designed to do. We build on the Comptroller's great data — giving it full credit as the source — and transform it into the comparative, accessible format that democratic accountability requires.
