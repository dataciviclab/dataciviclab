# Dipendenti pubblici 2021-2023

## Domanda principale

Come sta cambiando il pubblico impiego tra il 2021 e il 2023, e in quali comparti si concentra la dinamica?

## Perché conta

- rende leggibile una dinamica spesso raccontata in modo troppo generico
- permette di distinguere tra crescita diffusa e crescita trainata da pochi comparti
- offre un primo confronto pubblico su stock, turnover e composizione dei comparti della PA

Issue collegata: [#131](https://github.com/dataciviclab/dataciviclab/issues/131)

## Dataset

- fonte principale: export CSV pubblico BDAP / RGS sui dipendenti pubblici per ente
- copertura temporale in analisi: `2021-2023`
- granularità di base: ente / comparto / categoria
- limiti noti:
  - il perimetro attuale è volutamente corto e non consente ancora una lettura storica più lunga
  - il primo output esclude ranking ente per ente, per evitare una lettura troppo dispersiva
  - i CSV non sono UTF-8 puliti; il run usa `cp1252`

## Output minimo atteso

- `mart_comparti_anno` con:
  - dipendenti totali
  - assunti
  - cessati
  - saldo netto
  - tasso di assunzione e uscita
  - tasso di turnover lordo
  - quota donne
- notebook pubblico `notebooks/dipendenti_pubblici_preanalysis_v1.ipynb`
- primo output pubblico centrato sui comparti in cui si concentra la dinamica del triennio

## Stato

- `active`
- `run all` verificato su `2021`, `2022`, `2023`
- mart minimo disponibile
- notebook `v1` pronto

## Provenienza

Il filone è nato come candidato in `dataset-incubator` ed è stato promosso qui come analisi nel vecchio modello autosufficiente. Oggi il riferimento tecnico resta in `dataset-incubator`, mentre `dataciviclab` tiene il layer pubblico di lettura e notebook.

## Contratto tecnico

Il contratto tecnico (dataset.yml, SQL, pipeline) vive in dataset-incubator:
[candidates/dipendenti-pubblici-2021-2023](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/dipendenti-pubblici-2021-2023)

## Decisione attesa al checkpoint

- confermare che il primo output pubblico debba restare sul confronto tra comparti
- valutare se includere già una lettura minima sulla composizione di genere
- decidere se il triennio `2021-2023` basta da solo o se serva uno storico più ampio in un secondo momento
