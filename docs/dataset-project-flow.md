---
title: Flusso dataset / progetto
slug: dataset-project-flow
description: Come il Lab trasforma una domanda civica in dati pubblici — dal scouting alla pubblicazione.
---

# Flusso dataset / progetto

Come il Lab trasforma una domanda civica in dati pubblici.

## Vista rapida

```text
DOMANDA → SCOUTING → INCUBAZIONE → ESPLORAZIONE
```

Non è una catena rigida: non tutte le domande arrivano all'esplorazione.

## Chi fa cosa

- **`dataciviclab`** — hub pubblico: Discussions, progetti, orientamento
- **`source-observatory`** — scouting e verifica delle fonti
- **`dataset-incubator`** — casa tecnica: contratto (`dataset.yml`, SQL),
  pipeline, catalogo (`registry.json`)
- **`toolkit`** — motore RAW → CLEAN → MART
- **`data-explorer`** — catalogo esplorabile dei dataset puliti

---

## Step 1: Domanda

L'ingresso nel funnel è una **domanda civica**, non un dataset.

Apri una **Discussion categoria `Domanda`** in `dataciviclab` con la tua
domanda su un fenomeno: "Perché in Sicilia i tempi della giustizia sono più
lunghi?", "Quanto costa la sanità alle famiglie?", "La capacità rinnovabile
italiana sta crescendo abbastanza?"

La Domanda è il punto di ingresso pubblico. Il team la prende in carico e
risponde con gli avanzamenti.

---

## Step 2: Scouting

Il team verifica se esistono dati che permettano di rispondere.

Repo: `source-observatory`
Workflow: `source-check`

Esiti possibili:
- **`go intake`** — fonte trovata, perimetro chiaro. Si apre una issue
  tecnica in `dataset-incubator` e lo scouting prosegue.
- **`watchlist`** — promettente ma non ancora accessibile.
- **`no-go`** — dati non trovati o non utilizzabili. Il team spiega perché
  nella Domanda.

---

## Step 3: Incubazione → Esplorazione

### Incubazione (dataset-incubator + toolkit)

La fonte diventa un candidate tecnico: `dataset.yml`, `sql/clean.sql`,
`sql/mart.sql`. Il toolkit esegue **RAW → CLEAN → MART** (tre layer) e
produce parquet validati.

Dopo la pubblicazione su GCS (`gs://dataciviclab-clean/{slug}/`), il dataset
è pronto per essere usato.

### Esplorazione (data-explorer)

Il dataset viene pubblicato nel catalogo esplorabile:
[data-explorer](https://dataciviclab.github.io/data-explorer/).

Lo stage `published` nel `registry.json` di `dataset-incubator` attiva
la pubblicazione su Explorer.

### Progetto dedicato (opzionale)

Per filoni complessi che crescono oltre il singolo dataset, si apre una
repo dedicata (es. `open-siope`, `eurostat`). Una scheda in
`dataciviclab/projects/` mantiene il collegamento con l'hub.

---

## Percorso tipico

```text
Domanda → Scouting → Incubazione → Esplorazione
```
