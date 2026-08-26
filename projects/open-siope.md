---
title: open-siope — La spesa pubblica italiana, aperta e interrogabile
description: Ogni mese, ~18.000 enti pubblici italiani registrano entrate e uscite. open-siope li rende interrogabili da chiunque.
status: active
featured: true
topics: ["enti-locali", "finanza-pubblica", "trasparenza"]
dataset_slug:
repo: dataciviclab/open-siope
site:
---

## In breve

Ogni mese, circa **18.000 enti pubblici italiani** (comuni, ASL, università, regioni, province) registrano le loro entrate e uscite nel sistema SIOPE della Ragioneria Generale dello Stato. Questi dati esistono, ma sono pubblicati in formati che pochi sanno usare.

open-siope li prende, li pulisce, e li rende interrogabili da chiunque — via SQL, DuckDB, o direttamente dai parquet pubblici su Google Cloud Storage.

## Cosa abbiamo trovato

- **~18.000 enti coperti** — da piccoli comuni a grandi regioni
- **Periodo**: 2021 — 2026, mese per mese
- **~2.000 voci di entrata** (IMU, TARI, IRPEF, trasferimenti, fondi europei, ...)
- **~2.700 voci di uscita** (personale, beni, servizi, investimenti, interessi, ...)
- **4 comparti**: territorio (PRO), regioni (REG), sanità (SAN), università (UNI)

Non esiste un altro dataset pubblico con questa granularità sulla spesa locale italiana.

## Perché importa

Sapere quanto spende il proprio comune in personale o manutenzione strade, quanto incassa con IMU e TARI, o come cambia la spesa sanitaria di una ASL nel tempo — sono informazioni pubbliche, ma finora accessibili solo a chi sa navigare portali ministeriali e scaricare file CSV isolati.

open-siope le rende **interrogabili in tempo reale**, con SQL, zero barriere.

## Come partecipare

Le discussioni pubbliche sono organizzate per temi:

- [🏘️ Territorio](https://github.com/dataciviclab/open-siope/discussions/categories/territorio) — IMU, TARI, personale, manutenzione strade
- [🏥 Sanità](https://github.com/dataciviclab/open-siope/discussions/categories/sanit%C3%A0-san) — ASL, ospedali, spesa farmaceutica
- [🏛️ Regioni](https://github.com/dataciviclab/open-siope/discussions/categories/regioni-reg) — IRAP, trasporti, fondi europei
- [🎓 Università](https://github.com/dataciviclab/open-siope/discussions/categories/universit%C3%A0-uni) — tasse, FFO, ricerca, edilizia
- [🔗 Trasversale](https://github.com/dataciviclab/open-siope/discussions/categories/trasversale) — temi che tagliano tutti i comparti

Vedi un dato curioso? Apri una discussione. Hai un comune da analizzare? Chiedi nei commenti.

## Stato e prossimi passi

Attivo, in sviluppo continuo. I dati vengono aggiornati periodicamente. I bucket parquet su GCS sono pubblici.
