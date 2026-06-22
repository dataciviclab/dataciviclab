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
	bash $(ROOT_DIR)scripts/setup.sh --workspace

info:
	@echo "=============================================="
	@echo "  DataCivicLab — Workspace Info"
	@echo "=============================================="
	@$(PYTHON) --version 2>/dev/null || echo "  .venv non attivo (source .venv/bin/activate)"
	@echo ""
	@echo "Repo presenti:"
	@for d in */; do if [ -f "$$d/.git/HEAD" ]; then echo "  $$d"; fi; done

test:
	@echo "Esegui: make test-toolkit | make test-di | make test-so | ..."

lint:
	@echo "Esegui: cd {repo} && ruff check ."
