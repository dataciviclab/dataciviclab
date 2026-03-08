# Notes

## TODO iniziali

- [x] confermare domanda principale
- [x] verificare disponibilità dati reali
- [x] collegare la preanalysis alla Discussion IRPEF già aperta
- [x] eseguire RAW/CLEAN/MART annuale
- [x] definire un output minimo cross-year coerente con la Discussion
- [x] migrare il multi-anno al layer `cross_year` nativo del toolkit
- [x] aggiungere un notebook di lavoro per la Discussion

## Limiti e rischi

- il numero di comuni non è perfettamente stabile tra `2019` e `2023`
- senza popolazione, la lettura resta su capacità fiscale e contribuenti, non su valori pro capite
- il notebook D1 deve restare stretto: regioni, comuni selezionati, anomalie semplici, niente overclaim

## Stato corrente

- finestra `2019-2023` verificata
- schema `clean` coerente tra anni su 57 colonne
- `irpef_by_regione` e `irpef_by_comune` disponibili per ogni anno
- `irpef_capacita_fiscale_multi_anno` disponibile come output unico in `data/cross`
- notebook di lavoro pronto per la Discussion

## Insight chiave

- il totale del reddito imponibile aggregato scende nel `2020` e poi cresce fino al `2023`
- `Lombardia`, `Lazio` e `Veneto` restano stabilmente in alto sul reddito imponibile totale
- il taglio multi-anno permette di passare da una lettura puramente descrittiva a una lettura con quote e delta territoriali

## Decisioni aperte

- quando arricchire con popolazione per letture pro capite
- quanto spingere il confronto tra comuni nella prima risposta pubblica
- se tenere questo filone in preanalysis fino al primo commento Discussion oppure promuoverlo prima
