---
title: "sistema-bancario — I bilanci delle banche europee, interrogabili"
description: "Dati EBA, BCE e World Bank su solidità, credito, tassi e bilanci MFI — un'unica intelligence sul sistema bancario europeo."
status: active
featured: false
topics: ["economia", "finanza-pubblica"]
dataset_slug:
repo: dataciviclab/sistema-bancario
site: https://dcl-sistema-bancario.streamlit.app/
stats:
  - value: "6"
    label: "dataset"
  - value: "2007–2025"
    label: "periodo"
  - value: "EU/EEA"
    label: "copertura"
  - value: "EBA · BCE · WB"
    label: "fonti"
---

## In breve

I bilanci delle banche europee sono pubblici, ma dispersi tra esercizi EBA, SDMX della BCE e indicatori World Bank. sistema-bancario li raccoglie, li normalizza e li rende interrogabili: solidità, credito, tassi, bilanci MFI e confronti tra sistemi bancari nazionali.

## Cosa abbiamo trovato

- **6 dataset + 1 compose** (`banche_unified`)
- **EBA**: dati per singola banca — CET1, ROE, leverage ratio
- **BCE**: CBD2, BSI, MIR, Bank Lending Survey
- **World Bank**: NPL, credito/PIL, filiali, ATM
- **Copertura**: 2007 — 2025 (a seconda del dataset), Paesi EU/EEA
- **Dashboard** su [dcl-sistema-bancario.streamlit.app](https://dcl-sistema-bancario.streamlit.app/)

### Cosa puoi scoprire

- Come varia la solidità delle banche europee, per paese e per singola banca
- Come cresce il credito e quali standard si stanno allentando
- Come si confrontano i sistemi bancari su NPL, credito/PIL e densità di filiali
- Come si muovono i tassi attivi e passivi

## Perché importa

Il sistema bancario europeo è la spina dorsale del credito all'economia reale. Renderne interrogabili i bilanci regolatori significa poter osservare solidità e condizioni di credito senza restare confinati in report tecnici.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/sistema-bancario/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
