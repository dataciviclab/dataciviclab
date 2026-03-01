# Decision Log

Questo file registra decisioni valide per tutto il Lab o eccezioni che incidono sul metodo comune.

## Regole

Ogni voce deve contenere:

- data;
- scelta;
- motivazione;
- impatto;
- owner o ruolo responsabile.

## Esempi

### 2026-03-01 - Usare `snake_case` come standard unico

Scelta: tutti i nuovi file, colonne e metriche usano `snake_case`.
Motivazione: riduce ambiguita tra repo e facilita riuso di script e query.
Impatto: i nomi legacy possono restare solo se mappati e spiegati.
Owner: Maintainer.

### 2026-03-01 - Accettare release `v0.1` con limiti espliciti

Scelta: una prima release pubblica puo essere incompleta se metodo, fonti e limiti sono gia visibili.
Motivazione: il Lab privilegia apprendimento pubblico e iterazione trasparente.
Impatto: la release notes deve evidenziare chiaramente cosa non e ancora stabile.
Owner: Maintainer.

### 2026-03-01 - Documentare eccezioni di validazione

Scelta: un test fallito non si ignora; si registra un'eccezione temporanea con condizione di uscita.
Motivazione: evita debito nascosto e rende difendibili compromessi operativi.
Impatto: reviewer e contributor condividono lo stesso punto di controllo.
Owner: Reviewer / Triage.
