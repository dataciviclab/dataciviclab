#!/usr/bin/env bash
# DEPRECATO — setup.sh legacy.
#
# Path storici (analysis/, incubation/) non corrispondono più al layout
# del workspace (infra/, dominii a tema).
#
# Usa invece:
#   docs/local-setup.md
#   make setup / make clone-core   (da workspace/ copiato alla root)
#
# Dettaglio contratto: workspace/README.md
set -euo pipefail

cat <<'EOF'
✗ scripts/setup.sh è deprecato.

  I path in questo script (analysis/, incubation/) non esistono più:
  il workspace usa infra/ e cartelle per dominio (diritto-legge/, …).

  Setup attuale:
    1. git clone https://github.com/dataciviclab/dataciviclab.git infra/dataciviclab
    2. cp infra/dataciviclab/workspace/{Makefile,workspace.toml,ws.py} .
    3. make clone-core && make setup && make doctor

  Guida: docs/local-setup.md
  Contratto: workspace/README.md

  Per un singolo progetto dataset non serve il workspace:
    git clone https://github.com/dataciviclab/<repo>.git
EOF
exit 1
