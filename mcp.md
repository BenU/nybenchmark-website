---
layout: page
title: API / MCP Access
permalink: /mcp/
description: "Connect Claude Desktop to 10M+ municipal finance data points via MCP. Domain-aware caveats applied automatically."
---

BenchmarkUSA exposes its local government finance dataset through the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/), an open standard that lets AI tools query structured data directly. Financial data covers local governments in New York, California, Florida and North Carolina, from each state's official collector. Census population and demographics cover places in every state.

## Example questions

- "What is Syracuse's fund balance as a percentage of expenditures?"
- "Show me NYC's revenue sources over the last 10 years"
- "What are the 10 most populated towns in New York?"
- "Which New York villages spend the most on public safety?"
- "Which New York school districts spend the most per pupil?"
- "Which New York cities are late filing with the State Comptroller?"
- "Rank California cities by per-capita spending"
- "Which California and New York cities have the highest debt service burden?"
- "Which Florida cities are behind on their annual financial reports?"
- "Which North Carolina counties collect the most revenue per resident?"

## What you can query

Coverage as of November 2026:

| State | Local governments with financial data | Years |
|-------|----------------------------------------|-------|
| New York | 62 cities (including NYC), 57 counties, 933 towns, 561 villages, 689 school districts | 1995-2025 for cities; 1995-2024 for counties; 1997-2025 for towns and villages; 2015-2024 for school districts; NYC FY 2016-2025 |
| California | 482 cities, 57 counties | 2003-2024 |
| Florida | 267 cities, 123 towns, 20 villages, 66 counties | 2013-2025 for cities and towns; 2013-2024 for villages and counties |
| North Carolina | 77 cities, 453 towns, 20 villages, 100 counties | 2012-2025 |

- **Revenue, expenditures and balance sheets** in each state's own account categories
- **Census demographics** for places in every state (population, income, poverty, housing, education; 2010-2023)
- **Fiscal stress scores** for New York (OSC FSMS, 2012-2025)
- **Computed metrics** available without manual calculation: Per-Capita Spending and Per-Capita Revenue in all four states; Debt Service % and State Aid Dependency % in New York and California; Fund Balance % in New York
- **Rankings** — rank any entity type by any metric, within one state or across states, including cross-type rankings (e.g. all cities, towns, and villages together), top/bottom N

## What makes this different

Most government data APIs return raw numbers and leave interpretation to the user. Our MCP server includes **domain-aware caveats** that travel with the data:

- **Comparability notes** flag places with unusual reporting structures. NYC is a consolidated city-county-school district: its General Fund includes K-12 education (about $34B), courts, district attorneys and public welfare, functions handled by counties or school districts elsewhere. Plattsburgh operates a municipal electric utility, whose revenues and spending inflate its totals next to cities without one. Very small places (a Florida resort city with 19 residents, an Adirondack town with 54) get a warning that their per-capita figures are unreliable. The server attaches these automatically so the AI doesn't produce misleading comparisons.
- **Filing status** identifies governments that haven't filed recent reports with their state's collector, so the AI doesn't silently present stale data as current
- **Data quality rules** sum only the lines that add up to a total, and exclude New York's custodial pass-throughs (T-funds) and interfund transfers that inflate apparent spending
- **Citations** name the sources behind every answer from `get_data` and `rank_entities`
- **Anti-hallucination directives** prevent the AI from fabricating benchmark thresholds or interpolating missing data

This approach follows progressive disclosure: session-level instructions set the ground rules, and response-level notes provide entity-specific context on demand.

## Connect with Claude Desktop

**Tested and supported.** Add this to your Claude Desktop config file, then restart Claude Desktop:

- **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`

<div class="code-snippet-wrapper" markdown="0">
<button class="copy-btn" onclick="copySnippet(this)" title="Copy to clipboard">Copy</button>
<pre><code>{
  "mcpServers": {
    "nybenchmark": {
      "command": "npx",
      "args": ["mcp-remote", "https://mcp.benchmarkusa.org/mcp"]
    }
  }
}</code></pre>
</div>

**Requires:** [Node.js](https://nodejs.org/) (for npx). The `mcp-remote` package proxies the remote MCP endpoint to your local client. See [Anthropic's MCP setup guide](https://support.claude.com/en/articles/10949351-getting-started-with-local-mcp-servers-on-claude-desktop) for detailed instructions.

### Other MCP clients

MCP is an open standard and our endpoint (`https://mcp.benchmarkusa.org/mcp`) should work with any MCP-compatible client that supports remote servers. We haven't tested these, but they may work:

| Client | Notes |
|--------|-------|
| [Cursor](https://docs.cursor.com/context/model-context-protocol) | Add the same JSON snippet to `.cursor/mcp.json` |
| [Windsurf](https://docs.windsurf.com/windsurf/cascade/mcp) | Add via MCP Marketplace or `~/.codeium/windsurf/mcp_config.json` |
| [ChatGPT](https://help.openai.com/en/articles/12584461-developer-mode-and-mcp-apps-in-chatgpt-beta) | Requires Developer Mode (Pro, Team, Enterprise, or Edu — not available on Plus) |
| [Gemini CLI](https://geminicli.com/docs/tools/mcp-server/) | Command-line only, not the Gemini web app |

If you get it working with another client, [let us know](mailto:contact@benchmarkusa.org).

## How it works

The server provides five tools in a sequential workflow:

1. **discover_data** — overview of available data sources, entity types, and year ranges
2. **find_entities** — list cities, counties, school districts, towns, or villages by kind, state, or name, with each one's population and filing status
3. **find_metrics** — explore available metrics by source, account type (revenue, expenditure, balance sheet), category, or keyword
4. **get_data** — retrieve time-series data for specific entities and metrics
5. **rank_entities** — rank entities by any metric, within one state or across states (top/bottom N, cross-type rankings like all cities + towns + villages together)

Place names repeat across states (several states have an Albany), so `find_entities`, `get_data` and `rank_entities` take a two-letter `state` code, and every row names its state. When no year is given, rankings use the newest year with near-complete reporting for that kind of government in that state.

Domain rules are applied automatically. You don't need to know about T-fund exclusions, interfund transfer adjustments, or GASB 54 fund balance classifications — the server handles them and attaches explanatory notes to responses when relevant.

## Data sources

All data comes from official government sources:

| Source | Coverage | Link |
|--------|----------|------|
| NYS Office of the State Comptroller | New York cities except NYC, counties, towns, villages and school districts (1995-2025) | [osc.ny.gov](https://www.osc.ny.gov/local-government/data) |
| NYC Comptroller ACFR | NYC (FY 2016-2025) | [comptroller.nyc.gov](https://comptroller.nyc.gov/reports/annual-comprehensive-financial-reports/) |
| OSC Fiscal Stress Monitoring System | New York stress scores (2012-2025) | [osc.ny.gov](https://www.osc.ny.gov/local-government/fiscal-monitoring) |
| California State Controller's Office | California cities and counties (2003-2024) | [bythenumbers.sco.ca.gov](https://bythenumbers.sco.ca.gov/) |
| Florida Department of Financial Services (LOGERx) | Florida cities, towns, villages and counties (2013-2025) | [logerx.myfloridacfo.gov](https://logerx.myfloridacfo.gov/LogerX/PublicReportsMenu) |
| North Carolina Department of State Treasurer, Local Government Commission (Annual Financial Information Report) | North Carolina cities, towns, villages and counties (2012-2025) | [nctreasurer.gov](https://www.nctreasurer.gov/divisions/state-and-local-government-finance/lgc/data-and-reports) |
| U.S. Census Bureau ACS | Population and demographics for places in every state (2010-2023) | [census.gov](https://www.census.gov/programs-surveys/acs) |

For detailed methodology, see the [Methodology page](https://benchmarkusa.org/methodology) on the app.

{% include cta-banner.html %}
