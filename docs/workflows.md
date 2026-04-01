# Workflow pubblici del Lab

Questa pagina fa da hub dei workflow pubblici cross-repo di DataCivicLab.

Non spiega tutta la logica interna del core team. Serve soprattutto a chiarire:

- da dove si entra
- qual e' il passo successivo
- in quale repo si lavora davvero

## Mappa rapida

### 1. Fonte -> Discussion

Se parti da una fonte o da un dataset da verificare, il workflow pubblico di riferimento e':

- [`source-observatory/workflows/source-check.md`](https://github.com/dataciviclab/source-observatory/blob/main/workflows/source-check.md)

Questo e' il passaggio giusto quando devi capire se una fonte regge davvero
come pista del Lab.

Output tipici:

- `go Discussion`
- `watchlist`
- `support dataset`
- `aggiorna artefatto esistente`
- `no-go`

### 2. Discussion -> Candidate

Quando una discussion o una fonte sono abbastanza mature per entrare in
incubazione tecnica, il workflow pubblico di riferimento e':

- [`dataset-incubator/workflows/intake-candidate.md`](https://github.com/dataciviclab/dataset-incubator/blob/main/workflows/intake-candidate.md)

Questo e' il passaggio giusto quando vuoi trasformare un caso promettente in un
candidate tecnico credibile.

### 3. Candidate -> Run

Quando un candidate esiste gia' e vuoi farlo girare davvero per vedere i dati,
il workflow pubblico di riferimento e':

- [`dataset-incubator/workflows/run-candidate.md`](https://github.com/dataciviclab/dataset-incubator/blob/main/workflows/run-candidate.md)

Questo e' il passaggio giusto quando vuoi eseguire il candidate end-to-end,
leggere gli output e distinguere tra run riuscito e blocco tecnico reale.

## Ruolo delle repo

- `dataciviclab`
  - hub pubblico del funnel, Discussions, analisi, orientamento
- `source-observatory`
  - workflow di scouting e osservazione delle fonti
- `dataset-incubator`
  - intake tecnico, candidate, run e contratto tecnico permanente
- `toolkit`
  - motore tecnico e guide di uso del runtime, non funnel del Lab

## Regola pratica

- workflow ricorrente di scouting -> `source-observatory`
- workflow ricorrente di intake e run -> `dataset-incubator`
- `dataciviclab` racconta il funnel e rimanda alla repo giusta

Se vuoi il quadro generale del funnel:

- [dataset-project-flow.md](dataset-project-flow.md)
