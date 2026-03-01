# Release Policy

## Significato delle versioni

- `v0.1`: primo output pubblico utile ma ancora incompleto o instabile. Metodo presente, limiti ancora sostanziali.
- `v1.0`: dataset e documentazione abbastanza stabili da sostenere uso pubblico ripetuto. Domanda, metriche e limiti sono chiari.

## Cosa entra nelle release notes

- cosa e stato aggiunto o corretto;
- cambiamenti a metriche, campi o copertura;
- limiti ancora aperti;
- eventuali breaking changes per chi riusa i dati.

## Public readiness check

Prima di una release pubblica chiedersi:

- una persona esterna capisce in 60 secondi cosa misura il dataset?
- le metriche principali sono definibili in una frase?
- i limiti piu importanti sono visibili senza scavare?
- la versione e difendibile pubblicamente senza spiegazioni private?

Se una risposta e no, la release resta candidata e non pubblica.
