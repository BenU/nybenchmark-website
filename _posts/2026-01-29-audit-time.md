---
layout: post
title: "Audit Time: Pausing to Verify Municipal Financial Data Accuracy"
date: 2026-01-29
description: "Municipal financial data from the NYS Comptroller is complex and inconsistent. We're auditing our numbers against city ACFRs to ensure accuracy before anyone relies on them."
categories: [data-quality]
tags: [audit, acfr, osc, custodial-pass-throughs, interfund-transfers, white-plains, plattsburgh, new-rochelle]
author: Ben Unger
---

I pushed my first line of code to [GitHub](https://github.com) on December 13, 2025, about 6 weeks ago, and have been wrestling with getting this database set up to accurately compare the financial data of the hundreds of political entities in the great state of New York.  I spent soul killing hours over many days poring over the most recent [Annual Comprehensive Financial Report](https://en.wikipedia.org/wiki/Annual_comprehensive_financial_report), often called an "ACFR," for my city and [New Rochelle](https://en.wikipedia.org/wiki/New_Rochelle,_New_York).  At around 81 thousand people, New Rochelle is New York's 7th largest city and the largest one with a [council-manager](https://en.wikipedia.org/wiki/Council%E2%80%93manager_government) organization.

But governmental finance is complex, often influenced by the exigencies -- political, financial, etc. -- of the moment rather than by any interest in clarity and standardization.  New Rochelle, for instance, has a school system that is politically (elected school board) and financially (levies its own taxes) independent.  My city, in contrast, has a strong mayor who appoints the school board and the city pays for all of the school district's expenses.  I need to subtract out education-related expenses if I want to compare my city with New Rochelle.

## Custodial Pass-Throughs

But it doesn't stop there.  My initial data showed that White Plains was "spending" more per capita than any other city in NY -- over $8k, almost double the next city.  I looked more closely and noticed that White Plains and several other cities in Westchester and Nassau counties collect taxes on behalf of the county, school districts, and special districts, then pass those dollars along.  That's not spending but I was counting it as such.  Once I pulled those custodial pass-throughs out, White Plains' per-capita spending dropped to a more reasonable level, ranking it #4 instead of #1.

## Interfund Transfers

I also found a second problem: interfund transfers.  The data I'm working with comes from the [Office of the New York State Comptroller](https://www.osc.ny.gov/) (OSC), which reports finances at the fund level, not the consolidated government-wide level that cities publish in their ACFRs.  When a city moves money from its General Fund to its Debt Service Fund, that shows up as an "expenditure" in one fund and "revenue" in another.  Sum across all funds without eliminating these internal transfers and you double-count.  Across all cities and years in the database, that's $10.5 billion in phantom spending.

## The Plattsburgh Anomaly

A particularly weird manifestation of this: I highlight the percent of total annual spending that a community spends on debt service, which seems like a good metric for how well a community has been living within its means.  Plattsburgh, NY was showing debt service at 156% of annual spending -- a mathematical impossibility.  The problem was that my code was only counting General Fund expenditures in the denominator while including debt service from all funds in the numerator.  Plattsburgh books all of its debt in non-General Fund accounts, so the denominator was artificially small.  Once I included all funds (minus the custodial pass-throughs and interfund transfers), the number dropped to a still-high-but-real 38.7%.

## Time for an Audit

I'm glad I was able to find and fix these outliers but it raises the question: what other errors are lurking in my data?  I don't want to be like the [Beardstown Ladies Investment Club](https://en.wikipedia.org/wiki/Beardstown_Ladies) who claimed in [their 1995 bestseller on investment advice](https://www.amazon.com/Beardstown-Ladies-Common-Sense-Investment-Guide/dp/0786881208) that they earned a 23.4% annual return since inception.  Three books later an audit showed their actual return was 9.1%, well below the S&P 500 returns for the time period.  Time for an internal audit to see if my numbers match what the cities report in their own ACFRs rather than my interpretation of what the OSC is collecting and publishing on the cities' behalf.  See details of what I'll be looking for in the [app's AUDIT.md file](https://github.com/BenU/nybenchmark-app/blob/main/AUDIT.md).

I'll update what I find here.  Fingers crossed that my numbers aren't too far off -- and if they are, better to find out now than after someone makes a decision based on bad data.
