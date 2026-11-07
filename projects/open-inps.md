---
title: "open-inps — Lavoro, pensioni e welfare italiani, aperti e interrogabili"
description: "20 dataset INPS su mercato del lavoro, pensioni, welfare e bilancio — da assunzioni e cessazioni a NASpI, RdC/PdC, DIS-COLL e spesa per missioni COFOG — pronti per SQL e analisi civiche."
status: active
featured: false
topics: ["lavoro", "sociale"]
dataset_slug:
repo: dataciviclab/open-inps
site: https://dcl-inps.streamlit.app/
stats:
  - value: "20"
    label: "dataset"
  - value: "58"
    label: "mart"
  - value: "1997–2026"
    label: "periodo"
  - value: "INPS"
    label: "fonte"
---

## In breve

I cataloghi open data INPS sulle pensioni sono fermi al 2012–2014. Gli Osservatori Statistici contengono serie aggiornate al 2026. open-inps le raccoglie, le normalizza in parquet e le compone in metriche nazionali e territoriali su lavoro, pensioni, welfare e bilancio.

## Cosa abbiamo trovato

- **19 dataset toolkit + 1 compose** multi-dataset
- **58 mart analitici**
- **Periodo**: 1997 — 2026 (a seconda della serie)
- **Granularità**: nazionale, regionale, provinciale, settore NACE
- **Dashboard** su [dcl-inps.streamlit.app](https://dcl-inps.streamlit.app/)

### Temi coperti

- **Lavoro**: assunzioni vs cessazioni per provincia, sesso e settore
- **Pensioni**: stock recente e serie storica, flussi trimestrali di pensionamento
- **Disoccupazione**: NASpI, DIS-COLL
- **Welfare**: RdC/PdC, Assegno Unico, CIG
- **PA**: lavoratori pubblici per comparto, età e retribuzioni
- **Bilancio**: conto economico (generale/GIAS), missioni COFOG, rendiconto gestionale

### Cosa puoi scoprire

- Quante cessazioni ci sono per ogni assunzione, per regione e settore
- Come è cambiato lo stock di pensioni dal 1998
- Chi beneficia di DIS-COLL rispetto alla NASpI, e com'è il gap di genere
- Quanti sono i lavoratori pubblici e quanto pagano di retribuzione media

## Perché importa

Mercato del lavoro, pensioni e welfare sono dati che riguardano milioni di persone. Finora restavano chiusi in osservatori settoriali. Ora si possono interrogare con SQL — e confrontare territori e generazioni.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/open-inps/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
