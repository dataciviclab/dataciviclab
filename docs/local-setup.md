---
title: Setup locale
slug: local-setup
description: Setup per contributor — da un singolo repo dataset al workspace multi-repo del Lab.
---
# Setup locale

Guida per chi vuole lavorare sui dati o sul codice di DataCivicLab.

**Due percorsi, non uno solo:**

1. **Contributore su un progetto** — cloni *una* repo, ti basta quella (consigliato)
2. **Workspace multi-repo** — core team o lavoro cross-repo (toolkit, incubator, …)

Se fai parte del core team, la guida interna è in `lab-ops/operations/local-setup.md`
(repo privata).

## Requisiti

- **Git**
- **Python 3.12+**
- **Make** + bash (Linux, macOS, o Windows con [WSL](https://learn.microsoft.com/windows/wsl/))
- VS Code (opzionale)

---

## 1. Contributore su un singolo progetto (consigliato)

Non serve clonare tutto il Lab. Ogni repo dati è un’unità verticale con il suo
Makefile, pyproject e test.

```bash
git clone https://github.com/dataciviclab/open-siope.git
cd open-siope
# se il repo ha Makefile standard:
make setup && make check
# altrimenti:
python3 -m venv .venv && source .venv/bin/activate
pip install -e ".[dev]"
```

Sostituisci `open-siope` con il progetto che ti interessa. Esempi:

| Progetto | Repo |
|---|---|
| Spesa pubblica | `dataciviclab/open-siope` |
| Costituzione | `dataciviclab/costituzione-italiana` |
| Aiuti di Stato | `dataciviclab/rna-aiuti-stato` |
| Elenco completo | [dataciviclab org](https://github.com/orgs/dataciviclab/repositories) |

### Fork e PR

1. **Fork** sul repo che ti serve
2. **Clona il tuo fork**
3. **Upstream**: `git remote add upstream https://github.com/dataciviclab/<repo>.git`
4. **Branch** — mai lavorare su `main`
5. **PR** dal fork al repo originale

Trovi le issue aperte sul repo del progetto o sulle `good first issue` nell’hub.

---

## 2. Workspace multi-repo (core / cross-repo)

Il workspace è una cartella con **tanti clone** (toolkit, infra, progetti per dominio).
Non è un singolo git repo: il **contratto** path/ruoli vive nell’hub pubblico.

### Layout canonico

```text
dataciviclab-workspace/
  toolkit/                 # core
  lab-connectors/          # core
  infra/                   # hub, incubator, SO, explorer, …
  incubation/              # candidate
  diritto-legge/           # domini (raggruppamento umano)
  economia-finanza/
  investimenti-territorio/
  pubblica-amministrazione/
  workspace.toml           # contratto (copiato dall'hub)
  Makefile                 # interfaccia
  ws.py
  .venv/
  .env
```

I tool leggono `workspace.toml`: non hardcodano i nomi dei dominii.

### Setup

```bash
mkdir dataciviclab-workspace && cd dataciviclab-workspace

# 1. Hub (contiene contratto + docs)
git clone https://github.com/dataciviclab/dataciviclab.git infra/dataciviclab

# 2. Contratto + interfaccia alla root
cp infra/dataciviclab/workspace/{Makefile,workspace.toml,ws.py} .

# 3. Repo core + infra essenziali
make clone-core

# 4. Ambiente Python + install editable
make setup

# 5. Verifica
make check
make doctor
make status
```

Tempo stimato: pochi minuti a seconda della connessione.

### Comandi workspace

| Comando | Cosa fa |
|---|---|
| `make help` | Mappa comandi |
| `make setup` | `.venv` + install core/essential dal contratto |
| `make clone-core` | Clona core + infra essenziali |
| `make clone SLUG=open-siope` | Clona un repo dati dal contratto |
| `make status` | Cosa è clonato / cosa manca |
| `make doctor` | Valida layout vs `workspace.toml` |
| `make env` | `.env.example` → `.env` se manca |
| `make mcp` | Genera `.mcp.json` per agenti AI |
| `make contributor` | Istruzioni fork/upstream per i repo presenti |

### Ambiente e secret

```bash
make env
# compila almeno GITHUB_TOKEN in .env
```

`GITHUB_TOKEN` è l’unico obbligatorio per MCP e automazioni GitHub.

### MCP (agenti AI)

```bash
make mcp
```

Genera `.mcp.json` dalla root del workspace. Per OpenCode: copia il contenuto
in `opencode.json` → `mcp` (o usa `_local/mcp/run-with-env.sh` se presente).

### Un progetto dati in più

```bash
make clone SLUG=giustizia-amministrativa
# oppure: make clone SLUG=legal-graph  (se privato: clone manuale)
```

Il path effettivo è nel contratto (`workspace.toml`), es. `diritto-legge/giustizia-amministrativa`.

### VS Code

```bash
code dataciviclab.code-workspace   # se presente alla root
```

---

## Setup manuale (senza Makefile workspace)

Se preferisci non copiare il Makefile dell’hub:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e lab-connectors
pip install -e "toolkit[parquet,dev]"
pip install --no-deps -e "infra/dataset-incubator[dev]"
pip install --no-deps -e "infra/source-observatory[dev]"
pip install --no-deps -e "infra/agent-context-builder[mcp,dev]"
pip install --no-deps -e lab-connectors
cp infra/dataciviclab/.env.example .env
```

Poi clona a mano i repo che ti servono nelle path del contratto.

---

## Primo run (verifica pipeline)

Dopo `make setup` e il clone di un candidate:

```bash
toolkit --help
```

Oppure, da un repo dati:

```bash
cd economia-finanza/open-siope
make check
```

## Script legacy

`scripts/setup.sh` è **deprecato**: path storici (`analysis/`, `incubation/`) non
corrispondono più al layout. Usa `make setup` / `make clone-core` come sopra.

## Prossimi passi

- [come-contribuire](/docs/come-contribuire/) — percorsi per partecipare
- [workspace/README.md](../workspace/README.md) — dettaglio contratto workspace
- Issue [`good first issue`](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22) — primo task
