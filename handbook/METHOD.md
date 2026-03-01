# Method

Il metodo standard del Lab segue tre layer: RAW -> CLEAN -> MART.
Ogni passaggio deve essere tracciabile, ripetibile e comprensibile.

| Layer | Scopo | Contenuto ammesso | Non deve contenere |
| --- | --- | --- | --- |
| `RAW` | Conservare il dato come ricevuto | file sorgente, metadata di acquisizione, checksum, note di provenienza | fix manuali non tracciati, colonne rinominate, join impliciti |
| `CLEAN` | Rendere il dato analizzabile | tipizzazione, normalizzazioni, dedupliche, mapping espliciti, controlli base | aggregazioni finali non motivate, logica di business opaca |
| `MART` | Servire domande e metriche pubbliche | tabelle finali, KPI, viste per dashboard o analisi | trasformazioni non documentate, colonne inutilizzate, calcoli impossibili da ricostruire |

## Regole base

- Portabilita: script, query e documentazione devono funzionare senza riferimenti locali o assoluti di macchina.
- Determinismo: a input uguali deve corrispondere output uguale, salvo eccezioni dichiarate.
- Tracciabilita: ogni passaggio deve indicare fonte, regola e risultato atteso.
- No output committato: non si committano output derivati rigenerabili, salvo release artefacts dichiarati.
- Minimo necessario: ogni layer contiene solo cio che serve al layer stesso.
- Public-first: le trasformazioni devono poter essere spiegate in linguaggio semplice.
