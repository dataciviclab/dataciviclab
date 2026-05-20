# DataCivicLab

DataCivicLab è uno spazio civico dove proviamo a rendere i dati pubblici più leggibili, utili e condivisibili.

Nasce per chi vuole capire meglio il proprio territorio senza perdersi nel rumore, nei tecnicismi o nelle opinioni gridate. Qui costruiamo progetti pubblici con metodo, calma e collaborazione.

🌐 **[dataciviclab.org](https://dataciviclab.org)** — sito del Lab con analisi, documenti e stato in tempo reale.

## Come funziona

| Step | Cosa succede | Dove |
|---|---|---|
| 1. Domanda | Chiunque apre una discussione con una domanda civica | [GitHub Discussions](https://github.com/orgs/dataciviclab/discussions) |
| 2. Scouting | Verifichiamo se esistono fonti pubbliche per rispondere | [`source-observatory`](https://github.com/dataciviclab/source-observatory) |
| 3. Incubazione | Costruiamo pipeline riproducibili coi dati pubblici | [`dataset-incubator`](https://github.com/dataciviclab/dataset-incubator) + [`toolkit`](https://github.com/dataciviclab/toolkit) |
| 4. Analisi | Produciamo finding e notebook pubblici | [`analisi/`](analisi/) |
| 5. Catalogo | I dataset puliti finiscono nell'esploratore pubblico | [`data-explorer`](https://github.com/dataciviclab/data-explorer) |

Il percorso completo è in [docs/dataset-project-flow.md](docs/dataset-project-flow.md).

## Le repo del Lab

| Repo | Ruolo |
|---|---|
| [`dataciviclab`](https://github.com/dataciviclab/dataciviclab) | Hub pubblico: sito, analisi, documenti, discussioni |
| [`source-observatory`](https://github.com/dataciviclab/source-observatory) | Scouting e monitoraggio delle fonti pubbliche |
| [`dataset-incubator`](https://github.com/dataciviclab/dataset-incubator) | Intake tecnico: candidate, pipeline, contratto dati |
| [`toolkit`](https://github.com/dataciviclab/toolkit) | Motore RAW → CLEAN → MART |
| [`data-explorer`](https://github.com/dataciviclab/data-explorer) | Catalogo pubblico dei dataset puliti |
| [`lab-dashboard`](https://github.com/dataciviclab/lab-dashboard) | Dashboard operativa: metriche, fonti, pipeline |
| [`lab-connectors`](https://github.com/dataciviclab/lab-connectors) | Adapter per servizi esterni (Discord, GCS, GitHub) |
| [`agent-context-builder`](https://github.com/dataciviclab/agent-context-builder) | Contesto operativo per agenti AI del Lab |
| [`.github`](https://github.com/dataciviclab/.github) | Policy condivise, template, codice di condotta |

## Partecipa

**Hai una domanda sui dati pubblici italiani?**
Apri una [Discussion](https://github.com/orgs/dataciviclab/discussions/new?category=Domanda) — non serve saper programmare.

**Vuoi contribuire a un lavoro in corso?**
Cerca una [issue con label `good first issue`](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22).

**Vuoi scambiare idee o seguire gli aggiornamenti?**

- [Discord](https://discord.gg/rAHpuTrYK3) — chat della community, scambi veloci, aiuto tra pari
- [LinkedIn](https://www.linkedin.com/company/dataciviclab/) — aggiornamenti, nuovi output e segnali dal Lab
- [Open Board](https://github.com/orgs/dataciviclab/projects/5) — la lista pubblica di ciò su cui stiamo lavorando

## Per orientarti

- [docs/workflows.md](docs/workflows.md) — i workflow pubblici e in quale repo si lavora
- [docs/repository-map.md](docs/repository-map.md) — dove si trova ogni cosa nell'ecosistema
- [docs/governance-model.md](docs/governance-model.md) — ruoli e come si decide
- [docs/come-contribuire.md](docs/come-contribuire.md) — guida per nuovi contributor
