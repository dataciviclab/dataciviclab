---
title: "81% affidamento diretto — come spende la PA italiana"
description: "Analisi delle procedure di scelta del contraente negli appalti pubblici italiani: 3 anni di bandi ANAC (2023-2025), oltre 3,36 milioni di lotti, 1.733 miliardi di euro."
topics: appalti-pubblici, affidamento-diretto, trasparenza, spesa-pubblica
status: active
dataset_slug: anac_bandi_gara
---

# 81% affidamento diretto — come spende la PA italiana

**L'affidamento diretto è la procedura più usata dalla Pubblica Amministrazione: 8 lotti su 10 vengono assegnati senza gara. Ma in valore la situazione è più bilanciata: gli affidamenti diretti coprono circa la metà della spesa totale. Le grandi gare si fanno con procedure aperte, le piccole con affidamento diretto.**

> **3,36 milioni** di lotti analizzati (2023-2025), per un importo complessivo di **1.733 miliardi di euro**.

---

## 1. Il quadro generale

Nel triennio 2023-2025 la PA italiana ha pubblicato oltre **3,36 milioni di lotti di gara**, per un valore complessivo di **1.733 miliardi di euro**.

| Anno | Lotti | Importo totale (mld €) | Importo medio (€) |
|------|-------|----------------------|-------------------|
| 2023 | 655.125 | 404 | 616.878 |
| 2024 | 1.228.909 | 694 | 564.502 |
| 2025 | 1.475.581 | 635 | 430.166 |

---

## 2. Le procedure: l'affidamento diretto domina in quantità

La fotografia è netta: **l'affidamento diretto rappresenta oltre l'80% dei lotti** in tutti e tre gli anni. Ma il suo peso in valore è molto inferiore, perché le gare più importanti seguono procedure competitive.

![Evoluzione procedure](figures/appalti_evoluzione_procedure.png)

### Cosa significa

- **Affidamento diretto**: 81% dei lotti, circa il 47% del valore. Sono gare di piccolo importo (media €200.000), spesso sotto soglia. Nel 2023 erano il 69%, nel 2024-2025 si attestano all'84%.
- **Procedura aperta**: solo il 5% dei lotti, ma quasi il 30% del valore. Le gare europee e i grandi appalti.
- **Altre procedure**: negoziate, ristrette, in house — completano il quadro.

### Trend 2023-2025

La percentuale di affidamenti diretti è **cresciuta significativamente**: dal 69% del 2023 all'84% del 2025. Questo riflette la nuova soglia introdotta dal D.Lgs. 36/2023 (Codice Appalti) che ha alzato il limite per l'affidamento diretto, entrato pienamente a regime nel 2024.

---

## 3. Dove va la spesa

![Distribuzione territoriale](figures/appalti_distribuzione_territoriale.png)

La **Sezione Centrale ANAC (Consip e centrali di committenza)** gestisce il 30% della spesa totale — quasi 520 miliardi in 3 anni. Seguono Lombardia, Campania, Sicilia e Lazio.

Le regioni del Nord-Ovest (Lombardia, Piemonte, Liguria, Valle d'Aosta) totalizzano circa 110 miliardi, il Sud e le Isole (Campania, Sicilia, Puglia, Calabria, Sardegna, Basilicata, Molise) circa 120 miliardi.

### Categorie merceologiche

| Categoria | Lotti | Importo (mld €) | Medio (k€) |
|-----------|-------|-----------------|------------|
| FORNITURE | 1,9 M | 787 | 405 |
| SERVIZI | 1,9 M | 743 | 382 |
| LAVORI | 0,5 M | 199 | 408 |

Forniture e Servizi assorbono il 90% della spesa. I Lavori pubblici, pur con meno lotti, hanno importi medi più alti.

---

## 4. PNRR: 300.000 lotti per 155 miliardi

I bandi con flag PNRR rappresentano il **9% dei lotti** e il **9% del valore totale** nel triennio. La loro gestione è fortemente centralizzata: il 56% del valore PNRR passa dalla Sezione Centrale (Consip e centrali).

| Area | % PNRR |
|------|--------|
| Centrale (Consip) | 56,5% |
| Lombardia | 13,6% |
| Altre regioni | 29,9% |

---

## 5. Urgenza: un'etichetta quasi scontata

Il **55% dei lotti** ha il flag urgenza attivo, per un valore di **600 miliardi di euro**. Questo dato va letto con cautela: nella maggior parte dei casi la motivazione è "NON APPLICABILE", segnalando che il flag è spesso compilato come default amministrativo più che come indicatore di reale urgenza.

Ciononostante, gli appalti con urgenza dichiarata coprono una fetta significativa della spesa pubblica in appalti.

---

## Domanda civica

Perché 8 appalti su 10 vengono affidati direttamente, senza gara? La nuova soglia del Codice Appalti 2023 (D.Lgs. 36/2023) ha ampliato il perimetro dell'affidamento diretto: è una semplificazione efficace o una rinuncia alla concorrenza? I dati mostrano un balzo dal 69% all'84% in soli due anni.

---

## Dataset

Fonte: **ANAC — Autorità Nazionale Anticorruzione**
Dataset: [`anac_bandi_gara`](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/anac-bandi-gara) (2023-2025)
Licenza: CC-BY-SA 4.0

### Limiti

- I dati si riferiscono ai bandi pubblicati, non agli effettivi contratti stipulati
- Il flag urgenza è spesso compilato come "NON APPLICABILE", riducendone l'affidabilità
- Importi outlier (es. €17 mld per servizio idrico Puglia) sono reali ma vanno interpretati come contratti pluriennali
- La distribuzione per "sezione regionale" ANAC non corrisponde esattamente alla residenza della stazione appaltante

---

*Notebook tecnico: [`notebooks/appalti-procedure-spesa_v1.ipynb`](notebooks/appalti-procedure-spesa_v1.ipynb)*
