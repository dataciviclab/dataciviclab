# Civile flussi 2014-2024

## Domanda principale

Il carico della giustizia civile sta migliorando o peggiorando nei territori?

## Perché conta

- rende leggibile l'equilibrio tra nuovi procedimenti, definiti e arretrato
- permette un confronto territoriale su una serie storica lunga (`2014-2024`)
- è un buon candidato pubblico per il flusso `Discussion -> analisi -> output -> decisione`

Discussion collegata:

- `dataciviclab` Discussion pubblicata su giustizia civile / flussi territoriali

## Dataset

- fonte principale: [CivileFlussi20142024.xlsx](https://datiestatistiche.giustizia.it/cmsresources/cms/documents/CivileFlussi20142024.xlsx)
- copertura temporale in analisi: `2014-2024`
- nota di struttura: il file è unico e contiene già tutta la serie storica; `years: [2024]` è usato come chiave di snapshot del run, non come filtro dei dati
- copertura territoriale: nazionale + distretti
- limiti noti:
  - dal `2021` la classificazione incorpora i flussi del tribunale delle imprese
  - dal `2022` compaiono nuove voci legate al Codice della Crisi d'Impresa e dell'Insolvenza (CCII)
  - i confronti per materia molto fini sulla serie vanno letti con prudenza

## Output minimo atteso

- `mart_summary` con trend nazionale e territoriale sintetico
- notebook di lavoro `notebooks/d1_trend_nazionale_distretti_2014_2024.ipynb`
- primo follow-up pubblico con:
  - trend nazionale `2014-2024`
  - rapporto `definiti / sopravvenuti`
  - primi distretti `2024` sopra e sotto `1`

## Stato

- `active`
- `raw`, `clean`, `mart`: pronti
- notebook D1: pronto
- commento follow-up Discussion: pronto da pubblicare

## Contratto tecnico

Il contratto tecnico (dataset.yml, SQL, pipeline) vive in dataset-incubator:
[candidates/civile-flussi](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/civile-flussi)

## Decisione attesa al checkpoint

- pubblicare il follow-up territoriale sulla Discussion
- verificare se il primo output pubblico regge bene anche fuori dal notebook
- poi decidere se tenere il filone in analisi oppure promuoverlo a repo dedicata
