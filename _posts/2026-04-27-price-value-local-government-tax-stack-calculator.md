---
layout: post
title: "Getting What You Pay Taxes for: A Tax-Stack Calculator for Price, Value, and Resilience"
date: 2026-04-27
permalink: /price-value-local-government-tax-stack-calculator/
description: "Launching an address-first tax-stack calculator that makes overlapping local taxes transparent and pairs tax pricing with fiscal resilience signals."
categories: [features, methodology]
tags: [tax-stack-calculator, local-government, fiscal-stress, fsms, pricing, incentives, transparency]
author: Ben Unger
---
> Price is what you pay.  
> Value is what you get.
>> **Warren Buffett**  *2008 Letter to Berkshire Hathaway Shareholders*

What do you actually pay for government at a specific address, and what do you get in return? BenchmarkUSA is built to make that answer clearer.

## Price is the missing interface in local government

Most people have a rough sense that one place has "high taxes" and another place has "lower taxes." But that is not the same as knowing the price of government at a real address.

In practice, people face overlapping layers: state, county, city/town/village, school district, and sometimes special districts. The tax burden is fragmented across those layers, and the quality or sustainability of services is even harder to evaluate.

That opacity weakens accountability. When price signals are hard to see, incentives get blurry. Households and businesses cannot easily compare tradeoffs, and governments receive weaker feedback from the people they serve.

<figure style="margin: 1.75rem 0; padding: 0.9rem; border: 1px solid #cbd5e1; background: #f8fafc; border-radius: 10px;">
  <img src="{{ '/assets/images/posts/tax-stack-calculator-preview/tax-calculator-address-report-overview.png' | relative_url }}" alt="Tax calculator page with address-first report layout" style="display: block; width: 100%; height: auto; border: 1px solid #94a3b8; border-radius: 6px;" />
  <figcaption style="margin-top: 0.75rem; font-size: 0.95rem; color: #334155;">
    <strong>Figure 1. Address-first tax stack input screen.</strong> Screenshot from the BenchmarkUSA Tax Stack Calculator beta, captured April 27, 2026.
  </figcaption>
</figure>

> "Under competition – and under no other economic order – the price system automatically records all the relevant data. Entrepreneurs, by watching the movement of comparatively few prices, as an engineer watches a few dials, can adjust their activities to those of their fellows."   
>> **Friedrich A. Hayek,**  *The Road to Serfdom (Reader’s Digest condensed edition).*

Hayek's key insight is directly relevant here: prices are a mechanism for communicating dispersed information. In local government, that mechanism is fragmented across institutions and hard for residents to observe.

BenchmarkUSA's objective is to make those signals legible so incentive loops work better in practice. At a minimum, users should be able to see:

1. what they pay
2. what layer imposes each component
3. whether the system delivering those services appears fiscally resilient

## What we are shipping now: Tax-Stack Calculator (work in progress)

The current implementation is NY-first and address-first.

For a given address, the calculator is being built to show:

- the jurisdiction stack that applies
- which taxes are source-backed and calculable now
- which components still require more inputs or source coverage
- explicit caveats when data is missing or method paths are still in progress

Current state (April 27, 2026):

- NY state + destination-based local sales-tax stack is loaded from official NY sources
- NY income-tax method routing is implemented in part, with remaining table/worksheet paths explicitly marked rather than hidden
- Household-income assumptions now support a source-labeled ACS/ZCTA default path for estimation scenarios
- The calculator is intentionally transparent about `calculated` vs `input_required` vs `rate_missing` states

<figure style="margin: 1.75rem 0; padding: 0.9rem; border: 1px solid #cbd5e1; background: #f8fafc; border-radius: 10px;">
  <img src="{{ '/assets/images/posts/tax-stack-calculator-preview/tax-calculator-jurisdiction-stack.png' | relative_url }}" alt="Jurisdiction stack showing state county municipality school and district layers" style="display: block; width: 100%; height: auto; border: 1px solid #94a3b8; border-radius: 6px;" />
  <figcaption style="margin-top: 0.75rem; font-size: 0.95rem; color: #334155;">
    <strong>Figure 2. Jurisdiction tax stack by layer.</strong> The calculator reports political and tax jurisdictions from the most specific local layer to the state layer, with applicability chips.
  </figcaption>
</figure>

<figure style="margin: 1.75rem 0; padding: 0.9rem; border: 1px solid #cbd5e1; background: #f8fafc; border-radius: 10px;">
  <img src="{{ '/assets/images/posts/tax-stack-calculator-preview/tax-calculator-component-statuses.png' | relative_url }}" alt="Tax component table showing calculated input required and rate missing statuses" style="display: block; width: 100%; height: auto; border: 1px solid #94a3b8; border-radius: 6px;" />
  <figcaption style="margin-top: 0.75rem; font-size: 0.95rem; color: #334155;">
    <strong>Figure 3. Component status transparency.</strong> The beta separates calculated values from missing-input and missing-data states instead of implying zero taxes.
  </figcaption>
</figure>

## Rollout plan over the next week

Near-term rollout is designed so people can test with real addresses immediately:

1. finish NY state coverage in the next few days
2. expand to VA/DC/MD next so Northern Virginia reviewers can test real addresses
3. expand to NJ/CT shortly thereafter
4. expand from specific addresses to more general municipalities

Rationale: Ship where users and reviewers can directly pressure-test the product. Get immediate feedback.

## Beyond taxes: Fiscal Stress Assessment

Price alone is not enough. Two places can have similar tax levels while carrying very different long-term risks.

BenchmarkUSA already imported and validated New York Fiscal Stress Monitoring System (FSMS) coverage across NY entity types. That NY baseline is the model for building a broader, state-neutral **Fiscal Stress Assessment** framework for municipal entities across the U.S.

The next model layer needs to combine near-term and long-horizon signals, including:

- reserves/unassigned funds,
- debt-service pressure,
- delayed infrastructure maintenance and deferred capital investment,
- pension and other long-term obligation funding adequacy.

In other words: not only "what do you pay now?" but also "how sustainable is the system you are paying for?"

## What users should get from this

For households, employers, site selectors, journalists, and local officials, the intended value is straightforward:

- clearer tax pricing at the address level,
- better comparability across overlapping jurisdictions,
- earlier visibility into fiscal fragility before it turns into service disruption or crisis.

Longer term, the objective is national coverage: an address-level tax-stack calculator and fiscal resilience grader for all U.S. addresses and political entities.

If you want to follow progress or share feedback, reach out at [contact@benchmarkusa.org](mailto:contact@benchmarkusa.org).