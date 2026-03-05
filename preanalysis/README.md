# Preanalysis

`preanalysis/` e lo spazio pubblico di validazione dei candidati progetto.

Non e una sandbox tecnica.
Non e una repo progetto gia matura.

Qui rendiamo visibile il processo minimo:

`dataset -> RAW/CLEAN -> prima analisi -> decisione`

## Scopo

Usare un perimetro piccolo e leggibile per decidere in tempi rapidi se un filone:

- va promosso a repo progetto dedicata
- va tenuto ancora in pre-analisi
- va archiviato

## Cosa entra

Un candidato entra in `preanalysis/` se ha:

1. una domanda civica formulata chiaramente
2. una sorgente dati reale e accessibile
3. una issue in `dataciviclab` collegata a una Discussion
4. un output minimo atteso in 1 settimana

## Cosa non entra

- test tecnici del toolkit
- esplorazioni vaghe senza domanda
- progetti gia maturi
- backlog indefinito

## Stati

- `intake`
- `active`
- `promising`
- `ready-to-promote`
- `archived`

## Limite WIP

Massimo 2-3 candidati attivi insieme.

## Criteri di uscita

### Promozione

- run stabile almeno su RAW/CLEAN
- output minimo condivisibile
- valore sufficiente per sviluppo continuo

### Archiviazione

- blocco dati non risolvibile
- domanda troppo vaga
- non prioritario dopo 4-6 settimane senza avanzamento

## Checkpoint

- review a 2 settimane
- review a 6 settimane

## Struttura

```text
preanalysis/
  README.md
  registry/
    active.md
    archived.md
  _template/
    README.md
    dataset.yml
    notes.md
    sql/
      clean.sql
      mart.sql
```
