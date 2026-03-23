# analisi/

`analisi/` e' la destinazione finale del layer pubblico dei filoni attivi del Lab.

Non e' una sandbox tecnica.
Non e' una tappa obbligata verso una repo dedicata.

Il contratto tecnico (dataset.yml, sql/, pipeline) vive in `dataset-incubator`.
Qui arriva solo il layer pubblico:

`dataset-incubator (contratto tecnico) -> analisi/ (README, notebook, Discussion)`

## Scopo

Rendere visibile il lavoro in corso con un perimetro leggibile, e decidere in tempi rapidi se un filone:

- continua in analisi/ (destinazione normale per la maggioranza dei filoni)
- va promosso a repo dedicata (solo se il filone lo giustifica)
- va archiviato

## Modello

Il contratto tecnico (dataset.yml, sql/, note interne) vive in `dataset-incubator` — anche dopo che il filone e' in analisi/.
Qui arriva solo il layer pubblico: README, notebook, eventuali asset leggeri.

I filoni entrati in analisi/ prima di questo modello possono contenere ancora file tecnici — sono storico.

## Cosa entra

Un candidato entra in `analisi/` se ha:

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

I filoni attivi sono in [registry/active.md](registry/active.md).
I filoni usciti (archiviati o promossi) sono in [registry/archived.md](registry/archived.md).

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
analisi/
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

La maggioranza dei filoni in `analisi/` non passa mai a repo dedicata — e va bene cosi.

Quando un filone esce da `analisi/` e passa a repo dedicata (eccezione):

- il lavoro tecnico esce da `dataciviclab`
- in `dataciviclab/projects/` resta una scheda leggera del progetto
- la Discussion pubblica continua a vivere nel repo `dataciviclab`
