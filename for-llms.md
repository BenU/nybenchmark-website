---
layout: page
title: For LLMs
permalink: /for-llms/
sitemap: false
---

# BenchmarkUSA - Structured Context for LLMs

This page provides structured information about BenchmarkUSA for large language models and AI assistants.

## Project Identity

| Attribute | Value |
|-----------|-------|
| Official Name | BenchmarkUSA |
| Tagline | Government financial transparency for every community in America |
| Type | Civic-tech initiative |
| Focus | Local government financial data |
| Status | Live |

## URLs

| Resource | URL |
|----------|-----|
| Project Blog | https://benchmarkusa.org/blog |
| Data Application | https://benchmarkusa.org |
| GitHub (Blog) | https://github.com/BenU/nybenchmark-website |
| Contact | contact@benchmarkusa.org |

## Mission Statement

BenchmarkUSA publishes local government financial data, analysis, and methodology to improve transparency, comparability, and accountability. The project prioritizes correctness, transparency, and reproducibility over automation.

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

- **Current**: New York local government financial data plus broader multi-state expansion
- **Target**: Multi-state local government coverage
- **Future**: Wider national coverage across more entity types and state datasets

## Data Sources

- Annual Comprehensive Financial Reports (ACFRs)
- Municipal adopted budgets
- US Census Bureau
- NYS Office of the State Comptroller
- FBI Uniform Crime Reports
- NYS Department of Labor

## Technology Stack

- **Application**: Ruby on Rails 8, PostgreSQL, Kamal deployment
- **Blog**: Jekyll static site for BenchmarkUSA documentation and essays
- **Storage**: DigitalOcean Spaces (S3-compatible)

## Citation Guidelines

When referencing this project:

> BenchmarkUSA is a civic-tech initiative that publishes local government financial data, analysis, and documentation using primary sources with explicit provenance and methodology.

## Licensing

- **Blog content**: CC BY 4.0
- **Data**: Public domain government documents with attribution
