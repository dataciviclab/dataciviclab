---
title: "open-ispra — L'ambiente italiano, aperto e interrogabile"
description: "Acque, suolo, mari, pesticidi e frane: i dati ISPRA normalizzati in un unico posto, pronti per SQL e analisi ambientale."
status: active
featured: false
topics: ["ambiente"]
dataset_slug:
repo: dataciviclab/open-ispra
site: https://dcl-ispra.streamlit.app/
stats:
  - value: "6"
    label: "dataset"
  - value: "29,2M"
    label: "righe livelli mare"
  - value: "1970–2024"
    label: "periodo"
  - value: "ISPRA"
    label: "fonte"
---

## In breve

ISPRA coordina il Sistema Nazionale di Protezione dell'Ambiente, ma i dati ambientali italiani sono distribuiti su piattaforme eterogenee: SPARQL, XLSX, CSV, REST API. open-ispra li raccoglie, li normalizza e li rende interrogabili in un unico posto.

## Cosa abbiamo trovato

- **6 dataset** — livelli del mare, pesticidi nelle acque, qualità urbana, balneazione, consumo suolo, frane
- **Esempi di scala**: 29,2M righe su livelli mare; 10,8M su pesticidi; 689K frane censite
- **Periodo**: 1970 — 2024 (a seconda del dataset)
- **Dashboard** su [dcl-ispra.streamlit.app](https://dcl-ispra.streamlit.app/)

### Cosa puoi scoprire

- Come cambiano i livelli del mare lungo le coste italiane
- Quante stazioni rilevano pesticidi nelle acque sotterranee
- Quali comuni hanno i tassi di consumo suolo più alti
- Com'è la qualità dell'acqua di balneazione nella tua zona
- Quante frane ci sono nella tua regione

## Perché importa

I dati ambientali esistono, ma restano frammentati tra portali e formati. Raccoglierli e normalizzarli significa poter rispondere a domande concrete — sulla costa, sul suolo, sulla qualità dell'aria e dell'acqua — senza saper programmare query SPARQL.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/open-ispra/issues) o nelle [Discussion del Lab](https://github.com/dataciviclab/dataciviclab/discussions).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
