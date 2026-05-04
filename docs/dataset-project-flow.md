# Flusso dataset / progetto

Questa pagina descrive il funnel canonico del Lab per trasformare un segnale o una domanda civica in un progetto dati leggibile, verificabile e, se il lavoro lo giustifica, promosso al catalogo pubblico.

## Vista rapida

```text
1. SCOUTING      (source-observatory: source-check)
   -> 2. CONSOLIDATION (GitHub Discussion)
      -> 3. INCUBATION (dataset-incubator: contratto tecnico + toolkit)
         -> 4. ANALYSIS (dataciviclab/analisi/: layer pubblico)
            -> 5. PROMOTION (data-explorer: catalogo pubblico - opzionale)
```

Il percorso non e' una catena rigida, ma un funnel di selezione: non tutti i segnali diventano Discussion, non tutte le analisi finiscono in explorer.

Validation via social (Reddit) e' un passo opzionale, utile per testare la tensione civica su temi nuovi prima di consolidare in GitHub.

## Regola pratica

- **GitHub Discussion** e' l'**artifact canonico** di consolidamento: il posto dove le informazioni diventano stabili e referenziabili.
- **Reddit / Social** sono i **sensori di segnale**: servono a testare la tensione civica di un tema prima di impegnare risorse GitHub, quando il caso lo richiede.
- **dataset-incubator** e' la **casa tecnica**: conserva il contratto tecnico (`dataset.yml`, SQL, check, `pipeline_signals.json`) in modo permanente.
- **toolkit** e' il **motore**: RAW → CLEAN → MART, convalidato da mypy in CI e coverage ≥80%.
- **analisi/** e' il **layer pubblico**: e' la destinazione finale per la maggior parte dei racconti del Lab.
- **data-explorer** e' il **catalogo**: espone i dataset puliti del Lab con schede, metadati e query DuckDB.

---

## Step 1: SCOUTING

Si parte da una fonte o da un tema. Lo scouting tecnico serve ad assegnare un **verdict**.
**Workflow pubblico: `source-check`**

Repo:

- `source-observatory`

Obiettivo: decidere se la fonte regge davvero su accesso, formato, domanda civica e rischio semantico.

Esiti tipici:

- `go Discussion`
- `aggiorna #N`
- `watchlist`
- `support dataset`
- `no-go`

## Step 2: VALIDATION (segnale esterno)

Prima di aprire una Discussion su GitHub, possiamo testare l'interesse della community su Reddit o altri canali.
**Formati consigliati: `Dataset Request` o `Question Check`**

Obiettivo: capire se la domanda civica genera risposte o interesse reale. Se il segnale e' debole, il tema puo' restare in `watchlist` locale senza appesantire il backlog GitHub.

Nota: questo step e' opzionale, non obbligatorio per ogni dataset.

## Step 3: CONSOLIDATION (GitHub Discussion)

Se il segnale e' positivo, oppure se il caso e' gia' abbastanza forte da consolidare direttamente, fissiamo tutto in una Discussion in `dataciviclab`.
**Workflow del Lab: `open-discussion`**

Qui la domanda si fissa, le fonti si ordinano e il filone diventa un artifact pubblico condivisibile. Non e' il posto per chiedere "interessa?", ma per dire "ecco perche' questa pista merita attenzione".

## Step 4: INCUBATION (dataset-incubator + toolkit)

Quando il perimetro e' chiaro, il dataset entra formalmente in incubazione tecnica.
**Workflow pubblico: `intake-candidate`**

Repo:

- `dataset-incubator` (contratto tecnico)
- `toolkit` (motore di esecuzione)

Qui si lavora su:

- `dataset.yml` con schema validato da Pydantic
- `sql/clean.sql` e `sql/mart.sql`
- validazione via `toolkit validate all`
- gate `toolkit blocker-hints` in PR CI
- `pipeline_signals.json` aggiornato automaticamente dopo il merge

Output atteso: PR verde (`toolkit run all` + `validate all` passa, blocker_count = 0).

Per il run tecnico vero e proprio del candidate:

- `dataset-incubator/skills/run-candidate.md`

Dopo il merge, il workflow `post-merge-candidate.yml` aggiorna i segnali e apre
una draft PR di handoff per il maintainer con i comandi GCS/BQ.

## Step 5: ANALYSIS (analisi/findings)

Il layer pubblico finale vive in `dataciviclab/analisi/<slug>/`.
**Workflow del Lab: `promote-analisi`**

Un filone entra in `analisi/` se il dato tecnico e' stabile e vogliamo pubblicare una lettura leggibile (README, notebook o finding). Per molti dataset, questo e' l'endpoint naturale del funnel.

## Step 6: PROMOTION (data-explorer)

Promozione al catalogo pubblico nazionale ([`data-explorer`](https://github.com/dataciviclab/data-explorer)).
**Workflow del Lab: `add-to-explorer`**

Il dataset viene registrato in `registry/clean_catalog.json` con slug, periodo, colonne e location GCS.
La validazione del catalogo e dei path GCS e' automatica via CI (`validate-clean-catalog.yml`).

Questo step e' opzionale: ha senso soprattutto se il dataset e' periodico, ha una domanda civica larga o e' un gap prioritario che merita una vista pubblica permanente.

---

## Due percorsi tipici

### 1. Percorso civico standard

`Scouting -> Validation (opzionale) -> Discussion -> Incubation -> Analysis`

### 2. Percorso prioritario (HVD / gap forti)

`Scouting -> Discussion -> Incubation -> Analysis -> Promotion`

---

## Note operative

- **Anti-rumore**: non postare sui social per ogni aggiornamento tecnico.
- **Issue madre**: usa `dataset-funnel.yml` in `dataciviclab` per tracciare la journey end-to-end nella Open Board.
- **Chiusura**: una journey si chiude quando l'obiettivo del funnel viene raggiunto (`Analysis` o `Promotion`).

Per i puntatori ai workflow pubblici nelle repo del Lab:

- [workflows.md](workflows.md)
