# Contributing to dataciviclab

Questa guida vale per la repo `dataciviclab`.

Per le regole GitHub condivise dell'organizzazione, parti prima da
[`.github`](https://github.com/dataciviclab/.github).

## A cosa serve questa repo

`dataciviclab` è l'hub pubblico del Lab.

Qui stanno soprattutto:

- Discussions
- docs brevi di orientamento
- `preanalysis/` come layer pubblico leggero
- `projects/` come indice dei filoni già promossi
- task cross-repo e decisioni organizzative

Qui non stanno:

- il contratto tecnico minimo dei candidate
- `dataset.yml`, `sql/` e note tecniche come standard
- feature del `toolkit`
- intake tecnici di nuovi dataset

## Quando aprire issue qui

Apri una issue in `dataciviclab` se il lavoro riguarda:

- docs o orientamento del Lab
- task cross-repo
- decisioni organizzative
- output pubblici leggeri già abbastanza maturi

Non aprirla qui se il lavoro riguarda soprattutto:

- intake o candidate tecnici: usa `dataset-incubator`
- feature o bug del motore: usa `toolkit`
- policy GitHub comuni: usa `.github`

## Quando usare una Discussion

Usa una Discussion quando serve:

- chiarire una domanda civica
- raccogliere contesto pubblico
- capire se un filone merita una issue o una preanalysis

Nel Lab il flusso tipico resta:

`Discussion -> issue -> dataset-incubator -> preanalysis o repo dedicata`

## Contributi tipici in questa repo

- migliorare README e guide brevi
- chiarire il flusso tra repo
- aggiungere o sistemare una `preanalysis/`
- collegare meglio output, discussion e progetti

## Setup minimo

Per il setup locale minimo del Lab, vedi:

- [docs/local-setup.md](docs/local-setup.md)

Questa guida è separata dal ruolo di maintainer o core contributor.

## Prima di aprire una PR

- verifica se esiste già una issue o discussion collegata
- tieni il cambiamento piccolo e leggibile
- spiega il perché, non solo il cosa
- se tocchi il flusso tra repo, controlla anche [docs/dataset-project-flow.md](docs/dataset-project-flow.md)

## Se non sai da dove partire

- [docs/how-to-start.md](docs/how-to-start.md)
- [docs/repository-map.md](docs/repository-map.md)
- [docs/dataset-project-flow.md](docs/dataset-project-flow.md)
