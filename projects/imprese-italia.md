---
title: "imprese-italia — La demografia d'impresa italiana, aperta"
description: "Stock, iscrizioni, cancellazioni e specializzazione settoriale: quante imprese nascono, crescono e muoiono in Italia — province e comuni delle Marche."
status: active
featured: false
topics: ["economia", "lavoro"]
dataset_slug:
repo: dataciviclab/imprese-italia
site: https://dcl-imprese.streamlit.app/
stats:
  - value: "8"
    label: "dataset"
  - value: "Italia + Marche"
    label: "copertura"
  - value: "2025–2026"
    label: "periodo"
  - value: "mensile"
    label: "cadenza"
---

## In breve

Quante imprese nascono, crescono e muoiono in Italia? Quali settori tirano l'economia reale? imprese-italia raccoglie i dati del Registro delle Imprese (Camera di Commercio delle Marche / InfoCamere) e li trasforma in indicatori su stock, flussi, variazioni e specializzazione territoriale.

Copertura: Italia nazionale a livello di provincia + 227 comuni delle Marche con granularità comunale.

## Cosa abbiamo trovato

- **8 dataset** — stock, iscrizioni, cancellazioni, variazione, ATECO 2 e 6 cifre, compose demografico
- **Italia**: province × settore, serie mensili
- **Marche**: comuni × ATECO 6 cifre — micro-territorio raro in fonti aperte
- **Periodo**: aprile 2025 — agosto 2026 (mensile)
- **Dashboard** su [dcl-imprese.streamlit.app](https://dcl-imprese.streamlit.app/)

### Cosa puoi scoprire

- Dove sta crescendo l'economia italiana, provincia per provincia
- Quali settori muoiono e quali tirano
- Come si compone il bilancio demografico d'impresa (stock + iscrizioni − cessazioni)
- Cosa fa un comune marchigiano rispetto a un altro della stessa taglia

## Perché importa

La demografia d'impresa racconta la vitalità di un territorio meglio di molti indicatori ufficiali. Rendere questi dati interrogabili significa poter leggere la crisi e la ripresa non solo a livello nazionale, ma comune per comune.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/imprese-italia/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard pubblica su Streamlit Community Cloud.
