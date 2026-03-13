# Seed Issues

Questa cartella contiene seed issue standardizzate da usare per:

- mantenere sempre un piccolo buffer di issue `good first issue`
- mantenere un piccolo buffer di issue `core-team`
- alimentare la GitHub Action che apre solo gli slot mancanti

Le seed issue non sostituiscono le issue reali di progetto.
Servono solo come ingressi standardizzati e task ricorrenti leggeri.

Il contesto operativo di queste seed segue il flusso canonico del Lab descritto in [docs/dataset-project-flow.md](../../docs/dataset-project-flow.md).

## Regole

- massimo `5` seed issue aperte con label `good first issue`
- massimo `5` seed issue aperte con label `core-team`
- le issue reali di progetto continuano a nascere da:
  - Discussion
  - preanalysis
  - output
  - lavoro tecnico concreto

## Struttura dei file

Ogni file contiene:

- `Title`
- `Labels`
- `Body`

La cartella e divisa in:

- `good_first/`
- `core_team/`

## Uso manuale

Questi file possono essere usati in due modi:

- manualmente, come catalogo da copiare/incollare quando serve
- tramite la Action `seed-issues.yml`, che mantiene un piccolo buffer di issue aperte

La Action non crea issue illimitate.
Controlla quante seed issue aperte esistono già per ciascun bucket, contando solo le issue che hanno sia la label del bucket sia `seed-issue`, e apre solo gli slot mancanti fino al massimo dichiarato.

## Ritiro di una seed

Se una seed non deve più essere proposta automaticamente, non basta chiudere l'issue aperta.

Bisogna:

- rimuovere o rinominare il file seed nel catalogo
- oppure modificare il titolo seed, se la si vuole sostituire con una variante nuova
