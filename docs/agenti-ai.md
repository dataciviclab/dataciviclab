---
title: Agenti AI nel Lab
slug: agenti-ai
description: Come gli agenti AI (Claude, OpenCode, …) partecipano a DataCivicLab tramite MCP — navigazione, dati pubblici, discussioni.
---
# Agenti AI nel Lab

DataCivicLab è progettato per essere interrogabile anche dagli agenti AI
(Claude, OpenCode, Cursor, …) tramite [MCP](https://modelcontextprotocol.io)
(Model Context Protocol). Questo vale per chi contribuisce e per chi legge:
la stessa infrastruttura che usiamo internamente è pubblica.

## Il server per partecipare: `dataciviclab`

Il server unico del Lab ([dcl-mcp](https://github.com/dataciviclab/dcl-mcp))
espone 15 tool in tre famiglie:

| Famiglia | Tool | Cosa permette |
|---|---|---|
| **Contesto** | `session_bootstrap`, `lab_map`, `find`, `explore`, `workspace_triage` | Orientamento, ricerca dataset/analisi, card con schema e path, stato del Lab |
| **Discussioni** | `github_list/get/search_discussions`, `github_create_discussion`, commenti, categorie | Leggere e partecipare alle Discussion su GitHub |
| **Dati pubblici** | `gcs_query(slug, sql, layer=)` | SELECT read-only (anche CTE) sui parquet clean/mart dei bucket pubblici |

Con questo solo server un agente può: trovare un dataset rilevante
(`find` → `explore`), verificarlo con una query SQL (`gcs_query`) e
aprire o rispondere a una discussione (`github_*`) — senza clonare nulla.

## Installazione

```bash
pip install "lab-connectors[mcp,duckdb] @ git+https://github.com/dataciviclab/lab-connectors.git"
pip install "dcl-mcp @ git+https://github.com/dataciviclab/dcl-mcp.git"
```

Configurazione (esempio generico MCP):

```json
{
  "mcpServers": {
    "dataciviclab": {
      "command": "dcl-mcp"
    }
  }
}
```

Per le discussions serve un `GITHUB_TOKEN` (GraphQL autenticato anche in
lettura). Il resto funziona senza token.

## Gli altri server del Lab

Per chi lavora sui repo (non solo in chat):

| Server | Repo | Ruolo |
|---|---|---|
| `toolkit` | [toolkit](https://github.com/dataciviclab/toolkit) | Pipeline locale: contratti, SQL su raw/clean/mart del workspace, run |
| `source-observatory` | [source-observatory](https://github.com/dataciviclab/source-observatory) | Scouting fonti, probe URL, inventory |
| `legal-graph` | [legal-graph](https://github.com/dataciviclab/legal-graph) | Grafo del diritto italiano interrogabile |

Routing: **pubblicato/org-wide/partecipazione → `dataciviclab`**;
**workspace locale/pipeline → `toolkit`**; **fonti → `source-observatory`**.

## Regole (valgono anche per gli agenti)

Gli agenti operano con le stesse regole delle persone:

- I numeri vanno **verificati con una query** prima di essere pubblicati —
  una card o una description non bastano.
- Le PR usano il template del repo; mai mergiare senza review umana.
- Le Discussion sono il luogo delle domande e delle proposte: leggi prima
  di scrivere, cerca se la domanda è già stata fatta.

Il workspace multi-repo e il setup completo sono in
[Setup locale](/docs/local-setup/). Per i dettagli tecnici del server:
[dcl-mcp](https://github.com/dataciviclab/dcl-mcp).
