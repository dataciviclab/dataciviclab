# Workspace DataCivicLab

Contratto e interfaccia per il **multi-repo workspace** (non un singolo git).

## Perché esiste

Il workspace non è più solo una cartella piena di repo: serve un **contratto
versionato** che dica quali repo esistono, dove stanno e come si installano.
Makefile, docs e tool leggono lo stesso file — niente path morti in tre posti.

## Componenti

| File | Ruolo |
|---|---|
| `workspace.toml` | **Sorgente unica**: path, repo GitHub, ruoli, private, install |
| `ws.py` | Manager (stdlib only): list, clone, status, doctor |
| `Makefile` | Interfaccia stabile (lifecycle + dev loop) — alla root come forwarder |

## Install nella root del workspace

Il workspace root di solito **non** è un git repo. Dopo aver clonato
l’hub, un forwarder di una riga alla root — zero drift, si aggiorna con
l’hub:

```bash
# da dataciviclab-workspace/ (dove vivono toolkit/, infra/, dominii…)
printf 'include infra/dataciviclab/workspace/Makefile\n' > Makefile
make help
make status
make doctor
```

Alternativa senza forwarder:

```bash
make -f infra/dataciviclab/workspace/Makefile status
```

## Comandi principali

```bash
make setup              # .venv + install core/essential dal contratto
make clone-core         # clona core + infra essenziali
make clone SLUG=open-siope
make status             # vs contratto
make doctor             # validazione
make contributor        # istruzioni fork/upstream
```

## Layout canonico (descritto dal contratto)

```text
dataciviclab-workspace/
  Makefile              # forwarder: include infra/dataciviclab/workspace/Makefile
  .venv/
  .env
  toolkit/              # core
  lab-connectors/       # core
  dcl-mcp/              # core — MCP unico del Lab
  infra/                # hub, incubator, SO, explorer, …
  incubation/           # candidate
  diritto-legge/        # domini = raggruppamento umano
  economia-finanza/
  investimenti-territorio/
  pubblica-amministrazione/
  _local/               # gitignored — mai nel setup pubblico
```

Il contratto vive solo in hub (`workspace/workspace.toml`): `ws.py` lo
legge da lì se non c'è una copia alla root. I tool **non** hardcodano i
nomi dei dominii: puoi riorganizzare le cartelle senza romperlo.

## Repo privati

I repo privati dell’org **non stanno nel contratto** e non fanno parte di
`make setup` / `make clone-core` / `make doctor`. Se ti servono, clonali a mano
(e hai bisogno dei permessi GitHub giusti). Il setup pubblico resta riproducibile
per chiunque.

## Aggiungere un progetto

1. Riga in `workspace.toml` sotto `[domains.<cartella>]`
2. `make clone SLUG=<slug>` (o clone manuale nella path dichiarata)
3. Se è Python con install speciale: campo `install`

## Contributore esterno

Per un singolo progetto dataset **non serve** il workspace pieno:

```bash
git clone https://github.com/dataciviclab/<repo>.git
cd <repo>
make setup && make check   # se il repo ha il Makefile standard
```

Il workspace pieno serve a chi lavora cross-repo o sul core (toolkit, incubator, …).
Guida: `docs/local-setup.md`.

## Windows

Consigliato **WSL**. Make + bash sono lo standard dei repo del Lab.
