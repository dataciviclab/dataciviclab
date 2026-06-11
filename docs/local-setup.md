---
title: Setup locale minimo
slug: local-setup
description: Guida tecnica per contributori che vogliono eseguire la pipeline in locale.
---
# Setup locale minimo

Guida per **contributori esterni** che vogliono lavorare sui dataset del Lab.

Se fai parte del core team, la guida interna è in `lab-ops/operations/local-setup.md`
(repo privata).

## Requisiti

- Git
- Python 3.12+
- VS Code (opzionale, ma semplifica)

## 1. Ottieni i repo

### Contributore esterno (vuoi aprire PR)

1. **Forka** ogni repo che ti serve dalla pagina GitHub del Lab.
   - Esempio: https://github.com/dataciviclab/dataset-incubator → tasto `Fork`
2. **Clona il tuo fork** (non l'originale):

   ```bash
   git clone git@github.com:{TUO_USERNAME}/dataset-incubator.git
   git clone git@github.com:{TUO_USERNAME}/toolkit.git
   ```

3. **Aggiungi l'originale come upstream** per restare sincronizzato:

   ```bash
   git remote add upstream git@github.com:dataciviclab/dataset-incubator.git
   ```

4. Lavora sempre su un **branch**, mai su `main`.

### Hai accesso in scrittura

Clona direttamente i repo dell'organizzazione:

```bash
git clone git@github.com:dataciviclab/toolkit.git
git clone git@github.com:dataciviclab/dataset-incubator.git
```

## 2. Struttura workspace

Metti tutti i repo nella stessa cartella. Esempio:

```
lavoro/
  dataciviclab/
  dataset-incubator/
  toolkit/
  lab-connectors/          # dipendenza condivisa (opzionale, vedi sotto)
  source-observatory/      # scouting fonti (opzionale)
  agent-context-builder/   # contesto agenti AI (opzionale)
  data-explorer/           # frontend catalogo — Node.js (opzionale)
```

Per partire bastano `dataciviclab`, `dataset-incubator` e `toolkit`.

## 3. Crea l'ambiente Python

Dalla root del workspace:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

**Windows (PowerShell):**

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
```

Verifica rapida:

```bash
python -c "import sys; print(sys.executable)"
```

Il path deve puntare alla `.venv` del workspace.

## 4. Installa i pacchetti

### Minimo indispensabile — toolkit (include lab-connectors)

```bash
pip install -e "toolkit[parquet,dev]"
```

`toolkit` installa automaticamente `lab-connectors` (versione pinnata via git).
Per un primo run questo basta.

Poi installa `dataset-incubator`:

```bash
pip install -e "dataset-incubator[dev]"
```

### Opzionale — editable locale per lab-connectors

Se devi modificare `lab-connectors`, installalo in editable dalla copia locale
(sovrascrive la versione pinnata installata da toolkit):

```bash
pip install -e lab-connectors
```

### Opzionale — altri repo

```bash
pip install -e "source-observatory[dev]"
pip install -e "agent-context-builder[dev]"
```

### Verifica minima

```bash
toolkit --help
```

Se non parte, la venv non è attiva o l'installazione non è completa.

## 5. VS Code (opzionale)

Il workspace file `dataciviclab.code-workspace` si trova nella repo `dataciviclab`.

Se hai clonato `dataciviclab`, aprilo con:

```bash
code dataciviclab/dataciviclab.code-workspace
```

Oppure da VS Code: `File → Apri workspace file`.

Include impostazioni consigliate, estensioni e exclude per cache/venv.

## 6. Variabili d'ambiente

Copia il file `.env.example` (nella repo `dataciviclab`) in `.env` nella root del workspace:

```bash
cp dataciviclab/.env.example .env
```

Compila almeno `GITHUB_TOKEN` (serve per automazioni e MCP).
Per eseguire un candidate in locale i token non servono.

## 7. Primo run

Una volta installato tutto, lancia un candidate per verificare che la pipeline funzioni:

```bash
toolkit run all --config dataset-incubator/candidates/irpef-comunale/dataset.yml
```

Se tutto è a posto vedrai l'output in `dataset-incubator/out/`.

Cosa verifica questo comando:
- che il toolkit parta e trovi le dipendenze
- che i path tra repo siano coerenti
- che la pipeline RAW → CLEAN → MART produca output reali

## 8. Prossimi passi

- Leggi [come-contribuire](/docs/come-contribuire/) per capire come partecipare
- Cerca issue `good first issue` per un primo task
- Quando sei pronto, apri una PR dal tuo fork
