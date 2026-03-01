# Dataset Lifecycle

Ogni dataset repo segue fasi da `00` a `10`. Non si avanza di fase senza superare lo stage gate.

| Fase | Nome | Stage gate | Output pubblico richiesto |
| --- | --- | --- | --- |
| `00` | Intake | domanda civica formulata in una frase | problema, perche conta |
| `01` | Source scan | almeno una fonte ufficiale verificata | elenco fonti e limiti noti |
| `02` | Scope | unita di analisi, periodo e confini decisi | domande, metriche candidate, ipotesi |
| `03` | Repo bootstrap | struttura repo pronta e naming coerente | overview del progetto |
| `04` | RAW ready | acquisizione ripetibile e provenance tracciata | fonte, data accesso, copertura |
| `05` | CLEAN ready | regole di pulizia documentate e testate | dizionario campi essenziali, limiti |
| `06` | MART ready | metriche e tavole finali allineate alla domanda | metriche finali e loro definizione |
| `07` | Validation | controlli minimi verdi o eccezioni motivate | nota di qualita o limiti aperti |
| `08` | Docs | README e metodo comprensibili da pubblico non tecnico | overview, metodo, caveat |
| `09` | Release candidate | changelog pronto e public readiness check passato | note di release |
| `10` | Public release | versione pubblicata e referenziabile | pagina pubblica aggiornata |

## Regola di passaggio

Si passa alla fase successiva solo se:

- l'output della fase corrente esiste in forma leggibile;
- il reviewer riesce a ricostruire cosa e cambiato;
- i blocchi aperti sono espliciti, non impliciti.

## Regola pratica

Se una fase non produce un artefatto pubblico o verificabile, la fase non e chiusa.
