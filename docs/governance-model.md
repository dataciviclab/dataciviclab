# Modello di governance

DataCivicLab cresce in modo semplice:
- pochi ruoli chiari
- decisioni leggibili
- responsabilita' esplicite

## Cosa governa questa repo

Qui descriviamo la governance del Lab come ecosistema:
- come sono divise le responsabilita' tra le repo
- come nasce un nuovo progetto
- come si tiene coerente il sistema nel tempo

Le regole pratiche di collaborazione su GitHub stanno nella [repo `.github`](https://github.com/dataciviclab/.github).

## Ruoli essenziali

### Maintainer

Custodisce la coerenza del Lab.
Tiene insieme visione, struttura e qualita' complessiva.

### Contributor

Aiuta a costruire un progetto, una documentazione o uno strumento utile.
Il punto di ingresso e' una `good first issue` o un commento su una Discussion aperta.

### Core contributor

Tiene in mano un pezzo di lavoro piu' stabile:
- accompagna un filone
- chiude follow-up
- regge il passaggio da Discussion a issue o output
- non lavora solo su task isolati

**Come si diventa core contributor:**
- almeno due contributi concreti mergiati (PR o commenti sostanziali su Discussion)
- interesse dichiarato a reggere un filone specifico nel tempo
- proposta del maintainer, dopo aver osservato continuita' nel lavoro

Non e' una soglia automatica. Il maintainer la propone quando vede il pattern.

### Reviewer

Verifica chiarezza, metodo e tenuta del lavoro prima che diventi parte del sistema.
E' un ruolo trasversale, non un gradino della scala: un contributor puo' essere reviewer su un filone che conosce bene, anche prima di diventare core.

## In pratica, chi decide cosa?

- Le idee e le domande nascono in pubblico, di solito su GitHub Discussions.
- I maintainer tengono coerenza, priorita' e direzione generale.
- I progetti crescono repo per repo, con lavoro visibile e verificabile.
- I contributor entrano da task piccoli e mirati: le `good first issue` aperte sono il punto di partenza.
- Per lavorare su una issue, lascia un commento — un maintainer risponde entro 7 giorni.
- I core contributor emergono quando iniziano a reggere un filone nel tempo.

Se non sai da dove partire, leggi [`docs/how-to-start.md`](how-to-start.md).

## Come nasce un nuovo progetto

1. Una domanda civica viene proposta in modo chiaro, di solito in una Discussion.
2. Si verifica che esistano dati pubblici adatti.
3. Se serve validazione tecnica, il candidato entra in `dataset-incubator`.
4. Quando il filone ha una prima storia leggibile, entra in `analisi/` nel repo `dataciviclab`.
5. I maintainer valutano se la preanalisi e' pronta per una repo dedicata.
6. Se la proposta regge, nasce una nuova repo dal `project-template`.
7. Il progetto entra nelle board pubbliche e nel flusso operativo del Lab.

## Principio guida

Il Lab non cresce aggiungendo rumore.
Cresce quando ogni nuovo progetto rende il sistema piu' chiaro, piu' utile e piu' verificabile.
