# DCL UX Refactor — note di lavoro

Documento di lavoro interno. Non destinato a diventare documentazione pubblica definitiva.

## Problema centrale

La documentazione descrive bene *come funziona il Lab* ma non risponde alla domanda più ovvia
di chi arriva dall'esterno: "cosa avete già fatto?". Il flusso utente esterno è rotto in tre punti:

1. nessun indice di output reali pubblicati
2. salto brusco da "domanda civica" a gergo tecnico (venv, dataset-incubator, analisi)
3. stato reale del Lab non leggibile senza conoscere la struttura interna

---

## Cosa cambia nel README

Fatto. Vedi `README.md` su questo branch.

Rimosso: sezioni interne (come entrare nel Lab con label, ritmo operativo, repo descriptions tecniche,
flusso Discussion->Issue come plumbing). Aggiunto: sezione output reali, due percorsi di partecipazione
chiari, link a docs/ solo per chi vuole approfondire.

Nota: il README ora linka `docs/come-contribuire.md` che non esiste ancora — da creare (vedi sotto).

---

## Cleanup analisi/

### Il problema

Le analisi irpef e civile-flussi sono ibride: hanno una sezione pubblica (domanda, dataset, stato)
e una sezione tecnica legacy (comandi toolkit, path di output) che i README stessi dichiarano obsoleta:

> "questo README conserva ancora un setup tecnico del vecchio modello analisi autosufficiente.
> Nel modello attuale il contratto tecnico di riferimento vive in dataset-incubator"

### Cosa fare

Ogni README in analisi/ dovrebbe contenere solo:

- domanda principale
- perché conta
- dataset (fonte, copertura, limiti noti) — senza comandi
- stato attuale (active/archiviato/promosso)
- discussion collegata
- prossimo passo atteso

Tutto il resto (dataset.yml, comandi run, path output) va rimosso o spostato in dataset-incubator
dove già vive nel modello attuale.

### Candidati da pulire

- `analisi/irpef-comunale-2019-2023/README.md` — ha sezione Esecuzione + path output da rimuovere
- `analisi/civile-flussi-2014-2024/README.md` — stessa cosa
- `analisi/irpef-comunale-2019-2023/dataset.yml` — da valutare se tenerlo come riferimento storico
  o spostarlo in DI (dove probabilmente già vive)

### Candidati già puliti (solo nota civica)

- `analisi/malasanita-struttura-mortalita/README.md`
- `analisi/dipendenti-pubblici-2021-2023/README.md`
- `analisi/terna-electricity-by-source/README.md`

---

## Cleanup registry/

### Il problema

`registry/active.md` è inutile: punta solo a una label GitHub dinamica, non mantiene nessuna lista.
`registry/archived.md` ha solo un placeholder di esempio.

### Cosa fare

`registry/active.md` diventa una lista statica leggibile:

```
| filone | discussion | checkpoint | stato |
|--------|------------|------------|-------|
| irpef-comunale-2019-2023 | #88 | 2026-Q1 | active |
| civile-flussi-2014-2024 | ... | 2026-Q1 | active |
| malasanita-struttura-mortalita | #99 | 2026-Q2 | active |
| terna-electricity-by-source | ... | 2026-Q2 | active |
| dipendenti-pubblici-2021-2023 | ... | 2026-Q2 | in valutazione |
```

`registry/archived.md` diventa una lista reale delle analisi uscite (con motivo).

---

## Upgrade projects/

### Il problema

`projects/` ha solo 2 schede minimali. Non funziona come indice di output reali perché le schede
non mostrano cosa è stato pubblicato concretamente (dati scaricabili, discussioni con risposte, notebook).

### Cosa fare

Ogni scheda in `projects/<slug>.md` dovrebbe aggiungere:

- link diretto ai dati o al notebook principale (se pubblico)
- 2-3 righe di segnale: cosa abbiamo trovato, non solo "cosa fa la repo"
- link alle discussion con risposte pubblicate

Esempio per openbdap:
> Dal 2002 al 2023 le uscite primarie sono cresciute del X%, con una accelerazione nel periodo Y-Z.
> [Discussion aperte con risposta](...)  [Dataset](...)

---

## Reorganizzazione docs/

### Stato attuale

```
docs/
  how-to-start.md          -- per newcomer (buono ma con salti di difficoltà)
  dataset-project-flow.md  -- per contributor tecnico (buono)
  repository-map.md        -- per chiunque (buono, secondario)
  community-channels.md    -- per chiunque (manca link diretto Discord)
  local-setup.md           -- per contributor tecnico (buono, isolato)
  governance-model.md      -- per maintainer (buono)
  maintainer-playbook.md   -- per maintainer (buono)
```

### Cosa manca

`docs/come-contribuire.md` — linkato dal nuovo README, da creare.
Contenuto: merge di CONTRIBUTING.md + sezione "come entrare" del vecchio README.
Struttura: tre percorsi (domanda civica, contributo tecnico, review/docs) con passi concreti.

### Cosa rivedere

`how-to-start.md` — togliere i riferimenti a good-first issue come primo passo; il primo passo
è sempre la Discussion. Le issue sono per chi è già orientato.

`community-channels.md` — aggiungere link diretto Discord e LinkedIn.

`CONTRIBUTING.md` (root) — dopo la creazione di `docs/come-contribuire.md` valutare se
CONTRIBUTING.md diventa solo un rimando breve, o si mantiene separato con le regole GitHub-specifiche.

---

## Overlapping da risolvere

| problema | file coinvolti | azione |
|----------|---------------|--------|
| flusso Discussion->Issue spiegato in 3 posti | README, CONTRIBUTING, how-to-start | tenere solo in dataset-project-flow, rimandare dagli altri |
| WIP limit non pubblico | governance-model, analisi/README | aggiungere in analisi/README dove ha senso |
| due CONTRIBUTING con flussi leggermente diversi | dataciviclab/CONTRIBUTING, .github/CONTRIBUTING | dataciviclab/CONTRIBUTING rimanda a .github per le regole comuni |

---

## Ordine di intervento consigliato

1. Pulire analisi/ (rimuovere sezioni tecniche legacy dai README)
2. Riscrivere registry/active.md come lista statica
3. Creare docs/come-contribuire.md
4. Aggiornare schede in projects/ con segnale e link output
5. Rivedere how-to-start.md (togliere salto tecnico)
6. Aggiungere link diretti in community-channels.md
7. Slim CONTRIBUTING.md (rimando a docs/come-contribuire)

Il README è già fatto (step 0).

---

## Decisioni aperte

- `analisi/irpef/dataset.yml`: tenerlo come riferimento storico o eliminarlo?
  Se vive già in DI, elimina. Se non è in DI, spostarlo prima di eliminare da qui.
- Profile org (`github/profile/README.md`): aggiornare in parallelo o dopo?
  Dipende da quanto cambia l'identità pubblica con questo refactor.
- Emoji nel README: il draft attuale le ha rimosse. Confermare questa scelta?
