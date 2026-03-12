# Malasanità 2022: mortalità evitabile e dotazione sanitaria regionale

## Domanda principale

Le regioni con meno personale sanitario hanno tassi di mortalità evitabile più alti?

## Perché conta

- rende leggibile la geografia del proxy di rischio evitabile a livello regionale nel 2022
- permette un primo confronto tra dotazione sanitaria territoriale e mortalità, senza inferenza causale
- è il caso-pilota del flusso `Discussion -> incubator -> preanalysis -> decisione` del lab

Discussion collegata: `dataciviclab` Discussion `#99` — Malasanità in Italia.

## Dataset

- fonti: Ministero della Salute (A: strutture ASL, C: strutture ricovero ASL) + ISTAT mortalità per causa (D)
- copertura temporale: 2022 (anno pivot unico di sovrapposizione completa tra le fonti)
- copertura territoriale: 21 regioni/PA
- limiti noti:
  - tre bande età disponibili in D (`30-69`, `70-84`, `85+`) — standardizzazione broad, non piena a 5 anni
  - anno singolo 2022 — nessuna analisi longitudinale possibile
  - Molise e Valle d'Aosta mostrano valori anomali su `personale_osp_per_100k` (fonte C) — interpretare con cautela
  - nessuna inferenza causale — il progetto descrive associazioni

## Metodo

La metrica principale è `tasso_std_broad_evitabile_100k_30plus` (`v3`):

- stesse 12 cause Euro-2013 della `v2` (mortalità amenable/preventable)
- broad age-standardization 30+ su tre bande disponibili in D, con pesi ESP2013 aggregati
- elimina il denominatore ibrido della `v2` e produce un tasso più difendibile per il confronto inter-regionale

La `v2` (`decessi_evitabili_30plus_per_100k_pop_totale`) è mantenuta come proxy grezzo di supporto.

## Perimetro (fuori scope)

- costo economico del contenzioso sanitario (AGENAS/Marsh) — follow-up separato
- dettaglio per disciplina/reparto dalla fonte B — fuori dal compose principale
- causalità

## Output

- `notebooks/malasanita_preanalysis_v3.ipynb` — notebook principale (v3 baseline raccomandata)
- artifact: `mart_compose_regioni_v3.parquet` — join 21/21, prodotto da incubator privato

## Esecuzione locale del notebook

Il notebook non ricostruisce i dati grezzi dentro questo repo. Richiede accesso ai parquet già prodotti in `dataset-incubator`.

Due modalità supportate:

1. checkout sibling di `dataset-incubator` con `out/data` già generato:
   - path atteso di default:
     - `../dataset-incubator/out/data/mart/malasanita_a_strutture_asl/2022/mart_compose_regioni_v3.parquet`
     - `../dataset-incubator/out/data/mart/malasanita_a_strutture_asl/2022/mart_compose_regioni_v2.parquet`

2. override via variabili ambiente:
   - `MALASANITA_V3_PARQUET`
   - `MALASANITA_V2_PARQUET`

Questa preanalysis è pubblica nel contenuto analitico, ma dipende da artifact generati a monte nell'incubator.

## Stato

- `active`
- artifact v3 validato (`dataciviclab/dataset-incubator`, issue #24)
- issue promozione: `dataciviclab/dataciviclab#117`

## Prossimo checkpoint

- valutare se promuovere a repo dedicata con dashboard/visualizzazioni
- decidere se estendere con dati AGENAS/contenzioso come secondo livello
