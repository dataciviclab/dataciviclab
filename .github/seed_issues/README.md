# Seed Issues

Questa cartella contiene seed issue standardizzate da usare per:

- mantenere sempre un piccolo buffer di issue `good first issue`
- mantenere un piccolo buffer di issue `core-team`
- alimentare in futuro una GitHub Action che apra solo gli slot mancanti

Le seed issue non sostituiscono le issue reali di progetto.
Servono solo come ingressi standardizzati e task ricorrenti leggeri.

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

Per ora questi file servono come catalogo da copiare/incollare quando serve.
Se in futuro verrà introdotta una Action, questa cartella può diventare anche la base dati del runner.
