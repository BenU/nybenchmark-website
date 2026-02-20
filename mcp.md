---
layout: page
title: API / MCP Access
permalink: /mcp/
description: "Connect AI tools like Claude, ChatGPT, Gemini, or any MCP client to 2M+ municipal finance data points. Domain-aware caveats applied automatically."
---

NY Benchmark exposes its full dataset through the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) — an open standard that lets AI tools query structured data directly. Connect Claude Desktop, ChatGPT, Gemini, Cursor, Windsurf, or any MCP-compatible client and ask questions in natural language.

## What you can query

- **30 years of city financial data** (62 cities, 1995-present) — revenue, expenditures, fund balances, debt service
- **School district finances** (689 districts, 2012-present) — per-pupil spending, state aid, fund balances
- **County finances** (57 counties, 1995-present)
- **Census demographics** (population, income, poverty, housing, education)
- **Fiscal stress scores** (OSC FSMS, 2012-present) — fiscal and environmental indicators
- **Computed metrics** — Fund Balance %, Debt Service %, Per-Capita Spending, available without manual calculation

## Connect

Add this to your MCP client configuration:

```json
{
  "mcpServers": {
    "nybenchmark": {
      "command": "npx",
      "args": ["mcp-remote", "https://mcp.nybenchmark.org/mcp"]
    }
  }
}
```

**Requires:** [Node.js](https://nodejs.org/) (for npx). The `mcp-remote` package proxies the remote MCP endpoint to your local client.

Setup instructions vary by client:

| Client | Setup Guide |
|--------|------------|
| [Claude Desktop](https://support.claude.com/en/articles/10949351-getting-started-with-local-mcp-servers-on-claude-desktop) | Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) or `%APPDATA%\Claude\claude_desktop_config.json` (Windows), then restart |
| [ChatGPT](https://developers.openai.com/apps-sdk/deploy/connect-chatgpt/) | Enable Developer Mode in Settings, then add as a Connector. Requires ChatGPT Pro, Team, Enterprise, or Edu |
| [Gemini CLI](https://geminicli.com/docs/tools/mcp-server/) | Add to your `settings.json` mcpServers configuration |
| [Cursor](https://docs.cursor.com/context/model-context-protocol) | Add to `.cursor/mcp.json` in your project root or `~/.cursor/mcp.json` globally |
| [Windsurf](https://docs.windsurf.com/windsurf/cascade/mcp) | Add via MCP Marketplace or edit `~/.codeium/windsurf/mcp_config.json` directly |

## How it works

The server provides four tools in a sequential workflow:

1. **discover_data** — overview of available data sources, entity types, and year ranges
2. **find_entities** — search for cities, counties, or school districts by name, kind, or filing status
3. **find_metrics** — explore available metrics by category (revenue, expenditure, balance sheet) or search by keyword
4. **get_data** — retrieve time-series data for specific entities and metrics

Domain rules are applied automatically. You don't need to know about T-fund exclusions, interfund transfer adjustments, or GASB 54 fund balance classifications — the server handles them and attaches explanatory notes to responses when relevant.

## Example questions

Once connected, try asking your AI client:

- "What is Syracuse's fund balance as a percentage of expenditures?"
- "Compare police spending per capita across Buffalo, Rochester, and Yonkers"
- "Which cities have the highest debt service burden?"
- "Show me NYC's revenue sources over the last 10 years"
- "Which school districts spend the most per pupil?"
- "What cities are late filing with the State Comptroller?"

## What makes this different

Most government data APIs return raw numbers and leave interpretation to the user. Our MCP server includes **domain-aware caveats** that travel with the data:

- **Comparability notes** flag cities with unique reporting structures (NYC's consolidated budget, Plattsburgh's multi-fund debt service)
- **Filing status** identifies cities that haven't filed recent reports, so the AI doesn't silently present stale data as current
- **Data quality rules** exclude custodial pass-throughs and interfund transfers that inflate apparent spending
- **Anti-hallucination directives** prevent the AI from fabricating benchmark thresholds or interpolating missing data

This approach follows progressive disclosure: session-level instructions set the ground rules, and response-level notes provide entity-specific context on demand.

## Data sources

All data comes from official government sources:

| Source | Coverage | Link |
|--------|----------|------|
| NYS Office of the State Comptroller | 61 cities, 57 counties, 689 school districts (1995-present) | [osc.ny.gov](https://www.osc.ny.gov/local-government/data) |
| NYC Comptroller ACFR | NYC (FY 2016-2025) | [comptroller.nyc.gov](https://comptroller.nyc.gov/reports/annual-comprehensive-financial-reports/) |
| U.S. Census Bureau ACS | Demographics (2010-present) | [census.gov](https://www.census.gov/programs-surveys/acs) |
| OSC Fiscal Stress Monitoring System | Stress scores (2012-present) | [osc.ny.gov](https://www.osc.ny.gov/local-government/fiscal-monitoring) |

For detailed methodology, see the [Methodology page](https://app.nybenchmark.org/methodology) on the app.

{% include cta-banner.html %}
