# Validation Playbook

Le validazioni minime del Lab sono poche ma obbligatorie.

## Controlli minimi

- `required`: i campi essenziali non devono essere null quando la presenza e attesa;
- `unique keys`: le chiavi dichiarate devono essere uniche nel livello in cui valgono;
- `range sanity`: valori fuori scala devono essere gestiti o spiegati;
- `rowcount drift`: variazioni forti di volume tra run o release vanno controllate.

## Pattern operativo

- testa prima di cambiare;
- applica la modifica minima necessaria;
- riesegui gli stessi test e confronta il delta;
- se accetti un'eccezione, documentala in [DECISION_LOG.md](./DECISION_LOG.md).

## Come documentare eccezioni

Ogni eccezione deve indicare:

- data della decisione;
- regola sospesa o adattata;
- motivazione;
- impatto atteso;
- condizione per rimuovere l'eccezione.
