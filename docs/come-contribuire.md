---
title: Come contribuire a DataCivicLab
slug: come-contribuire
description: Percorsi diversi per partecipare al Lab, anche senza saper programmare.
---
# Come contribuire a DataCivicLab

Non serve essere esperti per partecipare. Esistono percorsi diversi a seconda di cosa vuoi fare.

## Hai una domanda civica da esplorare

Il punto di ingresso naturale è una [Discussion](https://github.com/orgs/dataciviclab/discussions/new).

Apri una Discussion se vuoi:

- proporre una domanda su dati pubblici italiani
- capire se esiste già un filone su un tema che ti interessa
- contribuire a chiarire una domanda già aperta

Non serve saper programmare. Serve saper formulare bene la domanda e indicare,
se la conosci, la fonte pubblica di riferimento.

Quando una Discussion matura e diventa lavoro concreto, si apre una issue nella repo giusta.
Il flusso completo è in [dataset-project-flow](/docs/dataset-project-flow/).

## Vuoi contribuire a un lavoro in corso

Cerca tra le [issue aperte](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22) con label `good first issue`.

Le `good first issue` sono task leggeri:

- migliorare docs o guide
- verificare una fonte
- aggiungere una nota metodologica
- sintetizzare una Discussion

Se vuoi invece lavorare su qualcosa di più vicino al flusso tecnico del Lab,
guarda le issue con label [`core-team`](https://github.com/dataciviclab/dataciviclab/issues?q=is%3Aopen+is%3Aissue+label%3Acore-team):

- review di filone
- promozione di un candidato da analisi
- scelta del prossimo output

## Vuoi lavorare su un progetto dataset

I progetti attivi sono nella [Open Board](https://github.com/orgs/dataciviclab/projects/5).
Le analisi in corso sono in [analisi/](../analisi/).

Per contribuire a un progetto dataset:

1. leggi il README della repo progetto
2. guarda le issue aperte nella repo dedicata
3. se non c'è ancora una repo dedicata, parti dalla Discussion collegata

Per il setup tecnico locale: [local-setup](/docs/local-setup/).

## Vuoi contribuire con codice

Se sai già programmare e vuoi contribuire direttamente a un repo, hai due strade:

### Setup rapido (consigliato)

```bash
curl -fsSL https://raw.githubusercontent.com/dataciviclab/dataciviclab/main/scripts/setup.sh | bash -s -- --contributor
```

Crea `dataciviclab-workspace/`, clona tutti i repo, installa le dipendenze e stampa i comandi per convertire i clone in fork.

### Setup manuale

1. **Forka** il repo su GitHub (tasto `Fork` in alto a destra)
2. **Clona il tuo fork** in locale
3. **Aggiungi l'upstream**: `git remote add upstream git@github.com:dataciviclab/{repo}.git`
4. **Lavora su un branch** — mai direttamente su `main`
5. **Apri una PR** dal tuo fork al repo originale

Setup tecnico dettagliato: [local-setup](/docs/local-setup/).

## Come funzionano le decisioni

Il Lab è piccolo e le decisioni si prendono in modo trasparente su GitHub.

- le Discussion servono a formulare e chiarire la domanda
- le issue servono a trasformarla in lavoro operativo
- le PR sono il luogo di review prima di ogni merge

La conversazione può partire ovunque — Discord, LinkedIn, in privato.
La traccia utile deve restare su GitHub.

Per capire come funziona la governance del Lab: [governance-model](/docs/governance-model/).

Per template issue, PR e codice di condotta validi su tutte le repo: [`.github`](https://github.com/dataciviclab/.github).
