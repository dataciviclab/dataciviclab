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

Nel body ogni seed dovrebbe rendere subito leggibili:

- `Anchor`: dove agganciarsi davvero nel Lab
- `Task minimo`: una cosa sola da fare
- `Done quando`: criterio di chiusura chiaro
- `Non in scope`: cosa non allargare

La cartella è divisa in:

- `good_first/`
- `core_team/`

## Uso manuale

Questi file possono essere usati in due modi:

- manualmente, come catalogo da copiare/incollare quando serve
- tramite la Action `seed-issues.yml`, che mantiene un piccolo buffer di issue aperte

La Action non crea issue illimitate.
Controlla quante seed issue aperte esistono già per ciascun bucket, contando solo le issue che hanno sia la label del bucket sia `seed-issue`, e apre solo gli slot mancanti fino al massimo dichiarato.

## Criterio operativo

Le seed migliori non sono quelle più generiche.
Sono quelle che:

- si agganciano a una repo, Discussion, notebook o area documentale già viva
- hanno uno scope chiudibile in poco tempo
- possono essere prese senza dover progettare il filone da zero

Se una seed richiede prima di decidere il target, il repo o il formato del lavoro, probabilmente è ancora troppo larga.

## Ritiro di una seed

Se una seed non deve più essere proposta automaticamente, non basta chiudere l'issue aperta.

Bisogna:

- rimuovere o rinominare il file seed nel catalogo
- oppure modificare il titolo seed, se la si vuole sostituire con una variante nuova
