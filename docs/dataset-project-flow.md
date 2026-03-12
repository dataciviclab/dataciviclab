# Flusso dataset / progetto

Questa pagina descrive il flusso canonico del Lab per trasformare una domanda civica in un progetto dati leggibile, verificabile e potenzialmente promosso a repo dedicata.

## Vista rapida

```text
Domanda civica
  -> Discussion
  -> issue operativa
  -> dataset-incubator (se serve validazione tecnica privata)
  -> dataciviclab/preanalysis
  -> repo dedicata dal project-template
  -> scheda leggera in dataciviclab/projects
```

Non tutti i filoni passano da ogni step.
Il percorso dipende dalla maturita della domanda, dalla complessita tecnica e dal livello di validazione gia raggiunto.

## Regola pratica

- `dataciviclab` e l'hub pubblico
- `dataset-incubator` e il luogo di incubazione tecnica dei candidati ancora da stringere o validare
- `preanalysis/` e lo spazio pubblico di validazione dei filoni che hanno gia una prima storia leggibile
- una repo dedicata nasce quando il filone merita sviluppo continuo e non e piu solo una prova o una preanalisi

## Step 1: Discussion

Si parte da una domanda civica o da un tema pubblico abbastanza chiaro da meritare esplorazione.

La `Discussion` serve a:
- formulare meglio la domanda
- chiarire perche conta
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
Deve solo dire qual e il prossimo passo utile.

## Step 3: quando usare dataset-incubator

`dataset-incubator` si usa quando il filone ha bisogno di validazione tecnica o di restringere ancora il proprio contratto.

E il posto giusto se:
- la fonte e ancora da verificare bene
- il tracciato e ambiguo o instabile
- serve capire se il dataset regge davvero
- il primo mart o notebook non e ancora chiaro
- il filone non e ancora pronto per il flusso pubblico completo

Qui si lavora soprattutto su:
- `dataset.yml`
- `sql/clean.sql`
- `sql/mart.sql`
- notebook `v0`
- note di metodo
- registry dei filoni attivi

Output minimo atteso:
- run funzionante almeno sul perimetro iniziale
- prima lettura che racconti qualcosa
- decisione: archiviare, continuare o promuovere

## Step 4: quando entrare in preanalysis

`dataciviclab/preanalysis` e lo spazio pubblico di validazione dei candidati che hanno gia una prima storia leggibile.

Un filone entra in `preanalysis/` se ha:
- una domanda civica chiara
- una issue collegata a una Discussion
- un output minimo atteso
- un primo nucleo tecnico che regge
- abbastanza sostanza da meritare visibilita pubblica

La forma puo essere di due tipi:

### Preanalysis autosufficiente

Il repo contiene direttamente il contratto principale del filone:
- `dataset.yml`
- `sql/`
- notebook
- note
- output minimo leggibile

### Preanalysis handoff da incubator

Il nucleo tecnico vive ancora soprattutto in `dataset-incubator`, ma `dataciviclab` riceve il layer analitico pubblico gia pronto:
- `README`
- notebook
- indicazione esplicita degli artifact o dipendenze necessari

Questa forma va dichiarata chiaramente, per evitare ambiguita sul grado di autosufficienza della preanalysis.

## Step 5: quando nasce una repo dedicata

Una repo dedicata nasce dal `project-template` quando il filone non e piu solo una preanalisi e richiede sviluppo continuo.

Segnali tipici:
- il dataset regge stabilmente
- esiste gia un output leggibile e condivisibile
- il prossimo backlog e abbastanza chiaro
- il filone ha valore sufficiente per vivere da progetto autonomo

La repo dedicata e la sede giusta per:
- lavoro tecnico continuativo
- notebook e output successivi
- issue proprie
- documentazione del progetto
- pubblicazione e manutenzione

## Step 6: cosa resta in dataciviclab

Quando un filone viene promosso:
- il lavoro tecnico esce da `dataciviclab`
- in `dataciviclab/projects/` resta una scheda leggera del progetto
- la Discussion pubblica continua a vivere in `dataciviclab`

In questo modo `dataciviclab` resta il punto di orientamento pubblico, senza duplicare il lavoro tecnico delle repo progetto.

## Due percorsi validi

### Percorso standard

```text
Discussion
  -> issue
  -> preanalysis
  -> repo dedicata
```

E il percorso piu semplice quando il filone e gia abbastanza leggibile e non richiede molta incubazione tecnica privata.

### Percorso con incubator

```text
Discussion
  -> issue
  -> dataset-incubator
  -> preanalysis
  -> repo dedicata
```

E il percorso giusto quando il filone ha bisogno di piu consolidamento tecnico prima di diventare pubblico.

## Checklist sintetica

### Per entrare in dataset-incubator
- domanda abbastanza chiara
- fonte reale individuata
- primo perimetro tecnico plausibile
- issue operativa aperta

### Per entrare in preanalysis
- domanda leggibile
- primo output minimo definito
- notebook o mart che raccontano qualcosa
- decisione esplicita di rendere pubblico il filone

### Per promuovere a repo dedicata
- contratto tecnico stabile almeno sul perimetro iniziale
- output minimo gia riuscito
- backlog successivo piccolo ma reale
- README iniziale scrivibile senza inventare

## Repo coinvolte

- `dataciviclab`: hub pubblico, Discussions, issue, `preanalysis/`, `projects/`
- `dataset-incubator`: incubazione tecnica dei candidati
- `project-template`: bootstrap di nuove repo dataset/progetto
- `toolkit`: motore tecnico e workflow canonico dei dati

## Nota finale

Il flusso non e una catena rigida.
Serve a mantenere il Lab leggibile, a ridurre il backlog vago e a promuovere solo i filoni che hanno davvero iniziato a reggere.
