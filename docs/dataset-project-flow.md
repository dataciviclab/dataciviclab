---
title: Flusso dataset / progetto
slug: dataset-project-flow
---

# Flusso dataset / progetto

Come il Lab trasforma una domanda civica in dati pubblici e analisi.

## Vista rapida

```text
DOMANDA → SCOUTING → INCUBAZIONE → ANALISI → [CATALOGO]
```

Non è una catena rigida: non tutte le domande arrivano all'analisi, non tutte
le analisi finiscono nel catalogo.

## Chi fa cosa

- **`dataciviclab`** — hub pubblico: Discussions, analisi, orientamento
- **`source-observatory`** — scouting e verifica delle fonti
- **`dataset-incubator`** — casa tecnica: contratto (`dataset.yml`, SQL),
  pipeline, catalogo (`clean_catalog.json`)
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

## Step 3: Incubazione → Analisi → Catalogo

### Incubazione (dataset-incubator + toolkit)

La fonte diventa un candidate tecnico: `dataset.yml`, `sql/clean.sql`,
`sql/mart.sql`. Il toolkit esegue **RAW → CLEAN → MART** (tre layer) e
produce parquet validati.

Dopo la pubblicazione su GCS (`gs://dataciviclab-clean/{slug}/`), il dataset
è pronto per essere usato.

### Analisi (dataciviclab/analisi/)

Se il dato è stabile e la domanda civica lo giustifica, il team pubblica
un'analisi in `analisi/<slug>/` con README pubblico, notebook tecnico e
figure (vedi [skills/new-analysis.md](../skills/new-analysis.md)).
È la destinazione finale per la maggior parte dei filoni.

### Catalogo (data-explorer — opzionale)

Per dataset periodici o con domanda civica larga, il dataset viene
pubblicato nel catalogo esplorabile:
[data-explorer](https://dataciviclab.github.io/data-explorer/).

---

## Due percorsi tipici

### Percorso standard
```text
Domanda → Scouting → Incubazione → Analisi
```

### Percorso con catalogo
```text
Domanda → Scouting → Incubazione → Analisi → Catalogo (data-explorer)
```
