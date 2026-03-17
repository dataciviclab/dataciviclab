# Preanalysis

`preanalysis/` è lo spazio pubblico di validazione dei candidati progetto.

Non è una sandbox tecnica.
Non è una repo progetto già matura.

Qui rendiamo visibile il processo minimo:

`dataset -> contratto tecnico verificato -> prima analisi pubblica -> decisione`

## Scopo

Usare un perimetro piccolo e leggibile per decidere in tempi rapidi se un filone:

- va promosso a repo progetto dedicata
- va tenuto ancora in preanalisi
- va archiviato

## Modello

Il contratto tecnico (dataset.yml, sql/, note interne) vive in `dataset-incubator`.
Qui arriva solo il layer pubblico: README, notebook, eventuali asset leggeri.

I filoni in `preanalysis/` promossi prima di questo modello possono contenere ancora file tecnici — sono storico del vecchio approccio.

## Cosa entra

Un candidato entra in `preanalysis/` se ha:

1. una domanda civica formulata chiaramente
2. una issue in `dataciviclab` collegata a una Discussion
3. un notebook leggibile con almeno una lettura v0 completata
4. contratto tecnico verificato in `dataset-incubator`

## Cosa non entra

- test tecnici del toolkit
- esplorazioni vaghe senza domanda
- progetti già maturi
- backlog indefinito

## Tracking

I filoni attivi sono tracciati via issue in `dataciviclab` con label `preanalysis`.
L'archivio dei filoni usciti sta in `registry/archived.md`.

## Limite WIP

Massimo 2-3 candidati attivi insieme.

## Criteri di uscita

### Promozione

- notebook con lettura leggibile e finding dichiarato
- contratto tecnico stabile in `dataset-incubator`
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
    archived.md
  _template/
    README.md
    notebooks/
  <slug>/
    README.md
    notebooks/
```

## Relazione con `projects/`

`preanalysis/` resta il luogo di lavoro per i candidati non ancora promossi.

Quando un filone esce da `preanalysis/` e passa a repo dedicata:

- il lavoro tecnico esce da `dataciviclab`
- in `dataciviclab/projects/` resta una scheda leggera del progetto
- la Discussion pubblica continua a vivere nel repo `dataciviclab`
