# Flusso dataset / progetto

Questa pagina descrive il flusso canonico del Lab per trasformare una domanda civica in un progetto dati leggibile, verificabile e — se il lavoro lo giustifica — promosso a repo dedicata.

## Vista rapida

```text
Domanda civica
  -> Discussion
  -> issue operativa
  -> dataset-incubator (contratto tecnico: dataset.yml, sql, pipeline)
  -> dataciviclab/analisi (layer pubblico: README, notebook, Discussion)
  -> [solo se giustificato] repo dedicata dal project-template
```

Non tutti i filoni passano da ogni step.
La maggior parte vive in `analisi/` senza diventare mai una repo dedicata — e va bene cosi.

## Regola pratica

- `dataciviclab` e' l'hub pubblico: Discussions, task cross-repo, `analisi/`, `projects/`
- `dataset-incubator` e' la casa permanente del contratto tecnico di ogni filone
- `analisi/` e' la destinazione finale del layer pubblico: README civico, notebook leggibile, Discussion collegata
- una repo dedicata nasce solo quando il filone richiede sviluppo continuativo e governance propria

Il contratto tecnico (dataset.yml, sql/, pipeline) resta in `dataset-incubator` anche dopo la promozione in analisi/.
Il layer pubblico (README, notebook) vive in `dataciviclab/analisi/`.
Le due cose sono complementari, non alternative.

## Step 1: Discussion

Si parte da una domanda civica o da un tema pubblico abbastanza chiaro da meritare esplorazione.

La `Discussion` serve a:
- formulare meglio la domanda
- chiarire perche' conta
- raccogliere primi dubbi, fonti e angoli possibili
- capire se il tema ha abbastanza sostanza per diventare un filone

Output minimo:
- una domanda leggibile
- una prima ipotesi di fonte o dataset
- un perimetro iniziale plausibile

## Step 2: issue operativa

Quando la domanda regge, va trasformata in una issue piccola e concreta.

La issue serve a:
- fissare il primo passo reale
- evitare backlog vago
- creare un punto di riferimento operativo

La prima issue non deve descrivere tutto il progetto.
Deve solo dire qual e' il prossimo passo utile.

## Step 3: dataset-incubator — il contratto tecnico

`dataset-incubator` e' il luogo dove si costruisce e si stabilizza il contratto tecnico del filone.

Qui si lavora su:
- `dataset.yml`
- `sql/clean.sql`
- `sql/mart.sql`
- notebook `v0`
- note di metodo

E' il posto giusto se:
- la fonte e' ancora da verificare bene
- il tracciato e' ambiguo o instabile
- serve capire se il dataset regge davvero
- il primo mart o notebook non e' ancora chiaro

Output minimo atteso:
- run funzionante almeno sul perimetro iniziale
- prima lettura che racconti qualcosa
- decisione: archiviare, continuare o promuovere

Il contratto tecnico non esce mai da `dataset-incubator`.
Anche dopo che il filone entra in `analisi/`, il riferimento tecnico resta li'.

## Step 4: analisi/ — il layer pubblico

`dataciviclab/analisi/` e' la destinazione finale del layer pubblico dei filoni attivi.

Un filone entra in `analisi/` se ha:
- una domanda civica chiara
- una issue collegata a una Discussion
- un output minimo atteso
- un primo nucleo tecnico che regge in DI
- abbastanza sostanza da meritare visibilita' pubblica

Cosa vive in `analisi/<slug>/`:
- `README` con domanda, dataset, stato, link alla Discussion
- notebook con lettura leggibile
- eventuali note o asset leggeri

Cosa non vive in `analisi/`:
- dataset.yml, sql/, pipeline — restano in dataset-incubator
- dati grezzi o output tecnici

Per la maggior parte dei filoni, `analisi/` e' l'endpoint.
Non e' un gradino verso qualcosa di piu': e' gia' il posto giusto.

## Step 5: quando nasce una repo dedicata (opzionale)

Una repo dedicata e' giustificata solo in casi specifici.

Segnali che la giustificano:
- il filone coinvolge piu' dataset indipendenti con pipeline proprie
- esiste un output periodico che richiede aggiornamento continuativo
- la community ha raggiunto una dimensione che richiede governance propria
- il backlog e' abbastanza ampio da non stare in una Issue

Se questi segnali non ci sono, il filone resta in `analisi/`.
Aprire una repo dedicata troppo presto e' dispersivo: aumenta la manutenzione e spezza la visibilita' senza aggiungere valore.

Quando una repo nasce:
- esce dal `project-template`
- si collega alla Open Board
- in `dataciviclab/projects/` resta una scheda leggera del progetto
- la Discussion pubblica continua a vivere in `dataciviclab`

## Due percorsi tipici

### Percorso senza repo dedicata (la maggioranza)

```text
Discussion
  -> issue
  -> dataset-incubator (contratto tecnico)
  -> analisi/ (layer pubblico, destinazione finale)
```

### Percorso con repo dedicata (eccezione)

```text
Discussion
  -> issue
  -> dataset-incubator (contratto tecnico)
  -> analisi/ (layer pubblico)
  -> repo dedicata (solo se giustificata dai segnali sopra)
```

## Checklist sintetica

### Per entrare in dataset-incubator
- domanda abbastanza chiara
- fonte reale individuata
- primo perimetro tecnico plausibile
- issue operativa aperta

### Per entrare in analisi
- domanda leggibile
- Discussion collegata
- primo output minimo definito
- notebook o mart che raccontano qualcosa
- decisione esplicita di rendere pubblico il filone

### Per aprire una repo dedicata
- contratto tecnico stabile almeno sul perimetro iniziale
- output minimo gia' riuscito
- backlog successivo piccolo ma reale
- segnali concreti che giustificano governance propria

## Repo coinvolte

- `dataciviclab`: hub pubblico, Discussions, issue, `analisi/`, `projects/`
- `dataset-incubator`: contratto tecnico permanente dei filoni
- `project-template`: bootstrap delle repo dedicate
- `toolkit`: motore tecnico e workflow canonico dei dati

## Nota finale

Il flusso non e' una catena rigida.
Serve a mantenere il Lab leggibile, a ridurre il backlog vago e a promuovere solo i filoni che hanno davvero motivo di crescere.
