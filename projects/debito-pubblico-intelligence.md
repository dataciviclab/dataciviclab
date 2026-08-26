---
title: debito-pubblico-intelligence — Quanto debito ha davvero lo Stato italiano?
description: "Sistema di intelligence sul debito pubblico: raccoglie fonti ufficiali, le riconcilia e rileva quando i numeri non tornano."
status: active
featured: true
topics: ["economia", "finanza-pubblica"]
dataset_slug:
repo: dataciviclab/debito-pubblico-intelligence
site:
---

## In breve

Il debito pubblico italiano è il terzo al mondo. Ma le fonti ufficiali — Banca d'Italia, Eurostat, MEF, OCPI — raccontano la stessa storia? E cosa ci dicono sulla sostenibilità?

debito-pubblico-intelligence raccoglie le fonti ufficiali, le riconcilia tra loro e trasforma i dati in segnali. Non è un aggregatore — è uno strumento che rileva quando i numeri "non tornano" e perché.

## Cosa abbiamo trovato

- **165 anni di serie storica** (dal 1861, Banca d'Italia)
- **5 segnali di sostenibilità**: debito/PIL, interesse-crescita (i−g), saldo primario, rollover 12 mesi, spread BTP-Bund
- **Fusion layer**: lo stesso numero letto da fonti indipendenti e confrontato
- **Scenari di sostenibilità**: proiezioni a 5 anni sotto ipotesi diverse

### Anomalie già rilevate

- **Anomalia 1995**: Eurostat diverge — spiegata come cambio di definizione (notifiche EDP), non errore
- **Doppio conteggio trovato e corretto**: il file scadenze del Tesoro elenca ogni titolo una volta per tranche; un parser ingenuo li somma due volte (~53 mld di differenza)
- **Costo del debito a bilancio**: gli oneri BDAP superano gli interessi OCPI di ~10-18 mld/anno — differenza tra costo "vero" e stima interessi

## Perché importa

Sapere quanto debito ha lo Stato è facile — basta un sito. Sapere se quel numero è *affidabile*, e cosa succederà se i tassi salgono o la crescita rallenta — quello richiede intelligence.

## Come partecipare

Le discussioni pubbliche vivono nella [repo del progetto](https://github.com/dataciviclab/debito-pubblico-intelligence/issues).

## Stato e prossimi passi

Attivo. Output pubblico: `data/reporting/panorama.md`, aggiornato a ogni run.
