---
title: "giustizia-amministrativa — Il contenzioso della Giustizia Amministrativa, interrogabile"
description: "31 sedi, 2017–2026: ricorsi, sentenze, decreti e pareri della Giustizia Amministrativa italiana — dal portale OpenGA a mart analitici e dashboard."
status: active
featured: false
topics: ["giustizia", "trasparenza"]
dataset_slug:
repo: dataciviclab/giustizia-amministrativa
site: https://dcl-openga.streamlit.app/
stats:
  - value: "31"
    label: "sedi"
  - value: "2017–2026"
    label: "periodo"
  - value: "12"
    label: "dataset"
  - value: "3"
    label: "compose"
---

## In breve

La Giustizia Amministrativa giudica i ricorsi contro la Pubblica Amministrazione: TAR, Consiglio di Stato, CGA Sicilia. I dati ufficiali sono sul portale [OpenGA](https://openga.giustizia-amministrativa.it), ma restano difficili da interrogare insieme.

giustizia-amministrativa raccoglie sentenze, decreti, ordinanze, ricorsi e pareri, e li trasforma in mart analitici: flussi, esiti, mezzi di definizione, backlog e contenzioso sugli appalti.

## Cosa abbiamo trovato

- **31 sedi** — CdS, CGA Sicilia, 27 TAR, 2 TRGA
- **Periodo**: 2017 — 2026
- **12 dataset + 3 compose** — da `ga-sentenze` a `ga-ricorsi-appalto` (con CIG)
- **Dashboard** con panoramica, esiti, mezzi di definizione, appalti e scheda per sede
- **Join possibile** con ANAC sui ricorsi in materia d'appalto

### Cosa puoi scoprire

- Quanti ricorsi arrivano e come variano nel tempo, per sede e materia
- Come si chiudono (accoglimento, rigetto, decreto decisori)
- Qual è il backlog di ricorsi pendenti al CdS
- Quante sentenze brevi vs piene, per materia
- Quanto è produttiva ogni sede

## Perché importa

I dati della Giustizia Amministrativa sono pubblici, ma finora accessibili solo a chi sa navigare OpenGA. Renderli interrogabili significa poter misurare il contenzioso contro la PA — carichi, tempi, esiti — con evidenze e non impressioni.

## Come partecipare

Le discussioni pubbliche vivono nella [repo del progetto](https://github.com/dataciviclab/giustizia-amministrativa/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su [dcl-openga.streamlit.app](https://dcl-openga.streamlit.app/).
