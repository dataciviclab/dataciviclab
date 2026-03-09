# 🌍 DataCivicLab

DataCivicLab è uno spazio civico dove proviamo a rendere i dati pubblici più leggibili, utili e condivisibili.

Nasce per chi vuole capire meglio il proprio territorio senza perdersi nel rumore, nei tecnicismi o nelle opinioni gridate.

Qui costruiamo progetti pubblici con metodo, calma e collaborazione.

Questa repo è l'hub dell'organizzazione: spiega come è fatto il Lab e indirizza verso le repo, le board e i canali giusti.

## 👋 Se stai arrivando adesso

Non serve conoscere tutto subito.
Ti basta capire dove guardare a seconda di quello che vuoi fare.

Se vuoi capire cos'è DataCivicLab:
- fai un passaggio veloce da [come iniziare](docs/how-to-start.md)
- leggi la [mappa delle repo](docs/repository-map.md)
- guarda la [Open Board](https://github.com/orgs/dataciviclab/projects/5)
- guarda la [Roadmap](https://github.com/orgs/dataciviclab/projects/2)

Se vuoi contribuire:
- usa le policy condivise nella repo `.github`
- leggi i [canali della community](docs/community-channels.md)
- se lavori su un dataset, parti dal `project-template`

Se devi aprire una issue qui in `dataciviclab`, usala per:
- roadmap del Lab
- lavori che toccano più repo
- proposta di un nuovo progetto
- decisioni organizzative

Bug, fix e task tecnici vanno invece aperti nella repo giusta.

Se fai parte dei maintainer:
- usa il [modello di governance](docs/governance-model.md)
- segui il [playbook maintainer](docs/maintainer-playbook.md)

## 🧭 Le repo principali

### `dataciviclab`
Hub pubblico dell'organizzazione.
Spiega il progetto, orienta tra le repo e indirizza verso board, progetti e risultati pubblici.

### `.github`
Regole condivise di collaborazione su GitHub.
Qui stanno `CONTRIBUTING`, template issue e PR, codice di condotta e linee guida comuni.

### `toolkit`
Motore operativo del Lab.
Qui vivono i comandi, la logica di pipeline e la documentazione tecnica del workflow dati.

### `project-template`
Modello standard per creare un nuovo repo dataset o progetto.
Definisce la struttura minima, i workflow di base e l'integrazione con il toolkit.

### Repo dataset
Ogni progetto concreto vive in una repo dedicata.
Li segui nella [Open Board](https://github.com/orgs/dataciviclab/projects/5) e nelle repo dedicate.

### `preanalysis/` in `dataciviclab`
Sezione pubblica di validazione leggera per candidati progetto.
Serve per rendere visibile il passaggio:
`Discussion -> issue -> RAW/CLEAN -> prima analisi -> decisione`
Link diretto: [preanalysis/README.md](preanalysis/README.md)

### `projects/` in `dataciviclab`
Indice leggero dei progetti già promossi a repo dedicate.
Serve per rendere visibile quali filoni sono già usciti da `preanalysis/` senza duplicare il lavoro tecnico che vive nelle repo progetto.
Link diretto: [projects/README.md](projects/README.md)

## 🤝 Che tipo di spazio è

Cerchiamo di costruire un luogo pubblico ordinato, leggibile e aperto anche a chi non arriva dal mondo tecnico.

Non serve essere esperti per orientarsi.
Serve solo voglia di capire, fare domande giuste e lavorare in modo chiaro.

## 🛠️ Come lavora il Lab

Il flusso del Lab è semplice:

`domanda civica -> dati pubblici -> metodo chiaro -> output pubblico`

Il principio resta lo stesso in ogni progetto:
- partire da una domanda comprensibile
- usare fonti difendibili
- lasciare tracce verificabili
- pubblicare risultati leggibili anche da chi non è tecnico

## ❓ Domande, repo e output

Un repository dataset non coincide necessariamente con una sola domanda.

Il modello che seguiamo è questo:

- una repo dataset nasce attorno a un dataset o a un progetto dati
- ogni repo dovrebbe avere una **domanda civica principale** che le dia un asse chiaro
- dallo stesso dataset possono nascere anche **domande secondarie o complementari**
- le domande emergono e si affinano in **GitHub Discussions**
- quando una discussione diventa lavoro concreto, si apre una **Issue** nella repo giusta
- da lì possono nascere notebook, analisi, risposte pubbliche o dashboard

In breve:

`Discussion -> Issue -> Repo dataset -> output pubblico`

Questo ci aiuta a non confondere i livelli:

- la **Discussion** serve a formulare e chiarire la domanda
- la **Issue** serve a trasformarla in lavoro operativo
- la **repo dataset** serve a produrre una risposta verificabile

L'obiettivo non è accumulare dati o tooling.
L'obiettivo è riuscire a rispondere meglio a domande civiche concrete.

## 💬 Community

- [GitHub Discussions](https://github.com/orgs/dataciviclab/discussions) per proposte, domande e confronto pubblico
- [Open Board](https://github.com/orgs/dataciviclab/projects/5) per seguire il lavoro in corso
- [Roadmap](https://github.com/orgs/dataciviclab/projects/2) per vedere direzione, progetti e prossime tappe
- [Discord](https://discord.gg/rAHpuTrYK3) per coordinamento veloce ed eventi
- [LinkedIn](https://www.linkedin.com/company/dataciviclab/) per aggiornamenti pubblici e diffusione esterna

I canali hanno ruoli diversi, ma l'idea è semplice:
- Discussions per parlare con calma e lasciare traccia
- Open Board per vedere cosa stiamo facendo adesso
- Roadmap per capire dove sta andando il Lab
- Discord per scambio veloce e momenti più informali
- LinkedIn per raccontare all'esterno quello che il Lab pubblica

Le decisioni e lo stato del lavoro devono comunque lasciare traccia su GitHub.

Per i dettagli, vedi [docs/community-channels.md](docs/community-channels.md).

## Ritmo operativo del Lab

Il Lab funziona meglio quando mantiene un ciclo continuo ma leggero:

- far emergere nuove domande civiche tramite Discussions
- promuovere a Issue solo le domande che meritano lavoro concreto
- pubblicare con continuità output leggibili, anche piccoli

La cadenza giusta non è aprire ticket a tutti i costi.
La cadenza giusta è tenere vivo un flusso credibile:

`nuova domanda sensata -> analisi -> risposta condivisibile`

Una risposta può essere anche minima:

- una tabella commentata
- un grafico con due righe di interpretazione
- una nota intermedia su cosa si capisce già e cosa manca
- un notebook che chiude una domanda precisa

Conta più la regolarità del valore prodotto che il volume di attività aperte.
