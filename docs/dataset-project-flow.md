# Flusso dataset / progetto

Questa pagina descrive il funnel canonico del Lab per trasformare un segnale o una domanda civica in un progetto dati leggibile, verificabile e, se il lavoro lo giustifica, promosso al catalogo pubblico.

## Vista rapida (Funnel v0)

```text
1. SCOUTING   (source-check)
  -> 2. VALIDATION (Reddit/Social - opzionale)
    -> 3. CONSOLIDATION (GitHub Discussion)
      -> 4. INCUBATION (dataset-incubator: contratto tecnico)
        -> 5. ANALYSIS (analisi/findings: layer pubblico)
          -> 6. PROMOTION (data-explorer: catalogo - opzionale)
```

Il percorso non e' una catena rigida, ma un funnel di selezione: non tutti i segnali diventano Discussion, non tutte le analisi finiscono in explorer.

## Regola pratica

- **GitHub Discussion** e' l'**artifact canonico** di consolidamento: il posto dove le informazioni diventano stabili e referenziabili.
- **Reddit / Social** sono i **sensori di segnale**: servono a testare la tensione civica di un tema prima di impegnare risorse GitHub, quando il caso lo richiede.
- **dataset-incubator** e' la **casa tecnica**: conserva il contratto tecnico (`dataset.yml`, SQL, check) in modo permanente.
- **analisi/** e' il **layer pubblico**: e' la destinazione finale per la maggior parte dei racconti del Lab.

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

## Step 4: INCUBATION (dataset-incubator)

Quando il perimetro v0 e' chiaro, il dataset entra formalmente in incubazione tecnica.
**Workflow pubblico: `intake-candidate`**

Repo:

- `dataset-incubator`

Qui si lavora su:

- `dataset.yml`
- `sql/clean.sql`
- `sql/mart.sql`
- check minimi e note di metodo

Output atteso: candidate o PR verde che garantisce la stabilita' tecnica del dato.

Per il run tecnico vero e proprio del candidate:

- `dataset-incubator/skills/run-candidate.md`

## Step 5: ANALYSIS (analisi/findings)

Il layer pubblico finale vive in `dataciviclab/analisi/<slug>/`.
**Workflow del Lab: `promote-analisi`**

Un filone entra in `analisi/` se il dato tecnico e' stabile e vogliamo pubblicare una lettura leggibile (README, notebook o finding). Per molti dataset, questo e' l'endpoint naturale del funnel.

## Step 6: PROMOTION (data-explorer)

Promozione al catalogo pubblico nazionale (`data-explorer`).
**Workflow del Lab: `add-to-explorer`**

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
