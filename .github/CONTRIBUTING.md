# Come contribuire

Benvenuto nel DataCivicLab.
Questa guida spiega come iniziare a contribuire, passo per passo.

---

## 1. Scegli una issue

Vai alla board del progetto e cerca una issue con il tag `good first issue` o `help wanted`.

Prima di iniziare:
- leggi la descrizione per intero
- controlla che non sia già assegnata
- lascia un commento per segnalare che la prendi in carico

> Se hai un'idea che non esiste ancora come issue, aprila tu prima di lavorarci.

---

## 2. Apri una issue (se non esiste)

Vai su **Issues → New issue**, scegli il template più adatto e compila:
- **Titolo** — descrittivo e specifico
- **Descrizione** — cosa manca, cosa non funziona, cosa vorresti aggiungere
- **Label** — aggiungi almeno una label (es. `docs`, `bug`, `enhancement`)

> Non aprire una PR senza una issue collegata.

---

## 3. Lavora su un branch

Non si lavora mai direttamente su `main`.

**Via GitHub UI**
1. Vai su **Code → branches**
2. Clicca **New branch**
3. Assegna il nome e assicurati di partire da `main`

**Via terminale**
```bash
git checkout -b fix/nome-problema
git checkout -b feat/nome-funzionalità
git checkout -b docs/nome-documento
```

Lavora sul branch, committa con messaggi chiari:
```bash
git commit -m "docs: aggiorna sezione ruoli nel README"
```

---

## 4. Apri una PR

Quando il lavoro è pronto, apri una Pull Request verso `main`.

Usa il template PR del progetto e compila tutti i campi:
- cosa fa la PR
- issue collegata
- tipo di cambiamento
- checklist

Una PR = una cosa sola. Se hai fatto più cose, apri più PR.

---

## 5. Chiedi una review

Assegna almeno un reviewer prima di marcare la PR come pronta.

Se nessuno risponde entro 48–72 ore, sollecita nel thread della PR o nelle Discussions.

Non fare merge autonomamente salvo accordi espliciti.

---

## Note finali

- Il metodo viene prima della velocità
- Se hai dubbi, chiedi prima di fare
- Ogni contributo lascia traccia pubblica: prenditi cura di quello che scrivi
