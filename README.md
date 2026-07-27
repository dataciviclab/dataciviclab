# DataCivicLab

Dati pubblici italiani, aperti e interrogabili. Per capire meglio il tuo
territorio senza perdersi nel rumore.

🌐 **[dataciviclab.org](https://dataciviclab.org)**

## Come funziona

Dalla domanda civica al dato pronto per l'analisi:

```
Domanda → Scouting → Incubazione → Analisi → Catalogo pubblico
```

Dettaglio: [docs/dataset-project-flow.md](docs/dataset-project-flow.md)

## Le repo del Lab

| Repo | Ruolo |
|---|---|
| [`dataciviclab`](.) | Hub pubblico: sito, analisi, documenti |
| [`source-observatory`](https://github.com/dataciviclab/source-observatory) | Scouting fonti pubbliche |
| [`dataset-incubator`](https://github.com/dataciviclab/dataset-incubator) | Intake e incubazione dataset |
| [`toolkit`](https://github.com/dataciviclab/toolkit) | Motore di pipeline dati |
| [`data-explorer`](https://github.com/dataciviclab/data-explorer) | Catalogo pubblico dei dataset |
| [`open-siope`](https://github.com/dataciviclab/open-siope) | Spesa pubblica italiana |
| [`eurostat`](https://github.com/dataciviclab/eurostat) | Dati europei NUTS2/NUTS3 |
| [`costituzione-italiana`](https://github.com/dataciviclab/costituzione-italiana) | Costituzione e giurisprudenza |
| [`rna-aiuti-stato`](https://github.com/dataciviclab/rna-aiuti-stato) | Aiuti di Stato alle imprese |
| [`open-conto-annuale`](https://github.com/dataciviclab/open-conto-annuale) | Personale PA italiana |
| [`partecipate-monitor`](https://github.com/dataciviclab/partecipate-monitor) | Partecipate pubbliche |
| · · · e altri repo di infrastruttura e progetto |

## Partecipa

- **Hai una domanda sui dati pubblici?** — apri una [Discussion](https://github.com/orgs/dataciviclab/discussions/new?category=Domanda), non serve saper programmare
- **Vuoi contribuire?** — cerca [good first issues](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22)
- **Seguici**: [Discord](https://discord.gg/rAHpuTrYK3) · [LinkedIn](https://www.linkedin.com/company/dataciviclab/)
- **Lavori in corso**: [Open Board](https://github.com/orgs/dataciviclab/projects/5)

## Setup locale (per sviluppatori)

```bash
curl -fsSL https://raw.githubusercontent.com/dataciviclab/dataciviclab/main/scripts/setup.sh | bash
```

Serve Git e Python 3.12+. Guida: [docs/local-setup.md](docs/local-setup.md).
