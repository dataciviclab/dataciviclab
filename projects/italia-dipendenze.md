---
title: "italia-dipendenze — Da chi dipende l'Italia per le risorse che tiene in funzione"
description: "Gas, metalli critici, fertilizzanti: import, concentrazione della fornitura (HHI) e trend — Eurostat, UN Comtrade e FAO in un'unica mappa."
status: active
featured: false
topics: ["energia", "economia"]
dataset_slug:
repo: dataciviclab/italia-dipendenze
site: https://dcl-italia-dipendenze.streamlit.app/
stats:
  - value: "32"
    label: "risorse"
  - value: "2020–2024"
    label: "periodo"
  - value: ">95%"
    label: "import gas/petrolio/carbone"
  - value: "Eurostat · Comtrade · FAO"
    label: "fonti"
---

## In breve

L'Italia dipende per oltre il 95% dall'estero per gas, petrolio, carbone e metalli critici. italia-dipendenze misura quanto ne importiamo, da chi dipendiamo e quanto è concentrata la fornitura — la mappa aperta delle dipendenze materiali del sistema paese.

## Cosa abbiamo trovato

- **32 risorse** — 23 prodotti energetici (SIEC) + 9 risorse commerciali
- **Periodo**: 2020 — 2024, pipeline automatica
- **Metriche**: Gross Import Dependency, HHI, Top-1/3/5 share, trade balance, trend di concentrazione
- **Fonti**: Eurostat, UN Comtrade, FAO
- **Dashboard** su [dcl-italia-dipendenze.streamlit.app](https://dcl-italia-dipendenze.streamlit.app/)

### Esempi di dipendenza (2024)

| Risorsa | Import | HHI | Top fornitore |
|---|---:|---:|---|
| Gas naturale | $22,5B | 2.945 | Algeria (48%) |
| Rame | $1,3B | 3.292 | Perù (34%) |
| Ferro/acciaio | $868M | 3.998 | Russia (46%) |
| Litio | $1M | 9.320 | Germania (96%) |
| Terre rare | $2,4M | 3.651 | Cina (54%) |

### Cosa puoi scoprire

- Da quali paesi dipende l'Italia per il gas naturale
- Quali risorse hanno concentrazione alta (HHI > 2500)
- Come è cambiata la dipendenza dal gas dopo il 2022
- Se l'Italia è net exportatrice o importatrice di alluminio

## Perché importa

La resilienza del sistema paese si gioca sulle risorse che tengono in funzione energia, industria e agricoltura. Rendere visibili le catene di dipendenza — e la loro concentrazione — è il primo passo per discutere autonomia strategica con dati, non con slogan.

## Come partecipare

Discussioni e proposte nella [repo del progetto](https://github.com/dataciviclab/italia-dipendenze/issues).

## Stato e prossimi passi

Attivo. Pipeline basata su toolkit. Dashboard su Streamlit Community Cloud.
