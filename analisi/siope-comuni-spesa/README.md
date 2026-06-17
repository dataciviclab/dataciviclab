---
title: "Dove vanno i soldi dei comuni italiani?"
description: "Analisi delle uscite dei comuni italiani dal 2021 al 2025, basata sui dati SIOPE (Ragioneria Generale dello Stato): trend, composizione per categoria e differenze territoriali."
topics: siope, finanza-pubblica, comuni, spesa-pubblica
status: active
dataset_slug: siope_uscite_comuni
---

# Dove vanno i soldi dei comuni italiani?

**Nel 2024 i comuni italiani hanno registrato circa 109,5 miliardi di euro in uscite SIOPE.** Al netto delle partite contabili (anticipazioni, split payment, incassi vincolati), le uscite correnti e in conto capitale ammontano a **90,5 miliardi**. La voce più pesante è l'acquisto di beni e servizi (36 miliardi, di cui quasi 9 solo per la raccolta rifiuti), seguita dai contributi agli investimenti (19 miliardi). Il personale pesa per 13,9 miliardi.

---

## 1. Trend nazionale 2021-2025

Le uscite totali dei comuni sono cresciute da 95,6 miliardi nel 2021 a 109,5 miliardi nel 2024 (+14,5% in tre anni). Al netto delle anticipazioni e partite di giro, il dato 2024 è 90,5 miliardi. Il 2025 mostra 114,2 miliardi lordi (dato parziale: il dataset include solo i mesi disponibili all'estrazione).

![Trend nazionale](figures/siope-comuni-spesa_trend_nazionale.png)

| Anno | Uscite totali (mld €) | Di cui netto partite contabili (mld €) |
|------|---------------------:|--------------------------------------:|
| 2021 | 95,6 | 76,8 |
| 2022 | 94,3 | 77,5 |
| 2023 | 99,2 | 81,9 |
| 2024 | 109,5 | 90,5 |
| 2025 | 114,2* | 96,2* |

*2025: dato provvisorio — i 12 mesi sono presenti ma soggetti a revisione (SIOPE aggiorna i dati mensili anche dopo la chiusura dell'anno).

## 2. Dove vanno i soldi?

La componente più grande è l'**acquisto di beni e servizi** (36,0 mld nel 2024, il 33% del totale), seguita dalle **anticipazioni e partite di giro** (19,0 mld — includono split payment IVA e incassi vincolati, non sono uscite reali) e dai **contributi agli investimenti** (19,1 mld). Il **personale** pesa per 13,9 miliardi (13%).

![Composizione per categoria](figures/siope-comuni-spesa_composizione_categorie.png)

Le voci più consistenti nel 2024:

| Voce | Categoria | Miliardi € |
|---|---|---|
| Contratti di servizio per la raccolta rifiuti | Acquisto beni e servizi | 8,8 |
| Stipendi personale a tempo indeterminato | Personale | 8,4 |
| Split payment IVA | Anticipazioni (contabile) | 4,7 |
| Infrastrutture stradali | Contributi investimenti | 4,2 |
| Utilizzo incassi vincolati (art. 195 TUEL) | Anticipazioni (contabile) | 4,1 |

![Top voci](figures/siope-comuni-spesa_top_voci.png)

## 3. Dove si spende di più?

La **Lombardia** guida la spesa comunale con 16,5 miliardi, seguita da Lazio (12,0), Sicilia (9,5), Campania (9,4), Emilia-Romagna (7,5) e Piemonte (7,1).

![Spesa per regione](figures/siope-comuni-spesa_spesa_regioni.png)

## 4. Il peso del personale

L'incidenza delle uscite per personale sul totale varia dal **14,6% in Trentino** all'**8,7% in Abruzzo**. Media nazionale: 12,0%.

![Incidenza personale](figures/siope-comuni-spesa_incidenza_personale.png)

---

## Cosa abbiamo imparato

### I fatti

1. **Le uscite dei comuni crescono** — da 95,6 a 109,5 miliardi in tre anni (+14,5% lordo, +17,8% netto partite contabili).
2. **Beni e servizi è la voce regina** — 36 miliardi, di cui 8,8 solo per la raccolta rifiuti.
3. **Il personale pesa il 12%** del totale, con differenze territoriali marcate (dal 9% in Abruzzo al 15% in Trentino).
4. **Gli investimenti crescono** — i contributi per investimenti passano da 11,2 a 19,1 miliardi (+71% tra 2021 e 2024).

### E allora?

La crescita è trainata dagli investimenti (+8 miliardi in tre anni, effetto PNRR?) più che dalla spesa corrente. Ma la fotografia arriva al 2024: con i dati 2025 completi si potrà capire se è un trend strutturale o congiunturale.

---

## Dataset

- **Fonte**: SIOPE — Sistema Informativo sulle Operazioni degli Enti Pubblici (Ragioneria Generale dello Stato). I dati SIOPE rilevano **incassi e pagamenti** effettivi delle pubbliche amministrazioni (fonte: [RGS](https://www.rgs.mef.gov.it/VERSIONE-I/e_government/amministrazioni_pubbliche/siope), [Banca d'Italia](https://www.bancaditalia.it/compiti/tesoreria/siope/index.html)).
- **Accesso**: `gs://dataciviclab-clean/siope/siope_uscite_comuni/{anno}/siope_uscite_comuni_{anno}_clean.parquet`
- **Copertura**: 7.910 comuni, 20 regioni, 5 anni (2021-2025)

### Limiti

- Il dato 2025 è provvisorio: i 12 mesi sono presenti ma soggetti a revisione (tipico delle rilevazioni SIOPE)
- Le "Anticipazioni" includono partite di giro contabili (split payment, incassi vincolati ex art. 195 TUEL) che non rappresentano uscite reali. Il totale netto (escluse Anticipazioni) è riportato nella tabella del §1

---

## Notebook

- `notebooks/siope-comuni-spesa_v1.ipynb` — validazione dati e generazione figure

## Contratto tecnico

I dati sono estratti dal progetto [open-siope](https://github.com/dataciviclab/open-siope), che pubblica i dati SIOPE puliti su GCS.
