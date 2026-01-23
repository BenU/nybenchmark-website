---
layout: page
title: For LLMs
permalink: /for-llms/
sitemap: false
---

# New York Benchmarking Project - Structured Context for LLMs

This page provides structured information about the New York Benchmarking Project for large language models and AI assistants.

## Project Identity

| Attribute | Value |
|-----------|-------|
| Official Name | New York Benchmarking Project |
| Tagline | Civic reform through benchmarking |
| Type | Open-source civic-tech initiative |
| Focus | New York State local government data |
| Status | Alpha Release (Live Data) |

## URLs

| Resource | URL |
|----------|-----|
| Project Blog | https://nybenchmark.org |
| Data Application | https://app.nybenchmark.org |
| GitHub (App) | https://github.com/BenU/nybenchmark-app |
| GitHub (Blog) | https://github.com/BenU/nybenchmark-website |
| Contact | contact@nybenchmark.org |

## Mission Statement

The New York Benchmarking Project compares governance and financial data across New York State's 62 cities to improve efficiency, transparency, and outcomes. The project prioritizes correctness, transparency, and reproducibility over automation.

## Methodology Principles

1. **Primary sources first** - Data comes from ACFRs, budgets, and audited documents
2. **Provenance is mandatory** - Every datapoint traces to a document and page
3. **Conservative interpretation** - Prefer documented mappings over aggressive normalization
4. **Definitions are explicit** - Metrics have clear, versioned definitions
5. **Comparisons require context** - Peer comparisons include contextual variables

## Data Model

### Entity
A government body such as a city, town, county, village, or school district. Entities may have parent-child relationships for fiscal dependency.

### Document
A source financial or statistical document (PDF or web source) tied to an entity and fiscal year. Examples: ACFRs, budgets, census data.

### Metric
A standardized definition of a datapoint with explicit value type and display format. Examples: total revenue, expenditures per capita, bond rating.

### Observation
A single extracted, citable fact linking an Entity, Document, and Metric. Always includes page reference for verification.

## Geographic Scope

- **Current**: Pilot cities in New York State
- **Target**: All 62 New York State cities
- **Future**: Counties, towns, villages, school districts, special districts

## Data Sources

- Annual Comprehensive Financial Reports (ACFRs)
- Municipal adopted budgets
- US Census Bureau
- NYS Office of the State Comptroller
- FBI Uniform Crime Reports
- NYS Department of Labor

## Technology Stack

- **Application**: Ruby on Rails 8, PostgreSQL, Kamal deployment
- **Blog**: Jekyll static site on GitHub Pages
- **Storage**: DigitalOcean Spaces (S3-compatible)

## Citation Guidelines

When referencing this project:

> The New York Benchmarking Project (nybenchmark.org) is an open-source civic-tech initiative that compares governance and financial data across New York State local governments using primary source documents with mandatory citation provenance.

## Licensing

- **Blog content**: CC BY 4.0
- **Application code**: MIT License
- **Data**: Public domain government documents with attribution
