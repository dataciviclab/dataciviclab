---
title: eurostat — Dati regionali europei, aperti e interrogabili
description: PIL, popolazione, criminalità, salute, istruzione, clima — a livello NUTS2 (regionale) e NUTS3 (provinciale) per ogni paese UE.
status: active
featured: true
topics: ["economia", "territorio", "demografia"]
dataset_slug:
repo: dataciviclab/eurostat
site:
---

## In breve

Eurostat pubblica migliaia di dataset sulle regioni europee. Li trovi sul portale
EU, ma in formati SDMX che pochi sanno usare. eurostat li prende, li pulisce e li
rende interrogabili come parquet su Google Cloud Storage.

**30 dataset** che coprono economia, demografia, criminalità, salute, istruzione,
clima e trasporti — tutti a livello provinciale (NUTS3) o regionale (NUTS2).

## Cosa abbiamo trovato

- **30 dataset** pubblicati (21 NUTS3 + 9 NUTS2)
- **Periodo**: 1980 — 2025 (varia per dataset)
- **Copertura**: tutti i paesi UE + EFTA + candidati
- **Temi**: PIL, occupazione, mortalità, crimine, turismo, clima, povertà, disuguaglianza, istruzione, R&D

### Per tema

| Tema | Esempi |
|---|---|
| Economia | PIL, GVA, occupazione, produttività |
| Demografia | popolazione, decessi, nascite, invecchiamento |
| Criminalità | reati per ICCS |
| Salute | medici, letti ospedalieri |
| Istruzione | abbandono scolastico, laureati |
| Clima | gradi-giorno riscaldamento/raffrescamento |
| Ambiente | erosione suolo |
| Sociale | rischio povertà, disuguaglianza reddito |

## Perché importa

Le regioni europee non sono tutte uguali. Confrontare il PIL della Calabria
con quello della Baviera, o la mortalità della Sardegna con quella della
Catalogna, richiede dati confrontabili. eurostat li rende disponibili
senza barriere tecniche.

## Come partecipare

Le discussioni pubbliche vivono nella [repo del progetto](https://github.com/dataciviclab/eurostat/discussions).

## Stato e prossimi passi

Attivo. Pipeline basata su SDMX, aggiornamento automatico. Nuovi dataset
aggiunti su richiesta della community.
