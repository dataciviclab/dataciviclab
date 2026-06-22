#!/usr/bin/env bash
# DataCivicLab — Setup workspace in un comando
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/dataciviclab/dataciviclab/main/scripts/setup.sh | bash
#   curl -fsSL ... | bash -s -- --contributor
#
#   # Se hai già il workspace:
#   make bootstrap          # dal workspace root
#   bash dataciviclab/scripts/setup.sh --workspace   # da qualsiasi path
#
# Cosa fa:
#   1. Crea dataciviclab-workspace/ (se non esiste)
#   2. Clona tutti i repo pubblici del Lab (se mancano)
#   3. Crea .venv e installa dipendenze
#   4. Copia .env.example in .env (se manca)
#   5. Stampa next-steps

set -euo pipefail

# ─── Config ─────────────────────────────────────────────────────────
REPOS_CORE=(
  "dataciviclab/dataciviclab"
  "dataciviclab/toolkit"
  "dataciviclab/dataset-incubator"
  "dataciviclab/source-observatory"
  "dataciviclab/lab-connectors"
  "dataciviclab/agent-context-builder"
  "dataciviclab/data-explorer"
)

REPOS_OPTIONAL=(
  "dataciviclab/open-siope"
  "dataciviclab/eurostat"
  "dataciviclab/italia-corpus"
  "dataciviclab/senato-akn"
  "dataciviclab/lab-dashboard"
  "dataciviclab/progetto-pilota"
  "dataciviclab/openbdap-saldi-storico-stato"
)

REPOS_PRIVATE=(
  "dataciviclab/lab-ops"
  "dataciviclab/data-advocacy"
  "dataciviclab/lab-ask"
)

WORKSPACE_NAME="dataciviclab-workspace"
GIT_BASE="git@github.com:"
GH_BASE="https://github.com/"
BRANCH="main"

# Colori
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

log_info()  { echo -e "${GREEN}✓${NC} $1"; }
log_step()  { echo -e "${CYAN}→${NC} $1"; }
log_warn()  { echo -e "${YELLOW}⚠${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }

# ─── Help ────────────────────────────────────────────────────────────

usage() {
  cat <<USAGE
DataCivicLab — Setup workspace

Usage:
  $(basename "$0")              Fresh install (crea workspace, clona, installa)
  $(basename "$0") --workspace  Già nel workspace: installa/aggiorna dipendenze
  $(basename "$0") --contributor Come fresh install + istruzioni fork
  $(basename "$0") --help       Mostra questo help
USAGE
  exit 0
}

# ─── Parse args ──────────────────────────────────────────────────────

MODE="fresh"
for arg in "$@"; do
  case "$arg" in
    --workspace) MODE="workspace" ;;
    --contributor) MODE="contributor" ;;
    --help) usage ;;
  esac
done

# ─── Utility ─────────────────────────────────────────────────────────

check_command() {
  if ! command -v "$1" &>/dev/null; then
    log_error "$1 non trovato. Installa $1 e riprova."
    exit 1
  fi
}

clone_or_skip() {
  local repo="$1"
  local dir
  dir=$(basename "$repo")

  if [ -d "$dir/.git" ]; then
    log_info "$dir già presente"
    return 0
  fi

  log_step "Clone $repo..."
  if git clone "${GIT_BASE}${repo}.git" "$dir" 2>/dev/null; then
    log_info "$dir clonato"
  else
    log_warn "Impossibile clonare $repo (repo privato o non accessibile?)"
    return 1
  fi
}

create_venv() {
  if [ -d ".venv" ]; then
    log_info ".venv già presente"
    return 0
  fi
  log_step "Creazione .venv..."
  python3 -m venv .venv
  log_info ".venv creato"
}

install_packages() {
  log_step "Attivazione .venv e installazione pacchetti..."
  source .venv/bin/activate

  # lab-connectors per primo (dipendenza di tutti)
  if [ -d "lab-connectors" ]; then
    log_step "lab-connectors..."
    pip install -q -e lab-connectors
  fi

  # toolkit
  if [ -d "toolkit" ]; then
    log_step "toolkit..."
    pip install -q -e "toolkit[parquet,dev]"
  fi

  # agent-context-builder
  if [ -d "agent-context-builder" ]; then
    log_step "agent-context-builder..."
    pip install -q --no-deps -e "agent-context-builder[mcp,dev]"
  fi

  # dataset-incubator
  if [ -d "dataset-incubator" ]; then
    log_step "dataset-incubator..."
    pip install -q --no-deps -e "dataset-incubator[dev]"
  fi

  # source-observatory
  if [ -d "source-observatory" ]; then
    log_step "source-observatory..."
    pip install -q --no-deps -e "source-observatory[dev]"
  fi

  # ripristino lab-connectors (git pin lo sovrascrive)
  if [ -d "lab-connectors" ]; then
    pip install -q --no-deps -e lab-connectors
  fi

  log_info "Dipendenze installate"
}

copy_env() {
  if [ -f ".env" ]; then
    log_info ".env già presente"
    return 0
  fi
  if [ -f "dataciviclab/.env.example" ]; then
    cp "dataciviclab/.env.example" ".env"
    log_info ".env creato da .env.example — modificalo con i tuoi token"
  else
    log_warn ".env.example non trovato"
  fi
}

print_next_steps() {
  echo ""
  echo -e "${GREEN}==============================================${NC}"
  echo -e "${GREEN}  DataCivicLab — Workspace pronto!${NC}"
  echo -e "${GREEN}==============================================${NC}"
  echo ""
  echo "  Prossimi passi:"
  echo ""
  echo "  ${CYAN}1.${NC} Attiva l'ambiente virtuale:"
  echo "     source .venv/bin/activate"
  echo ""
  echo "  ${CYAN}2.${NC} Modifica .env con i tuoi token:"
  echo "     ${YELLOW}GITHUB_TOKEN${NC} è l'unico obbligatorio"
  echo ""
  echo "  ${CYAN}3.${NC} Verifica lo stato:"
  echo "     make info"
  echo ""
  echo "  ${CYAN}4.${NC} Prova una pipeline:"
  echo "     make test"
  echo ""
}

print_contributor_steps() {
  echo ""
  echo -e "${YELLOW}──────────────────────────────────────────────────${NC}"
  echo -e "${YELLOW}  Modalità CONTRIBUTOR${NC}"
  echo -e "${YELLOW}──────────────────────────────────────────────────${NC}"
  echo ""
  echo "  Vuoi contribuire? Converti i clone in fork:"
  echo ""
  for repo in "${REPOS_CORE[@]}" "${REPOS_OPTIONAL[@]}"; do
    local dir
    dir=$(basename "$repo")
    if [ -d "$dir/.git" ]; then
      echo "  ${CYAN}●${NC} $dir"
      echo "    gh repo fork $repo --clone=false"
      echo "    cd $dir && git remote set-url origin git@github.com:{TUO}/${dir}.git"
      echo "    git remote add upstream ${GIT_BASE}${repo}.git"
      echo "    cd .."
      echo ""
    fi
  done
  echo ""
  log_warn "Repo privati non forkabili: ${REPOS_PRIVATE[*]}"
  echo "  Contatta il team se ti servono."
  echo ""
}

print_make_bootstrap_instructions() {
  # Stampa il target make bootstrap se non è già nel Makefile
  local makefile="Makefile"
  if [ -f "$makefile" ] && grep -q "^bootstrap:" "$makefile" 2>/dev/null; then
    return 0  # già presente
  fi
  echo ""
  echo -e "${YELLOW}Suggerimento:${NC} Aggiungi al tuo Makefile:"
  echo ""
  echo "  bootstrap:"
  echo "	bash dataciviclab/scripts/setup.sh --workspace"
  echo ""
}

# ─── Modalità: workspace ─────────────────────────────────────────────

workspace_mode() {
  echo -e "${CYAN}DataCivicLab — Bootstrap workspace${NC}"
  echo ""

  # Verifica di essere in un workspace valido
  if [ ! -d "dataciviclab" ]; then
    log_error "Non sembri essere in un workspace DataCivicLab (manca dataciviclab/)"
    echo "  Sei nella directory giusta? Dovrebbe contenere dataciviclab/, toolkit/, ..."
    echo "  Altrimenti usa: $(basename "$0") (senza flag) per una fresh install"
    exit 1
  fi

  # Clona repo mancanti
  echo -e "${CYAN}📦 Repo${NC}"
  for repo in "${REPOS_CORE[@]}"; do
    clone_or_skip "$repo"
  done

  echo ""
  echo -e "${CYAN}Optional...${NC}"
  for repo in "${REPOS_OPTIONAL[@]}"; do
    clone_or_skip "$repo" || true
  done

  echo ""
  echo -e "${CYAN}🔧 Ambiente Python${NC}"
  create_venv
  install_packages
  copy_env

  echo ""
  echo -e "${CYAN}✅ Verifica${NC}"
  if [ -d "toolkit" ]; then
    # shellcheck disable=SC1091
    source .venv/bin/activate 2>/dev/null || true
    if command -v toolkit &>/dev/null; then
      echo "   toolkit disponibile — usa: toolkit --help"
    else
      log_warn "toolkit non trovato nel PATH (riprova con: make bootstrap)"
    fi
  fi

  print_next_steps
}

# ─── Modalità: fresh install ─────────────────────────────────────────

fresh_mode() {
  echo -e "${CYAN}DataCivicLab — Fresh install${NC}"
  echo ""

  # Crea workspace directory
  if [ ! -d "$WORKSPACE_NAME" ]; then
    mkdir -p "$WORKSPACE_NAME"
    log_info "$WORKSPACE_NAME/ creata"
  else
    log_info "$WORKSPACE_NAME/ già esiste"
  fi

  cd "$WORKSPACE_NAME"

  # Verifica git
  check_command git
  check_command python3

  # Clona repo
  echo ""
  echo -e "${CYAN}📦 Clonazione repo core...${NC}"
  for repo in "${REPOS_CORE[@]}"; do
    clone_or_skip "$repo"
  done

  echo ""
  echo -e "${CYAN}📦 Clonazione repo opzionali...${NC}"
  for repo in "${REPOS_OPTIONAL[@]}"; do
    clone_or_skip "$repo" || true
  done

  echo ""
  echo -e "${CYAN}🔧 Ambiente Python${NC}"
  create_venv
  install_packages
  copy_env

  # Scrivi Makefile se mancante
  if [ ! -f "Makefile" ]; then
    cat > Makefile << 'MAKEFILE'
# DataCivicLab — Makefile del workspace
#
# Comandi:
#   make info        — stato workspace
#   make test        — esegui test
#   make lint        — ruff check
#   make bootstrap   — aggiorna workspace (clone mancanti, reinstalla)

SHELL := /bin/bash
.ONESHELL:
.PHONY: bootstrap info test lint

VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

bootstrap:
	bash dataciviclab/scripts/setup.sh --workspace

info:
	@echo "=============================================="
	@echo "  DataCivicLab — Workspace Info"
	@echo "=============================================="
	@$(PYTHON) --version 2>/dev/null || echo "  .venv non attivo"
	@echo ""
	@echo "Repo presenti:"
	@for d in */; do if [ -f "$$d/.git/HEAD" ]; then echo "  $$d"; fi; done

test:
	@echo "Usa: make test-toolkit | make test-di | ..."
	@echo "Oppure: bash dataciviclab/scripts/setup.sh --workspace"

lint:
	@echo "Usa: cd {repo} && ruff check ."
MAKEFILE
    log_info "Makefile creato"
  fi

  print_next_steps

  if [ "$MODE" = "contributor" ]; then
    print_contributor_steps
  fi

  echo ""
  log_info "Ora entra nel workspace:"
  echo "  cd $WORKSPACE_NAME"
  echo "  source .venv/bin/activate"
}

# ─── Entry point ─────────────────────────────────────────────────────

# Se siamo già in un workspace (rileva dataciviclab/), workspace mode
if [ "$MODE" = "workspace" ]; then
  workspace_mode
elif [ "$MODE" = "fresh" ] && [ -d "dataciviclab" ] && [ -d "toolkit" ]; then
  # Eseguito da dentro un workspace già esistente
  workspace_mode
else
  fresh_mode
fi
