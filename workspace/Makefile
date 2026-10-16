# DataCivicLab — interfaccia workspace (contratto: workspace.toml)
#
# ROOT MAKEFILE — una di queste due, alla root del workspace:
#   a) forwarder (consigliato, zero drift — si aggiorna con l'hub):
#        printf 'include infra/dataciviclab/workspace/Makefile\n' > Makefile
#   b) copia (solo se non puoi usare include):
#        cp infra/dataciviclab/workspace/Makefile .
#
# Il contratto path/ruoli è workspace.toml (sorgente unica, letta dall'hub
# se non c'è una copia alla root). Nessuna logica path hardcodata.

SHELL := /bin/bash
.DEFAULT_GOAL := help

# Path: root workspace (forwarder), root workspace con hub clonato, oppure
# da dentro l'hub (make -f workspace/Makefile …).
WS_PY := $(firstword $(wildcard ./ws.py) $(wildcard infra/dataciviclab/workspace/ws.py) $(wildcard workspace/ws.py))
CONTRACT := $(firstword $(wildcard ./workspace.toml) $(wildcard infra/dataciviclab/workspace/workspace.toml) $(wildcard workspace/workspace.toml))
VENV := .venv
VENV_PY := $(CURDIR)/$(VENV)/bin/python
PY := $(if $(wildcard $(VENV)/bin/python),$(VENV_PY),python3)
WS := WS_ROOT=$(CURDIR) $(PY) $(WS_PY) --contract $(CONTRACT)

# Install: uv se presente, altrimenti pip del venv — stessa destinazione
# (.venv), nessun --system: un solo python per tutto il workspace.
UV := $(shell command -v uv 2>/dev/null)
PIP := $(if $(UV),$(UV) pip install --python $(VENV_PY),$(VENV_PY) -m pip install)

# Repo del contratto presenti in locale e con pyproject (dev-loop)
CONTRACT_PATHS := $(shell $(WS) print-paths 2>/dev/null)
PY_REPOS := $(foreach r,$(CONTRACT_PATHS),$(if $(wildcard $(r)/pyproject.toml),$(r)))

.PHONY: help setup install clone clone-core list status doctor check env mcp \
        contributor test lint lint-fix info clean clean-venv

help:
	@echo "DataCivicLab workspace"
	@echo ""
	@echo "  — lifecycle —"
	@echo "  make setup          venv + install repo core/essential dal contratto"
	@echo "  make clone-core     clona core + infra essenziali se mancano"
	@echo "  make clone SLUG=x   clona un repo dati (es. SLUG=open-siope)"
	@echo "  make list           elenca repo nel contratto"
	@echo "  make status         cosa è clonato / cosa manca"
	@echo "  make doctor         valida layout vs workspace.toml"
	@echo "  make check          smoke: toolkit nel venv"
	@echo "  make env            .env.example → .env se manca"
	@echo "  make mcp            genera .mcp.json dal template hub"
	@echo "  make contributor    stampa fork/upstream per i repo presenti"
	@echo ""
	@echo "  — dev loop (repo del contratto presenti in locale) —"
	@echo "  make test           pytest in tutti i repo con tests/"
	@echo "  make lint           ruff check in tutti i repo Python"
	@echo "  make lint-fix       ruff check --fix"
	@echo "  make info           riepilogo workspace"
	@echo "  make clean          pulisce cache Python"
	@echo ""
	@echo "  Contratto: $(CONTRACT)"
	@echo "  Root:      $(CURDIR)"

# ── lifecycle ────────────────────────────────────────────────────────────────

setup: env
	@echo "🐍 Creo .venv se manca..."
	@test -d $(VENV) || python3 -m venv $(VENV)
	@echo "📦 Install editable (ordine dal contratto)..."
	@$(WS) print-installs | while IFS=$$'\t' read -r path spec; do \
		if [ -d "$$path" ]; then \
			echo "  → $$path ($$spec)"; \
			$(PIP) -q -e "$$spec" || exit 1; \
		else \
			echo "  ⚠️  $$path assente — salto (make clone-core?)"; \
		fi; \
	done
	@# ripristina lab-connectors editable (pin git lo sovrascrive spesso)
	@if [ -d lab-connectors ]; then \
		echo "  → ripristino lab-connectors editable"; \
		$(PIP) -q --no-deps -e lab-connectors; \
	fi
	@echo ""
	@echo "✅ setup fatto. Poi: make check && make doctor"

install: setup

clone-core:
	@$(WS) clone --core

clone:
	@test -n "$(SLUG)" || { echo "Uso: make clone SLUG=open-siope"; exit 1; }
	@$(WS) clone --slug "$(SLUG)"

list:
	@$(WS) list

status:
	@$(WS) status

doctor:
	@$(WS) doctor

check:
	@echo "🔍 Smoke check..."
	@test -x $(VENV_PY) || { echo "❌ .venv mancante — make setup"; exit 1; }
	@if [ -x $(VENV)/bin/toolkit ]; then \
		$(VENV)/bin/toolkit --help >/dev/null && echo "  ✅ toolkit ok"; \
	else \
		echo "  ⚠️  toolkit non nel PATH del venv (make setup dopo clone-core?)"; \
	fi
	@$(WS) doctor || true

env:
	@if [ -f .env ]; then \
		echo ".env già presente"; \
	elif [ -f infra/dataciviclab/.env.example ]; then \
		cp infra/dataciviclab/.env.example .env; \
		echo ".env creato da infra/dataciviclab/.env.example — compila GITHUB_TOKEN"; \
	elif [ -f .env.example ]; then \
		cp .env.example .env; \
		echo ".env creato da .env.example"; \
	else \
		echo "⚠️  .env.example non trovato"; \
	fi

mcp:
	@if [ -f .mcp.json ]; then \
		echo ".mcp.json già presente"; \
	elif [ -f infra/dataciviclab/scripts/mcp-servers.json ]; then \
		sed "s|__WORKSPACE__|$(CURDIR)|g" infra/dataciviclab/scripts/mcp-servers.json > .mcp.json; \
		echo ".mcp.json generato da infra/dataciviclab/scripts/mcp-servers.json"; \
	else \
		echo "⚠️  template MCP non trovato"; \
	fi

contributor:
	@echo "Fork + upstream per i repo già clonati (solo origin/https):"
	@echo ""
	@for path in $$( $(WS) list | awk '$$1==" "||$$1=="*"||$$1=="P" {print $$3}' ); do \
		dir="$$path"; \
		if [ -d "$$dir/.git" ]; then \
			remote=$$(git -C "$$dir" remote get-url origin 2>/dev/null || true); \
			case "$$remote" in \
				*dataciviclab*) \
					slug=$$(basename "$$dir"); \
					echo "● $$dir"; \
					echo "  gh repo fork dataciviclab/$$slug --clone=false"; \
					echo "  git -C $$dir remote set-url origin git@github.com:{TUO}/$$slug.git"; \
					echo "  git -C $$dir remote add upstream https://github.com/dataciviclab/$$slug.git"; \
					echo "" ;; \
			esac; \
		fi; \
	done

clean-venv:
	@rm -rf $(VENV)
	@echo "🗑️  .venv rimosso — make setup per ricreare"

# ── dev loop (spec-driven: solo repo del contratto presenti in locale) ───────

install-dev: $(foreach r,$(PY_REPOS),install-dev-$(r))

install-dev-%:
	@if [ -d "$*" ]; then \
		echo "  → $*"; \
		$(PIP) -q -e "$*[dev]" || $(PIP) -q -e "$*" || exit 1; \
	fi

test: $(foreach r,$(PY_REPOS),test-$(r))

test-%:
	@if [ -d "$*/tests" ]; then \
		echo "▶ pytest $*"; \
		(cd "$*" && $(VENV_PY) -m pytest -q -m "not smoke") || exit 1; \
	fi

lint: $(foreach r,$(PY_REPOS),lint-$(r))

lint-fix: $(foreach r,$(PY_REPOS),lint-fix-$(r))

lint-%:
	@if [ -d "$*" ] && [ -x $(VENV)/bin/ruff ]; then \
		echo "▶ ruff $*"; \
		(cd "$*" && $(VENV)/bin/ruff check .) || exit 1; \
	fi

lint-fix-%:
	@if [ -d "$*" ] && [ -x $(VENV)/bin/ruff ]; then \
		echo "▶ ruff --fix $*"; \
		(cd "$*" && $(VENV)/bin/ruff check --fix .) || exit 1; \
	fi

info:
	@echo "Workspace: $(CURDIR)"
	@echo "Contratto: $(CONTRACT)"
	@echo "Repo Python dal contratto presenti: $(words $(PY_REPOS))"
	@$(WS) status
	@echo ""
	@echo "MCP: make mcp (template hub → .mcp.json)"

clean:
	@find . -type d -name __pycache__ -not -path "./.venv/*" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .pytest_cache -not -path "./.venv/*" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .ruff_cache -not -path "./.venv/*" -exec rm -rf {} + 2>/dev/null || true
	@echo "🧹 Cache rimosse"
