---
title: senato-akn — Il lavoro del Senato in formato strutturato
description: La decretazione d'urgenza occupa un terzo del testo legislativo, pur essendo solo il 7% degli atti. Misuriamo il lavoro parlamentare per peso, non per numero.
status: active
featured: false
topics: ["trasparenza", "democrazia"]
dataset_slug:
repo: dataciviclab/senato-akn
site:
---

## In breve

Il lavoro legislativo del Senato della Repubblica è un corpus mastodontico — 68.114 file XML nella sola XIX legislatura, ~786 MB. Ma non tutti gli atti pesano lo stesso.

senato-akn estrae ed esplora il corpus in formato Akoma Ntoso (XML standard), misurando il lavoro legislativo per **peso documentale**, struttura e contenuto dei testi.

## Cosa abbiamo trovato

- **XIX legislatura** (2022–oggi): 68.114 file XML, ~786 MB
- **1.095 ddlpres** · **18.563 emendamenti** · **43.046 emendamenti commissione** · **990 resoconti aula**
- **7.348 sommari di commissione**

### Il finding chiave

| Famiglia | % atti | % testo | Rapporto |
|---|---|---|---|
| Decreto-like | 6,99% | 29,94% | 4,28× |
| Bilancio | 0,57% | 7,58% | **13,37×** |
| Delega | 6,33% | 8,96% | 1,42× |
| Istituzione | 14,08% | 7,55% | 0,54× |
| Ratifica | 5,01% | 1,09% | 0,22× |

**I bilanci, quasi invisibili nel conteggio (0,57%), pesano 13× più del loro numero.** In alcuni mesi, i decreti superano il 60% del testo totale pur essendo meno del 15% degli atti.

## Perché importa

Contare gli atti del Parlamento è come contare le pagine di un libro senza guardare il contenuto. La decretazione d'urgenza è un problema noto — ma misurarlo per *peso* invece che per numero dà un'immagine molto più precisa di come lavora davvero il Senato.

## Come partecipare

Le discussioni pubbliche vivono nella [repo del progetto](https://github.com/dataciviclab/senato-akn/issues).

## Stato e prossimi passi

Attivo. Dati disponibili come GitHub Artifact del workflow pipeline.
