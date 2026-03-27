# OpenCivitas FSC 2025 (RSO)

## Domanda principale

I comuni con capacita fiscale piu bassa ricevono davvero piu risorse perequative in proporzione, oppure la dotazione finale FSC 2025 redistribuisce in modo meno intuitivo del previsto?

## Perche conta

- rende leggibile un meccanismo centrale della finanza comunale, non solo il suo peso nei bilanci
- aiuta a distinguere tra capacita fiscale, fondo perequativo e dotazione finale FSC
- porta nel layer pubblico del Lab un primo output prudente su un dataset tecnico ma civicamente forte

Discussion collegate:

- `dataciviclab` Discussion [#91](https://github.com/orgs/dataciviclab/discussions/91) - grandi comuni e composizione delle entrate
- `dataciviclab` Discussion [#114](https://github.com/orgs/dataciviclab/discussions/114) - dipendenza dai trasferimenti vs tributi propri
- `dataset-incubator` Discussion [#75](https://github.com/dataciviclab/dataset-incubator/discussions/75) - FSC 2025 / OpenCivitas

## Dataset

- fonte principale: [OpenCivitas / Sogei - FSC 2025 per i Comuni delle Regioni a Statuto Ordinario](https://www.opencivitas.it/it/dataset/2025-comuni-delle-regioni-statuto-ordinario-%E2%80%93-fondo-di-solidariet%C3%A0-comunale-2025)
- file dati: [2025_VAR_FSC_1_2025_csv.zip](https://docs.opencivitas.it/2025_VAR_FSC_1_2025_csv.zip)
- metadati enti: [Metadati Enti FSC 2025](https://docs.opencivitas.it/Metadati_Enti_FSC_2025_xlsx.zip)
- copertura temporale: `2025`
- copertura geografica: solo comuni delle Regioni a Statuto Ordinario

## Limiti principali

- perimetro solo RSO: non usare mai "tutti i comuni italiani"
- non e una serie storica: il v1 risponde su `2025`, non sui trend
- `fondo_perequativo` e `dotazione_finale_fsc` non sono la stessa cosa e non vanno letti come equivalenti
- questa e una lettura descrittiva, non una valutazione causale o normativa del riparto

## Output

- notebook pubblico: `notebooks/opencivitas_fsc_rso_v1.ipynb`
- mart tecnico letto da `dataset-incubator/out/data/mart/opencivitas_fsc_2025_rso/2025/mart_compose_comuni.parquet`

## Contratto tecnico

Il contratto tecnico del candidate vive in dataset-incubator:
[candidates/opencivitas-fsc-rso](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/opencivitas-fsc-rso)

## Stato

- `active` in `dataciviclab/analisi`
- candidate DI gia incubato e notebook v0 eseguito
- primo passaggio pubblico in analisi creato su base FSC 2025

## Decisione attesa al checkpoint

- verificare se il notebook v1 regge bene come primo output pubblico
- decidere se serve una discussion DCL dedicata al FSC oppure se il filone resta agganciato a `#91` e `#114`
