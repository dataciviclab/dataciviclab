# Dipendenti pubblici 2021-2023

## Domanda principale

Il pubblico impiego sta tornando a crescere davvero, e in quali comparti si concentra la dinamica tra il 2021 e il 2023?

## Perche conta

- rende leggibile una dinamica spesso raccontata in modo troppo generico
- permette di distinguere tra crescita diffusa e crescita trainata da pochi comparti
- offre un primo confronto pubblico su stock, turnover e composizione dei comparti della PA

Issue collegata: [#131](https://github.com/dataciviclab/dataciviclab/issues/131)

## Dataset

- fonte principale: export CSV pubblico BDAP / RGS sui dipendenti pubblici per ente
- copertura temporale in analisi: `2021-2023`
- granularita di base: ente / comparto / categoria
- limiti noti:
  - il perimetro attuale e volutamente corto e non consente ancora una lettura storica piu lunga
  - il primo output esclude ranking ente per ente, per evitare una lettura troppo dispersiva
  - i CSV non sono UTF-8 puliti; il run usa `cp1252`

## Output minimo atteso

- `mart_comparti_anno` con:
  - dipendenti totali
  - assunti
  - cessati
  - saldo netto
  - tasso di assunzione e uscita
  - quota donne
- notebook pubblico `notebooks/dipendenti_pubblici_preanalysis_v1.ipynb`
- primo output pubblico centrato sui comparti che trainano la crescita del triennio

## Stato

- `active`
- `run all` verificato su `2021`, `2022`, `2023`
- mart minimo disponibile
- notebook `v1` pronto

## Esecuzione

Run annuale con `toolkit`:

```powershell
py -m toolkit.cli.app run all --config preanalysis/dipendenti-pubblici-2021-2023/dataset.yml
```

## Provenienza

Il filone e nato come candidato in `dataset-incubator` e viene promosso qui come preanalysis autosufficiente, portando in `dataciviclab` anche il contratto tecnico minimo (`dataset.yml`, `sql/`, notebook).

## Decisione attesa al checkpoint

- confermare che il primo output pubblico debba restare sul confronto tra comparti
- valutare se includere gia una lettura minima sulla composizione di genere
- decidere se il triennio `2021-2023` basta da solo o se serva uno storico piu ampio in un secondo momento
