# Terna mix elettrico per fonte 2020-2024

## Domanda principale

Il mix elettrico italiano si sta spostando dalle fonti fossili?

## Perché conta

- rende leggibile un tema spesso discusso in modo generico o solo annuale
- permette di distinguere tra riequilibri più strutturali e rimbalzi legati a un singolo anno
- offre un primo ingresso pubblico al filone energia del Lab con una serie breve ma già interpretabile

Issue collegata: [#133](https://github.com/dataciviclab/dataciviclab/issues/133)

Discussion collegata: [#115](https://github.com/orgs/dataciviclab/discussions/115)

## Dataset

- fonte principale: export XLSX pubblico Terna `ElectricityBySource`
- copertura temporale in analisi: dicembre `2020-2024`
- granularità di base: provincia / fonte / tipo produzione
- limiti noti:
  - il perimetro resta volutamente breve e non copre ancora una serie lunga pluriennale
  - il `2025` oggi risulta incompleto e resta fuori dal caso
  - il primo output pubblico resta a livello regionale, non provinciale

## Output minimo atteso

- `mart_mix_regioni` con quota del mix regionale per fonte su produzione netta
- notebook pubblico `notebooks/terna_electricity_by_source_preanalysis_v1.ipynb`
- primo output pubblico centrato su:
  - pattern nazionale `2020-2024`
  - ruolo distinto di fotovoltaico e idroelettrico
  - profili regionali minimi del riequilibrio

## Stato

- `active`
- `run all` verificato su `2020`, `2021`, `2022`, `2023`, `2024`
- mart minimo disponibile
- notebook `v1` pronto
- check `Netta` vs `Lorda` verificato nel perimetro osservato

## Contratto tecnico

Il contratto tecnico (dataset.yml, SQL, pipeline) vive in dataset-incubator:
[candidates/terna-electricity-by-source](https://github.com/dataciviclab/dataset-incubator/tree/main/candidates/terna-electricity-by-source)

## Provenienza

Il filone è nato come candidato in `dataset-incubator` ed è stato promosso qui come preanalysis nel vecchio modello autosufficiente. Oggi il riferimento tecnico resta in `dataset-incubator`, mentre `dataciviclab` tiene il layer pubblico di lettura e notebook.

## Decisione attesa al checkpoint

- confermare che il `v1` risponda già in modo difendibile alla domanda pubblica
- decidere se la serie breve `2020-2024` basta per il primo output oppure se serva estensione ulteriore
- valutare se il filone debba restare in `preanalysis` o avvicinarsi a una repo dedicata
