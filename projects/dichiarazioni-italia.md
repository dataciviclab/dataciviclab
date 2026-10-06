---
title: "dichiarazioni-italia — Le dichiarazioni fiscali italiane, aperte"
description: "IRPEF, IVA, IRES e IRAP per comuni, regioni e settori — i dati MEF sulle dichiarazioni fiscali, puliti e interrogabili."
status: active
featured: false
topics: ["economia", "fisco"]
dataset_slug:
repo: dataciviclab/dichiarazioni-italia
site: https://dcl-dichiarazioni.streamlit.app/
stats:
  - value: "7"
    label: "dataset"
  - value: "~7.900"
    label: "comuni IRPEF"
  - value: "2014–2025"
    label: "periodo"
  - value: "MEF"
    label: "fonte"
---

## In breve

Le dichiarazioni fiscali sono lo specchio più fedele dell'economia reale: ogni impresa e ogni lavoratore dichiarano redditi, volumi d'affari e imposte. Il MEF le pubblica, ma in file sparsi e formati tecnici.

dichiarazioni-italia raccoglie i dataset del Dipartimento delle Finanze — IRPEF comunale, IVA regionale e per settore, IRES e IRAP — e li rende interrogabili da chiunque.

## Cosa abbiamo trovato

- **7 dataset** — IRPEF comunale, IVA regionale, IVA per ATECO, IRPEF regionale per classe, IRES, IRAP
- **Copertura**: ~7.900 comuni, 21 regioni, 22 settori ATECO
- **Periodo**: 2014 — 2025 (a seconda del dataset)
- **Dashboard** su [dcl-dichiarazioni.streamlit.app](https://dcl-dichiarazioni.streamlit.app/)
- **Fonte**: MEF — [analisi_stat](https://www1.finanze.gov.it/finanze/analisi_stat/public/index.php?opendata=yes)

### Cosa puoi scoprire

- Quali regioni producono più valore aggiunto IVA e come è cambiata la distribuzione
- Quanto reddito d'impresa dichiarano le società per regione
- Quali settori ATECO crescono nel volume d'affari
- Come si distribuisce la produzione IRAP tra regime ordinario, forfetario e agricolo

## Perché importa

Misurare la ricchezza territoriale e il carico fiscale non dovrebbe richiedere spreadsheet ministeriali. Con questi dati si può confrontare regioni e settori, e seguire l'evoluzione del tessuto economico italiano anno dopo anno.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/dichiarazioni-italia/discussions).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Aggiornamento periodico dai dati MEF.
