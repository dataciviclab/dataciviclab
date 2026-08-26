---
title: RNA Aiuti di Stato — Ogni aiuto pubblico alle imprese italiane
description: Oltre 16 milioni di record che tracciano ogni aiuto di Stato concesso alle imprese italiane — da singoli contributi a regimi e misure.
status: active
featured: true
topics: ["economia", "finanza-pubblica", "trasparenza"]
dataset_slug: rna_aiuti_stato
repo: dataciviclab/rna-aiuti-stato
site:
---

## In breve

Ogni euro pubblico concesso a un'impresa italiana sotto forma di aiuto di Stato — contributi, garanzie, prestiti agevolati, esenzioni fiscali — è registrato nel **Registro Nazionale Aiuti** (RNA) del Ministero delle Imprese e del Made in Italy.

Questo progetto prende quei dati, li estrae dai formati XML originali, e li rende interrogabili.

## Cosa abbiamo trovato

- **~17 milioni di singoli aiuti** registrati — ogni erogazione a un'impresa
- **Periodo**: 2017 — 2026 (completo)
- **12.874 misure** (leggi, decreti, regimi che autorizzano gli aiuti)
- **40 GB di XML → 704 MB di parquet** (compressione 58:1)
- I dati includono: beneficiario (denominazione e codice fiscale), importo, concedente, regione, settore NACE, CUP

## Perché importa

Chi riceve soldi pubblici sotto forma di aiuti di Stato? Quali settori? Quali regioni? Con quali procedure (De Minimis, notifica, esenzione)? Fino a oggi, rispondere significava navigare XML mastodontici o portali settoriali. Ora si può fare con SQL.

## Come partecipare

Le discussioni pubbliche vivono nella [repo del progetto](https://github.com/dataciviclab/rna-aiuti-stato/issues). Puoi chiedere analisi su settori, regioni, singole imprese o confronti temporali.

## Stato e prossimi passi

Attivo. Pipeline CI settimanale su self-hosted runner. Aggiornamento continuo dei dati annuali.

## Dataset collegati

I dati puliti sono disponibili su DataCivicLab Explorer.
