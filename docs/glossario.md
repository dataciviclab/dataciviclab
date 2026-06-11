---
title: Glossario
slug: glossario
description: Termini e concetti chiave del DataCivicLab, dal funnel ai layer della pipeline.
---

# Glossario

Termini che compaiono nei documenti e nelle discussioni del Lab.

---

**Analisi**
: Prodotto pubblico finale del Lab. Ogni analisi vive in `dataciviclab/analisi/<slug>/` con
README, notebook e figure. Risponde a una domanda civica con dati verificabili.

**Candidate**
: Un dataset in fase di incubazione in `dataset-incubator`. Ha un `dataset.yml`, SQL di
pulizia e trasformazione, e produce output RAW → CLEAN → MART. Prima di essere pubblicato
supera una review.

**CLEAN**
: Secondo layer della pipeline. Dati normalizzati, con tipi consistenti, valori
standardizzati e null gestiti. Pronto per analisi cross-dataset.

**Dataset**
: Fonte dati pubblica incanalata nel Lab. Può essere un file CSV, un'API, un dataflow SDMX.
Ogni dataset ha un contratto (`dataset.yml`) che definisce fonte, periodicità e schema.

**Domanda civica**
: Punto di ingresso del funnel. Una domanda su un fenomeno pubblico
(es. "Perché in Sicilia i tempi della giustizia sono più lunghi?") che guida la ricerca
di dati e la successiva analisi. Chiunque può aprirne una.

**Funnel**
: Il percorso che va dalla domanda civica all'output pubblico:
`Domanda → Scouting → Incubazione → Analisi → Catalogo`. Non è rigido — non tutte le
domande arrivano in fondo.

**Finding**
: Un'affermazione verificabile supportata dai dati. Esempio: "Nel 2023 le rinnovabili
hanno coperto il 38% del fabbisogno elettrico italiano". I finding sono l'unità di output
del Lab.

**Incubazione**
: Fase in cui una fonte validata diventa un candidate tecnico. Include la scrittura del
contratto (`dataset.yml`), delle SQL di pulizia, e la prima esecuzione della pipeline.

**Intake**
: Il passaggio da fonte scoutata a candidate aperto. Si formalizza con una issue in
`dataset-incubator` con template intake.

**Layer**
: Ciascuno degli stadi della pipeline: RAW (dato originale), CLEAN (normalizzato),
MART (aggregato per analisi). Ogni layer è un parquet su GCS con schema documentato.

**MART**
: Terzo layer della pipeline. Dati aggregati e pronti per l'analisi diretta.
Ogni MART risponde a un uso specifico (es. serie storiche, ranking, distribuzioni).

**Pipeline**
: Il flusso automatizzato RAW → CLEAN → MART. Eseguito dal toolkit, configurato dal
`dataset.yml`. Riproducibile e versionato.

**RAW**
: Primo layer della pipeline. Copia fedele del file originale, con il minimo di
trasformazioni (encoding, delimiter). Non si modificano i valori.

**Scouting**
: Fase di verifica di una fonte pubblica. Si cerca, si scarica, si valuta se i dati sono
utilizzabili. Se sì, si apre un intake. Se no, si spiega perché.

**Source-check**
: Workflow del source-observatory per verificare se una fonte pubblica merita un intake.
Produce un esito: `go intake`, `watchlist` o `no-go`.

**Toolkit**
: Motore software che esegue la pipeline. Legge il `dataset.yml`, esegue gli step di
pulizia e trasformazione, e produce i parquet su GCS.
