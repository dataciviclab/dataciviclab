# 🧰 Playbook Maintainer

Questa guida serve a chi apre e accompagna un nuovo progetto nel Lab.

Il maintainer non è la persona che controlla tutto.
È la persona che tiene il percorso leggibile, aiuta il progetto a partire bene e fa in modo che il lavoro resti chiaro nel tempo.

## 1. Far emergere la proposta

La proposta nasce in pubblico, di norma su GitHub Discussions.

La domanda iniziale deve essere:
- chiara
- concreta
- spiegabile in una frase

## 2. Verificare il perimetro

Prima di aprire un nuovo repo, controlla che:
- esistano dati pubblici difendibili
- il progetto abbia un'utilità civica chiara
- il perimetro sia abbastanza piccolo da poter partire bene

## 3. Creare il repo progetto

Se la proposta regge:
- crea il repo dal `project-template`
- configura i file minimi del progetto
- collega il repo alla [Open Board](https://github.com/orgs/dataciviclab/projects/5)
- collegalo anche alla [Roadmap](https://github.com/orgs/dataciviclab/projects/2) se ha rilevanza di milestone o direzione

## 4. Avviare il lavoro

All'inizio servono poche cose:
- domanda civica chiara
- dati iniziali identificati
- issue principali aperte
- stato del progetto leggibile

Se serve mantenere un piccolo buffer di issue di ingresso o di coordinamento:
- usa il catalogo locale in `.github/seed_issues/`
- il workflow `seed-issues.yml` mantiene automaticamente gli slot mancanti
- mantieni pochi slot aperti
- non usare le seed issue per simulare lavoro di progetto che ancora non esiste

## 4a. Tenere leggibili gli ingressi nel Lab

Il catalogo seed issue serve a tenere due corsie di ingresso semplici:

- `good first issue`
- `core-team`

Regola pratica:

- massimo `5` issue aperte con label `good first issue`
- massimo `5` issue aperte con label `core-team`

Il maintainer deve usare queste issue come buffer controllato, non come backlog generico.

Le seed issue `good first issue` servono soprattutto a contributor leggeri:

- docs
- verifiche fonti
- sintesi
- note metodologiche piccole

Le seed issue `core-team` servono a contributor con piu responsabilita:

- review di filone
- passaggio Discussion -> issue
- promozione preanalysis -> progetto
- definizione del prossimo output
- debiti espliciti da tenere sotto controllo

Quando apre una seed issue, il maintainer deve ancorarla a un target reale del momento, non lasciarla generica se il contesto del Lab richiede una scelta esplicita.

## 5. Collegare l'output pubblico

Quando il progetto inizia a produrre materiali pubblici:
- collega il repo al suo archivio pubblico
- tieni aggiornato il progetto nella Open Board
- rendi visibile dove trovare i risultati

## 6. Tenere il progetto leggibile

Il compito del maintainer non è fare tutto.
È fare in modo che chi arriva capisca:
- a che punto siamo
- cosa stiamo costruendo
- dove serve aiuto
