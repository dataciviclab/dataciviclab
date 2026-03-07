# IRPEF comunale 2019-2023

## Domanda principale

Come varia la capacità fiscale tra comuni e regioni nel dataset IRPEF comunale?

## Perché conta

- rende leggibili differenze territoriali su contribuenti, base imponibile e imposta netta
- permette un primo confronto multi-anno tra regioni e comuni senza partire da indicatori troppo derivati
- è un buon candidato pubblico per il flusso `Discussion -> issue -> preanalysis -> decisione`

Discussion collegata:

- `dataciviclab` Discussion `#88` su IRPEF/capacita fiscale

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
- step `post-mart` multi-anno: pronto

## Esecuzione

Run annuale con `toolkit`:

```powershell
py -m toolkit.cli.app run all --config preanalysis/irpef-comunale-2019-2023/dataset.yml
```

Costruzione del mart multi-anno:

```powershell
py preanalysis/irpef-comunale-2019-2023/scripts/build_multi_year_mart.py
```

Output finale:

- `_out/data/mart/irpef_comunale_2019_2023/irpef_capacita_fiscale_multi_anno.parquet`

## Decisione attesa al checkpoint

- continuare come preanalysis fino al primo output Discussion
- poi decidere se promuovere a repo dedicata
