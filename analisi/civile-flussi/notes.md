# Notes

## TODO iniziali

- [x] confermare la domanda principale
- [x] verificare disponibilità dati reali
- [x] eseguire `raw` / `clean` / `mart`
- [x] preparare notebook D1 con trend nazionale e primi distretti
- [x] allineare il filone alla Discussion già pubblicata
- [ ] aprire issue `dataciviclab` collegata alla Discussion
- [ ] pubblicare il follow-up pubblico con dati territoriali

## Limiti e rischi

- il file contiene la serie intera, ma il run resta agganciato a una chiave di snapshot `2024`
- dal `2021` cambiano alcune classificazioni per effetto del tribunale delle imprese
- dal `2022` entrano nuove voci CCII
- il notebook D1 deve restare stretto: trend nazionale + distretti selezionati, niente overclaim

## Stato corrente

- workbook reale con foglio descrittivo `Read me` e foglio dati `data`
- `clean.read.sheet_name` su `.xlsx` verificato
- `mart_summary` disponibile
- notebook `d1_trend_nazionale_distretti_2014_2024.ipynb` pronto
- primo follow-up Discussion pronto in `_local/exports`

## Insight chiave

- il backlog nazionale cala in modo continuo fino al `2023`
- il `2024` è il primo anno con rapporto nazionale `D/S < 1`
- la lettura distrettuale mostra segnali non uniformi, con alcuni distretti strutturalmente sopra `1` e altri sotto pressione

## Decisioni aperte

- quando aprire issue `dataciviclab` collegata formalmente alla Discussion
- se il prossimo output deve restare su distretti o allargarsi a macroaree / uffici
- se promuovere il filone dopo il primo follow-up pubblico oppure tenerlo ancora in analisi
