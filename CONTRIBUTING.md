# Contributing to dataciviclab

Questa guida vale per la repo `dataciviclab`.

Per la guida completa su come contribuire al Lab (percorsi, ruoli, flusso di lavoro),
vedi [docs/come-contribuire.md](docs/come-contribuire.md).

Per le regole GitHub condivise dell'organizzazione, vedi
[`.github`](https://github.com/dataciviclab/.github).

## A cosa serve questa repo

`dataciviclab` è l'hub pubblico del Lab. Qui stanno:

- **Sito** — [dataciviclab.org](https://dataciviclab.org) basato su **Astro** (`src/`, `public/`, `astro.config.mjs`)
- **Discussions** — domande, idee, confronto pubblico
- **`docs/`** — documenti di orientamento (dataset-project-flow, governance, come-contribuire, local-setup)
- **`analisi/`** — layer pubblico delle analisi in corso
- **`projects/`** — indice dei filoni promossi a repo dedicata
- **`skills/`** — guide operative per agenti e contributor
- Task cross-repo e decisioni organizzative

Qui non stanno:

- il contratto tecnico dei candidati (dataset.yml, sql, compose) — va in `dataset-incubator`
- feature o bug del toolkit — va in `toolkit`
- policy GitHub comuni — vanno in `.github`
- package condivisi di infrastruttura — vanno in `lab-connectors`

## Sito Astro (dataciviclab.org)

Il sito è costruito con [Astro](https://astro.build/) e pubblicato su GitHub Pages.

### Setup locale

```bash
npm install
npm run dev
```

Apri http://localhost:4321

### Build e preview

```bash
npm run build       # produce dist/
npm run preview     # serve la build localmente
```

### Struttura

```
src/
  components/   # componenti Astro riutilizzabili
  layouts/      # layout di pagina
  lib/          # utility e funzioni condivise
  pages/        # pagine del sito
    analisi/    # pagine delle analisi
    docs/       # pagine dei documenti
  styles/       # stili globali
public/         # asset statici
analisi/        # sorgente delle pagine analisi (notebook, README)
docs/           # sorgente dei documenti in markdown
```

### Aggiungere o modificare contenuti

- **Docs**: modifica i file `.md` in `docs/` — le pagine Astro in `src/pages/docs/` li inglobano
- **Analisi**: i contenuti vivono in `analisi/<slug>/`, le pagine in `src/pages/analisi/` li referenziano
- **Pagine nuove**: crea un file `.astro` in `src/pages/` seguendo la struttura esistente

## Quando aprire issue qui

Apri una issue in `dataciviclab` se il lavoro riguarda:

- docs o orientamento del Lab
- miglioramenti al sito Astro (contenuti, layout, performance)
- task cross-repo
- decisioni organizzative
- output pubblici già abbastanza maturi

## Prima di aprire una PR

- verifica se esiste già una issue o Discussion collegata
- tieni il cambiamento piccolo e leggibile
- spiega il perché, non solo il cosa
- se tocchi il sito, verifica con `npm run build` che non ci siano errori
- se tocchi il flusso tra repo, controlla [docs/dataset-project-flow.md](docs/dataset-project-flow.md)

## Riferimenti

- [README.md](README.md) — panoramica del Lab
- [docs/come-contribuire.md](docs/come-contribuire.md) — guida per nuovi contributor
- [docs/dataset-project-flow.md](docs/dataset-project-flow.md) — flusso dalla domanda all'analisi
- [docs/governance-model.md](docs/governance-model.md) — ruoli e decisioni
- [docs/local-setup.md](docs/local-setup.md) — setup tecnico locale
- [`.github`](https://github.com/dataciviclab/.github) — policy condivise
