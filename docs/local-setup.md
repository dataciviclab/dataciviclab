---
title: Setup locale minimo
slug: local-setup
---
# Setup Locale Minimo

Questa guida serve a mettere in piedi un ambiente locale minimo per lavorare nel Lab.

Non copre tutto il ruolo di maintainer o core contributor.
Copre solo il setup necessario per arrivare a un primo workflow funzionante.

## Requisiti minimi

Serve avere:

- Git
- Python 3.12+
- VS Code consigliato, non obbligatorio

## Repo minime da avere

Per partire bastano:

- `dataciviclab`
- `dataset-incubator`
- `toolkit`

Se lavori nel workspace completo del Lab, tienile sotto una stessa cartella locale.

Esempio:

```text
dataciviclab-workspace/
  dataciviclab/
  dataset-incubator/
  toolkit/
  lab-connectors/      # dipendenza condivisa (opzionale, per sviluppo locale)
  source-observatory/  # scouting fonti (opzionale)
  agent-context-builder/ # contesto agenti AI (opzionale)
  data-explorer/       # frontend catalogo (Node.js, opzionale)
```

## Crea l'ambiente Python locale

Dalla root del workspace:

```powershell
python -m venv .venv
```

Su Windows puoi usare anche:

```powershell
py -m venv .venv
```

Poi attivalo.

Su PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

Controllo rapido:

```powershell
python -c "import sys; print(sys.executable)"
```

Il path deve puntare alla `.venv` del workspace.

## Installa i pacchetti Python

Vai nella repo `toolkit`:

```powershell
Set-Location toolkit
python -m pip install -e ".[parquet,dev]"
```

Poi installa gli altri pacchetti (opzionali, servono per candidate e scouting):

```powershell
Set-Location lab-connectors
python -m pip install -e .

Set-Location dataset-incubator
python -m pip install -e ".[dev]"

Set-Location source-observatory
python -m pip install -e ".[dev]"
```

Verifica minima:

```powershell
toolkit --help
```

Se questo comando non parte, fermati qui e sistema prima l'ambiente.

## Apri il workspace in VS Code

Se usi VS Code, apri:

`dataciviclab.code-workspace`

Ti aiuta a:

- vedere insieme le repo principali
- usare piu' facilmente il Python locale giusto
- navigare meglio tra repo diverse

## Variabili d'ambiente

Il Lab usa alcune variabili d'ambiente per token e configurazione.
Copia il file `.env.example` in `.env` nella root del workspace e compila i valori
che ti servono (almeno `GITHUB_TOKEN`).

```powershell
Copy-Item .env.example .env
```

I token servono soprattutto per MCP e automazioni; per eseguire un candidate
in locale non sono necessari.

## Primo comando reale

Lo standard del Lab e' usare il `dataset.yml` del candidate o del support dataset.

Esempio:

```powershell
Set-Location toolkit
toolkit run all --config ..\dataset-incubator\candidates\irpef-comunale\dataset.yml
```

Questo e' il primo test utile:

- verifica che il toolkit parta
- verifica che i path tra repo siano coerenti
- produce output reali

## Dove vanno gli output

Lo standard del Lab e':

- ogni repo viva ha il proprio `out/`
- gli output runtime non stanno nel root del workspace

Quindi:

- un candidate in `dataset-incubator` scrive in `dataset-incubator/out/`
- una repo progetto scrive nel proprio `out/`

## Ruoli minimi delle repo

### `dataset-incubator`

Qui vive il contratto tecnico minimo:

- `dataset.yml`
- `sql/`
- note tecniche
- notebook `v0`

### `dataciviclab`

Qui vive il layer pubblico leggero:

- README
- notebook `v1`
- docs, discussion e task cross-repo

### `toolkit`

Qui vive la CLI e il motore di pipeline.

## Checklist finale

Se tutto e' a posto, dovresti riuscire a:

1. vedere le repo principali nel workspace locale
2. usare una venv locale coerente
3. lanciare `toolkit --help`
4. eseguire almeno un `run all --config ...`
5. trovare gli output nella cartella `out/` della repo giusta
