# Naming Conventions

## Regole base

- usa `snake_case` per file, colonne, metriche e identificatori;
- usa nomi brevi ma specifici;
- evita abbreviazioni non ovvie nella parte pubblica.

## Keys e ID

- una chiave deve essere stabile, documentata e distinguibile da una label;
- preferisci suffissi espliciti come `*_id`, `*_code`, `*_name`;
- se una chiave non e unica, non chiamarla primary key.

## Path

- usa path POSIX root-relative nella documentazione, ad esempio `docs/overview.md`;
- non usare path locali di macchina;
- mantieni cartelle e file coerenti con il layer a cui appartengono.

## File SQL e docs

- query o modelli SQL: `create_<entity>.sql`, `build_<mart>.sql`, `test_<rule>.sql`;
- documenti: `overview.md`, `method.md`, `validation.md`, `changelog.md`;
- evita file con significato ambiguo come `final.sql` o `new_notes.md`.
