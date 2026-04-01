# Mappa Delle Repo

Non serve conoscere tutte le repo per orientarsi nel Lab.

Questa pagina serve solo a capire dove andare quando ti serve qualcosa.

## `dataciviclab`

È l'hub pubblico del Lab.

Qui stanno:
- la spiegazione del progetto
- la mappa dell'ecosistema
- i link ai progetti, alle board e ai risultati pubblici
- lo stato di `analisi/`
- le schede in `projects/` dei filoni già promossi
- la roadmap
- le guide brevi per orientarsi
- il `CONTRIBUTING.md` specifico della repo hub
- la guida breve di setup locale del Lab

Qui non stanno:
- policy GitHub condivise
- template issue o PR
- documentazione tecnica del toolkit
- struttura operativa dei repo dataset

Dentro `dataciviclab` ci sono due livelli utili:
- `analisi/` layer pubblico dei filoni attivi: README civico, notebook, Discussion collegata
- `projects/` schede leggere dei filoni promossi a repo dedicate

Per orientarti tra i workflow pubblici cross-repo del Lab:

- [workflows.md](workflows.md)

## `.github`

È la repo delle regole comuni su GitHub.

Qui stanno:
- `CONTRIBUTING`
- `CODE_OF_CONDUCT`
- template issue e PR
- linee guida comuni per Discussions
- altri file condivisi di community health

Qui non stanno:
- i progetti e i risultati pubblici del Lab
- la roadmap del Lab
- il metodo tecnico dei dati
- il bootstrap dei repo progetto

## `toolkit`

È il motore operativo del Lab.

Qui stanno:
- il codice del toolkit
- i comandi ufficiali
- i test
- la documentazione tecnica del motore

Qui non stanno:
- governance dell'organizzazione
- onboarding generale della community
- catalogo progetti

## `project-template`

È il modello standard dei repo dataset.

Qui stanno:
- la struttura base di un progetto
- i workflow minimi
- l'integrazione col toolkit
- i file da compilare in ogni repo dataset

Qui non stanno:
- le policy dell'intera organizzazione
- il racconto generale di DataCivicLab
- la documentazione tecnica del toolkit

## `dataset-incubator`

È il luogo di intake e incubazione tecnica dei candidati.

Qui stanno:
- i candidati con domanda civica e potenziale di promozione
- il contratto tecnico di ogni filone (`dataset.yml`, `sql/`, note)
- i support dataset riusabili per join o controlli
- la storia dei filoni usciti (`registry/archived.md`)

Qui non stanno:
- output pubblici o notebook definitivi come standard
- filoni già promossi a analisi o repo dedicata

Workflow pubblici principali:

- `intake-candidate`
- `run-candidate`

Vedi:

- `../../dataset-incubator/workflows/README.md`

## `source-observatory`

È il layer pubblico di scouting e osservazione delle fonti.

Qui stanno:
- workflow di scouting della fonte
- radar di salute di poche fonti strategiche
- segnali `catalog-watch`
- monitoraggio ristretto di poche resource Tier 1

Qui non stanno:
- intake tecnico dei candidate
- pipeline dataset
- governance del Lab

Workflow pubblico principale:

- `source-check`

Vedi:

- `../../source-observatory/workflows/README.md`

## Repo dataset

Sono i progetti concreti.

Qui stanno:
- la domanda civica del progetto
- i dati usati
- il metodo del progetto
- lo stato del lavoro
- gli output pubblici
- il link all'archivio pubblico

Qui non stanno:
- la governance generale dell'org
- le policy comuni duplicate
- spiegazioni globali del Lab

## In pratica

Se vuoi capire il Lab, parti da `dataciviclab`.

Se vuoi collaborare su GitHub, guarda `.github`.

Se vuoi capire come gira il motore, vai su `toolkit`.

Se vuoi aprire o leggere un progetto concreto, entra in un repo dataset.
