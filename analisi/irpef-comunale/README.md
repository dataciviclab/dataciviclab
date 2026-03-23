# IRPEF comunale 2019-2023

## Domanda principale

Come varia la capacità fiscale tra comuni e regioni nel dataset IRPEF comunale?

## Perché conta

- rende leggibili differenze territoriali su contribuenti, base imponibile e imposta netta
- permette un primo confronto multi-anno tra regioni e comuni senza partire da indicatori troppo derivati
- è un buon candidato pubblico per il flusso `Discussion -> issue -> analisi -> decisione`

Discussion collegata:

- `dataciviclab` Discussion `#88` su IRPEF/capacità fiscale

## Dataset

- fonte: [ZIP annuali ufficiali MEF / Finanze](https://www1.finanze.gov.it/finanze/analisi_stat/public/index.php?search_class%5B0%5D=cCOMUNE&opendata=yes)
- copertura temporale in analisi: `2019-2023`
- copertura territoriale: comuni italiani + aggregazione regionale derivata
- limiti noti:
  - schema non perfettamente stabile tra annualità
  - lieve calo del numero di righe comunali tra `2019` e `2023`
  - niente arricchimento popolazione nel perimetro minimo

## Output minimo atteso

- `irpef_by_regione` annuale
- `irpef_by_comune` annuale
- `irpef_capacita_fiscale_multi_anno` come artefatto unico cross-year per leggere:
  - totali e medie per contribuente
  - quote dei comuni sulla propria regione
  - rank regionali e nazionali
  - delta vs anno precedente

## Stato

- `active`
- `raw`, `clean`, `mart` annuali: pronti
- `cross_year` nativo del toolkit: pronto
- notebook di lavoro: `notebooks/d1_capacita_fiscale_2019_2023.ipynb`

## Contratto tecnico

Il contratto tecnico (dataset.yml, SQL, pipeline) vive in dataset-incubator:
[candidates/irpef-comunale](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/irpef-comunale)

Nota: questo filone precede il modello DI. Il contratto e' stato migrato retroattivamente
da dataciviclab/analisi/ a dataset-incubator.

## Decisione attesa al checkpoint

- continuare come analisi fino al primo output Discussion
- poi decidere se promuovere a repo dedicata
