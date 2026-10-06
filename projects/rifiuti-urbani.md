---
title: "rifiuti-urbani — Rifiuti urbani e speciali in Italia, aperti"
description: "Produzione, gestione, costi e flussi dei rifiuti urbani e speciali dal Catasto Nazionale ISPRA — comunale, regionale e nazionale, 2010–2024."
status: active
featured: false
topics: ["ambiente", "enti-locali"]
dataset_slug:
repo: dataciviclab/rifiuti-urbani
site: https://dcl-rifiuti.streamlit.app/
stats:
  - value: "12"
    label: "dataset"
  - value: "2010–2024"
    label: "periodo"
  - value: "comunale"
    label: "granularità RU"
  - value: "ISPRA"
    label: "fonte"
---

## In breve

Quanto costano i rifiuti nel tuo comune? Quanto si differenzia? Dove finiscono i rifiuti speciali? rifiuti-urbani raccoglie i dati del [Catasto Nazionale Rifiuti ISPRA](https://www.catasto-rifiuti.isprambiente.it/) e li normalizza in 12 dataset interrogabili: produzione, gestione, costi pro-capite, flussi import/export e impianti.

## Cosa abbiamo trovato

- **12 dataset** — RU comunale (base, costi, flussi), RS nazionale/regionali (produzione, gestione, impianti)
- **1 compose** — `rifiuti_urbani_unified` (base + costi)
- **Granularità**: comunale (RU), regionale (flussi), nazionale (RS)
- **Periodo**: 2010 — 2024 (a seconda del dataset)
- **Dashboard** su [dcl-rifiuti.streamlit.app](https://dcl-rifiuti.streamlit.app/)

### Cosa puoi scoprire

- Quanto costa il servizio rifiuti per abitante nel tuo comune
- Quanto si differenzia rispetto a comuni della stessa taglia
- Come si muovono i flussi di rifiuti speciali tra regioni
- Dove sono gli impianti di gestione e quanto producono

## Perché importa

I rifiuti sono un servizio pubblico quotidiano e una delle voci di spesa più visibili per i cittadini. Rendere il Catasto ISPRA interrogabile significa poter confrontare comuni e regioni — e capire cosa costa e cosa funziona.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/rifiuti-urbani/issues).

## Nota

Progetto successor nel tema dei rifiuti rispetto a `progetto-pilota` (reference, pipeline legacy).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
