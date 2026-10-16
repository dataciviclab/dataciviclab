# DataCivicLab — Makefile
#
# Comandi:
#   make bootstrap   — setup workspace (clone repo mancanti, installa deps)
#   make info        — stato workspace
#   make test        — esegui test di tutti i repo
#   make lint        — ruff check su tutti i repo

SHELL := /bin/bash
.ONESHELL:
.PHONY: bootstrap info test lint

# Root della repo dataciviclab (funziona anche via symlink dal workspace)
ROOT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
VENV := $(ROOT_DIR).venv
PYTHON := $(VENV)/bin/python

bootstrap:
	@echo "✗ scripts/setup.sh è deprecato (path storici morti)."
	@echo ""
	@echo "Setup workspace — dalla ROOT del workspace:"
	@echo "  printf 'include infra/dataciviclab/workspace/Makefile\\n' > Makefile"
	@echo "  make clone-core && make setup && make check"
	@echo ""
	@echo "Guida: docs/local-setup.md — Contratto: workspace/workspace.toml"
	@exit 1

info:
	@echo "=============================================="
	@echo "  DataCivicLab — Workspace Info"
	@echo "=============================================="
	@$(PYTHON) --version 2>/dev/null || echo "  .venv non attivo (source .venv/bin/activate)"
	@echo ""
	@echo "Repo presenti:"
	@for d in */; do if [ -f "$$d/.git/HEAD" ]; then echo "  $$d"; fi; done

test:
	@echo "Test del sito: npm test"

lint:
	@echo "Lint sito: npx astro check"
