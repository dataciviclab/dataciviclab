---
title: Setup locale
slug: local-setup
description: Guida tecnica per configurare l'ambiente di lavoro del Lab in un comando.
---
# Setup locale

Guida per **contributori esterni** che vogliono lavorare sui dataset del Lab.

Se fai parte del core team, la guida interna è in `lab-ops/operations/local-setup.md`
(repo privata).

## Requisiti

- **Git**
- **Python 3.12+**
- VS Code (opzionale, ma semplifica)

## Setup rapido (consigliato)

```bash
curl -fsSL https://raw.githubusercontent.com/dataciviclab/dataciviclab/main/scripts/setup.sh | bash
```

Lo script:

1. Crea `dataciviclab-workspace/` nella directory corrente
2. Clona tutti i repo del Lab (7 core + 7 opzionali)
3. Crea `.venv` e installa tutte le dipendenze Python
4. Copia `.env.example` in `.env`
5. Genera `.mcp.json` con i server MCP del Lab

Tempo stimato: 1-3 minuti (dipende dalla connessione).

### Per contributori (fork)

```bash
curl -fsSL https://raw.githubusercontent.com/dataciviclab/dataciviclab/main/scripts/setup.sh | bash -s -- --contributor
```

Alla fine stampa i comandi per convertire ogni clone in fork con upstream.

## Setup manuale

Se preferisci non usare lo script o vuoi più controllo:

### 1. Struttura workspace

Metti tutti i repo nella stessa cartella:

```
lavoro/
  dataciviclab/
  toolkit/
  dataset-incubator/
  lab-connectors/
  source-observatory/
  agent-context-builder/
  data-explorer/
```

### 2. Contributore esterno (fork)

1. **Forka** ogni repo che ti serve dalla pagina GitHub del Lab (tasto `Fork`)
2. **Clona il tuo fork**:
   ```bash
   git clone git@github.com:{TUO}/dataset-incubator.git
   ```
3. **Aggiungi l'upstream** per restare sincronizzato:
   ```bash
   git remote add upstream git@github.com:dataciviclab/dataset-incubator.git
   ```

### 3. Venv e dipendenze

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e lab-connectors
pip install -e "toolkit[parquet,dev]"
pip install --no-deps -e "dataset-incubator[dev]"
pip install --no-deps -e "source-observatory[dev]"
pip install -e agent-context-builder[mcp,dev]
pip install --no-deps -e lab-connectors
```

### 4. Variabili d'ambiente

```bash
cp dataciviclab/.env.example .env
# Compila almeno GITHUB_TOKEN
```

### 5. Verifica

```bash
toolkit --help
```

### 6. MCP (per AI agent)

```bash
cp dataciviclab/scripts/mcp-servers.json .mcp.json
# Sostituisci __WORKSPACE__ con il path assoluto del workspace
```

## VS Code (opzionale)

Dopo il setup rapido trovi `dataciviclab.code-workspace` alla root del workspace:

```bash
code dataciviclab.code-workspace
```

Include impostazioni consigliate, estensioni e path a tutti i repo del Lab.

## Primo run

```bash
toolkit run all --config dataset-incubator/candidates/irpef-comunale/dataset.yml
```

Se tutto è a posto vedrai l'output in `dataset-incubator/out/`.

## Prossimi passi

- [come-contribuire](/docs/come-contribuire/) — percorsi per partecipare
- Issue [`good first issue`](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22) — primo task
