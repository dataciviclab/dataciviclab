---
title: "inpa-reclutamento — I bandi della PA, aperti e interrogabili"
description: "Bandi, comunicazioni di procedura e tempi di assunzione di tutta la PA italiana dal portale inPA — dagli enti alle regioni, senza codice."
status: active
featured: false
topics: ["pubblica-amministrazione", "trasparenza"]
dataset_slug:
repo: dataciviclab/inpa-reclutamento
site: https://dcl-inpa.streamlit.app/
stats:
  - value: "4"
    label: "dataset"
  - value: "~76K"
    label: "bandi storici"
  - value: "2026→"
    label: "copertura"
  - value: "inPA"
    label: "fonte"
---

## In breve

[inPA](https://www.inpa.gov.it/) è il portale ufficiale del reclutamento della PA, obbligatorio per tutti gli enti dal 2023. Ma bandi, graduatorie ed esiti restano confinati nella piattaforma. inpa-reclutamento li harvesta dall'API pubblica e li rende interrogabili: chi assume, dove, con quali tempi.

## Cosa abbiamo trovato

- **4 dataset** — bandi aperti, bandi chiusi (archivio), comunicazioni di procedura, compose insight
- **~1,8k bandi attivi** + ~74k bandi storici
- **Tutti gli enti PA italiani**, dal 2026
- **Aggiornamento**: giornaliero (aperti) / mensile (chiusi)
- **Dashboard** su [dcl-inpa.streamlit.app](https://dcl-inpa.streamlit.app/)

### Cosa puoi scoprire

- Quali enti assumono di più e in quali aree
- Quali profili professionali la PA cerca di più
- Quanto tempo passa tra pubblicazione del bando ed esito
- Quali regioni hanno più bandi aperti
- Quali enti pubblicano gli esiti e quali no

## Perché importa

Il reclutamento pubblico è la porta d'accesso alla PA. Renderla interrogabile significa poter misurare trasparenza, tempi e distribuzione territoriale dei concorsi — dati che interessano chi cerca lavoro quanto chi monitora la PA.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/inpa-reclutamento/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
