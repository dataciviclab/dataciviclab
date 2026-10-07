# DataCivicLab — interfaccia workspace
#
# INSTALL: copia questa cartella alla root del multi-repo workspace:
#   cp infra/dataciviclab/workspace/{Makefile,workspace.toml,ws.py} .
#   make help
#
# Il contratto path/ruoli è workspace.toml (sorgente unica).
# Questo Makefile è solo interfaccia: nessuna logica path hardcodata.

SHELL := /bin/bash
.DEFAULT_GOAL := help

WS_PY := $(if $(wildcard ./ws.py),./ws.py,infra/dataciviclab/workspace/ws.py)
CONTRACT := $(if $(wildcard ./workspace.toml),./workspace.toml,infra/dataciviclab/workspace/workspace.toml)
PY := $(if $(wildcard .venv/bin/python),.venv/bin/python,python3)
WS := WS_ROOT=$(CURDIR) $(PY) $(WS_PY) --contract $(CONTRACT)

.PHONY: help setup clone clone-core status doctor check env mcp contributor clean-venv list

help:
	@echo "DataCivicLab workspace"
	@echo ""
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
	@echo "  Contratto: $(CONTRACT)"
	@echo "  Root:      $(CURDIR)"

setup: env
	@echo "🐍 Creo .venv se manca..."
	@test -d .venv || python3 -m venv .venv
	@echo "📦 Install editable (ordine dal contratto)..."
	@$(WS) print-installs | while IFS=$$'\t' read -r path spec; do \
		if [ -d "$$path" ]; then \
			echo "  → $$path ($$spec)"; \
			.venv/bin/python -m pip install -q -e "$$spec" || exit 1; \
		else \
			echo "  ⚠️  $$path assente — salto (make clone-core?)"; \
		fi; \
	done
	@# ripristina lab-connectors editable (pin git lo sovrascrive spesso)
	@if [ -d lab-connectors ]; then \
		echo "  → ripristino lab-connectors editable"; \
		.venv/bin/python -m pip install -q --no-deps -e lab-connectors; \
	fi
	@echo ""
	@echo "✅ setup fatto. Poi: make check && make doctor"

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
	@test -x .venv/bin/python || { echo "❌ .venv mancante — make setup"; exit 1; }
	@if [ -x .venv/bin/toolkit ]; then \
		.venv/bin/toolkit --help >/dev/null && echo "  ✅ toolkit ok"; \
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
	@for d in $$(git ls-files -o -m --exclude-standard 2>/dev/null; find . -maxdepth 3 -type d -name .git 2>/dev/null | sed 's|/.git||'); do \
		true; \
	done; \
	for path in $$( $(WS) list | awk '$$1==" "||$$1=="*"||$$1=="P" {print $$3}' ); do \
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
	@rm -rf .venv
	@echo "🗑️  .venv rimosso — make setup per ricreare"
