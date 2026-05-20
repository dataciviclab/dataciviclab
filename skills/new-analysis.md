---
name: new-analysis
description: Workflow canonico per avviare e pubblicare una nuova analisi in `dataciviclab/analisi/`, dal setup del branch alla PR.
metadata:
  version: "1.0"
  status: "stable"
  standard: "compact-first"
---

# Skill: new-analysis

Avvia e completa una nuova analisi in `dataciviclab/analisi/`.

## Quando usarla

- Un dataset è già pubblicato su GCS (passato da `dataset-incubator`)
- Esiste una domanda civica chiara (Discussion o issue in `dataciviclab`)
- Si vuole produrre README pubblico + notebook tecnico + figure

## Prerequisiti

- Python 3.12+ con duckdb, pandas, matplotlib, jupyter, nbconvert
- Accesso in lettura a `gs://dataciviclab-clean/` (pubblico, nessun secret)
- Branch fresh da `main`

## Struttura finale del filone

```
analisi/<slug>/
  README.md          # Pagina pubblica (storia + figure)
  figures/           # PNG generati dal notebook
  notebooks/
    <slug>_v2.ipynb  # Notebook tecnico (codice + grafici)
```

## Step

### 1. Setup

```bash
git checkout -b feat/<slug>
mkdir -p analisi/<slug>/notebooks analisi/<slug>/figures
```

Copia lo scheletro del README da `analisi/_template/README.md`.

### 2. Notebook tecnico

Scrivi il notebook come strumento di validazione:

- Prima cella: markdown con titolo, dataset, link al README
- Setup DuckDB + GCS: `con.execute("INSTALL httpfs; LOAD httpfs;")`
- Query di verifica copertura (anni, righe)
- Una cella codice per ogni trend/domanda, con commento breve (`# 1. Trend nazionale`)
- Ogni grafico:
  ```python
  plt.savefig('../figures/<slug>_<desc>.png', dpi=150, bbox_inches='tight')
  ```
- Nessuna narrativa estesa (sta nel README)
- Nessuna conclusione (sta nel README)

### 3. README pubblico

Segui la struttura di `analisi/_template/README.md`:

- Frontmatter YAML obbligatorio (title, description, topics, status, dataset_slug)
- Hook iniziale (1-2 frasi con il risultato principale)
- Sezioni con tabelle + figure intervallate da narrativa
- Conclusione con domanda civica
- Sezione Dataset + Limiti
- Link al notebook e al contratto tecnico

Il lettore tipo è un cittadino o policy maker — niente codice, niente dettagli implementativi.

### 4. Figure

- DPI: 150
- Colori: palette semplice (`#2c3e50`, `#27ae60`, `#e74c3c`, `#95a5a6`)
- `bbox_inches='tight'` per tagliare il bianco
- Nomi file descrittivi: `<slug>_trend_nazionale.png`
- Salvate in `figures/` e referenziate dal README come `![descrizione](figures/<nome>.png)`

### 5. Verifica pre-PR

Prima di aprire la PR:

- [ ] Il notebook gira senza errori: `jupyter nbconvert --to notebook --execute notebooks/<slug>_v2.ipynb`
- [ ] Le figure sono aggiornate e in figures/
- [ ] I numeri nel README corrispondono al notebook
- [ ] README linka correttamente le figure
- [ ] Il frontmatter YAML è compilato

### 6. PR

```bash
git add analisi/<slug>/
git commit -m "<slug>: analisi con README, notebook, figure"
git push origin feat/<slug>
```

Apri PR verso `main`. La CI esegue automaticamente il notebook e verifica che non ci siano errori.

## Regole

- README e notebook hanno ruoli distinti: non duplicare narrativa
- Le figure sono l'unico ponte tra notebook e README
- Non tracciare file generati dal notebook (es. `summary.json`) a meno di esigenze esplicite
- Non includere riferimenti ad agenti, handoff o procedure interne nel README pubblico
- I numeri nel README devono essere allineati al notebook eseguito

## Limitazioni

- Il notebook assume accesso pubblico a GCS — non funziona offline
- Dataset con dati sensibili non vanno in analisi/ (solo dati aperti)
