#!/usr/bin/env python3
"""DataCivicLab workspace manager.

Legge workspace.toml (contratto path/ruoli) e implementa:
  list | path | clone | status | doctor | print-installs

Usato dal Makefile della cartella workspace/. Nessuna dipendenza oltre la stdlib.
"""

from __future__ import annotations

import argparse
import os
import subprocess
import sys
import tomllib
from pathlib import Path

ESSENTIAL_INSTALL_ORDER = (
    # lab-connectors prima di toolkit e degli altri (è dipendenza di tutti)
    "lab-connectors",
)


def find_contract(explicit: str | None) -> Path:
    candidates: list[Path] = []
    if explicit:
        candidates.append(Path(explicit))
    env = os.environ.get("WORKSPACE_TOML")
    if env:
        candidates.append(Path(env))
    root = Path(os.environ.get("WS_ROOT", ".")).resolve()
    candidates.extend(
        [
            root / "workspace.toml",
            root / "infra" / "dataciviclab" / "workspace" / "workspace.toml",
            Path(__file__).resolve().parent / "workspace.toml",
        ]
    )
    for c in candidates:
        if c.is_file():
            return c.resolve()
    raise SystemExit(
        "workspace.toml non trovato. Copia il contratto alla root del workspace:\n"
        "  cp infra/dataciviclab/workspace/{Makefile,workspace.toml,ws.py} .\n"
        "Oppure imposta WORKSPACE_TOML=/path/to/workspace.toml"
    )


def load(path: Path) -> dict:
    with path.open("rb") as f:
        return tomllib.load(f)


def iter_entries(data: dict):
    """Yield (group, slug, path, repo, private, install, essential)."""
    for group in ("core", "infra", "incubation"):
        for item in data.get(group, []) or []:
            path = item["path"]
            repo = item["repo"]
            slug = Path(path).name
            yield (
                group,
                slug,
                path,
                repo,
                bool(item.get("private", False)),
                item.get("install"),
                bool(item.get("essential", group == "core")),
            )

    domains = data.get("domains") or {}
    for domain, repos in domains.items():
        if not isinstance(repos, dict):
            continue
        for slug, spec in repos.items():
            if isinstance(spec, str):
                repo, private, install = spec, False, None
            elif isinstance(spec, dict):
                repo = spec.get("repo")
                if not repo:
                    continue
                private = bool(spec.get("private", False))
                install = spec.get("install")
            else:
                continue
            path = f"{domain}/{slug}"
            yield ("domain", slug, path, repo, private, install, False)


def find_entry(data: dict, slug: str):
    matches = [e for e in iter_entries(data) if e[1] == slug]
    if not matches:
        known = sorted({e[1] for e in iter_entries(data)})
        raise SystemExit(f"Slug sconosciuto: {slug}\nNoti: {', '.join(known)}")
    if len(matches) > 1:
        paths = ", ".join(m[2] for m in matches)
        raise SystemExit(f"Slug ambiguo: {slug} → {paths}. Usa il path con --path.")
    return matches[0]


def ws_root(contract: Path, data: dict) -> Path:
    env = os.environ.get("WS_ROOT")
    if env:
        return Path(env).resolve()
    # Se il contratto è dentro infra/dataciviclab/workspace, root = 3 livelli su
    parts = contract.parts
    if "workspace" in parts and "dataciviclab" in parts:
        idx = parts.index("dataciviclab")
        if idx >= 2 and parts[idx - 1] == "infra":
            return Path(*parts[: idx - 1]).resolve()
    return Path.cwd().resolve()


def item_is_python(data: dict, group: str, path: str) -> bool:
    """True se il repo è previsto come package Python installabile."""
    for item in data.get(group, []) or []:
        if item.get("path") == path:
            return bool(item.get("python", True))
    return True


def cmd_list(data: dict, args) -> int:
    for group, slug, path, repo, private, _install, essential in iter_entries(data):
        mark = "P" if private else ("*" if essential else " ")
        print(f"{mark} {group:12} {path:48} {repo}")
    return 0


def cmd_path(data: dict, args) -> int:
    _g, _s, path, *_ = find_entry(data, args.slug)
    print(path)
    return 0


def cmd_clone(data: dict, args) -> int:
    root = ws_root(find_contract(args.contract), data)
    git_base = data.get("workspace", {}).get("git_base", "https://github.com/")
    groups_filter = set(args.group.split(",")) if args.group else None

    entries = list(iter_entries(data))
    if args.core:
        entries = [e for e in entries if e[0] == "core" or (e[0] == "infra" and e[6])]
    elif args.slug:
        entries = [find_entry(data, args.slug)]
    elif groups_filter:
        entries = [
            e
            for e in entries
            if e[0] in groups_filter or (args.all and e[0] == "domain")
        ]

    cloned = skipped = failed = 0
    for _g, slug, path, repo, private, _i, _e in entries:
        dest = root / path
        if private:
            print(f"skip  {path} (privato — clona a mano se hai accesso)")
            skipped += 1
            continue
        if (dest / ".git").exists():
            print(f"ok    {path} già presente")
            skipped += 1
            continue
        dest.parent.mkdir(parents=True, exist_ok=True)
        url = f"{git_base}{repo}.git"
        print(f"clone {url} → {path}")
        r = subprocess.run(["git", "clone", url, str(dest)], cwd=root)
        if r.returncode != 0:
            print(f"FAIL  {path}")
            failed += 1
        else:
            cloned += 1
    print(f"\nclonati={cloned} saltati={skipped} falliti={failed}")
    return 1 if failed else 0


def cmd_status(data: dict, args) -> int:
    root = ws_root(find_contract(args.contract), data)
    print(f"workspace: {root}")
    print(f"contratto: {find_contract(args.contract)}")
    print()
    missing = []
    for group, slug, path, repo, private, _i, _e in iter_entries(data):
        dest = root / path
        if (dest / ".git").exists():
            try:
                branch = subprocess.check_output(
                    ["git", "rev-parse", "--abbrev-ref", "HEAD"],
                    cwd=dest,
                    text=True,
                    stderr=subprocess.DEVNULL,
                ).strip()
            except subprocess.CalledProcessError:
                branch = "?"
            dirty = subprocess.run(
                ["git", "status", "--porcelain"],
                cwd=dest,
                capture_output=True,
                text=True,
            )
            n = len([ln for ln in dirty.stdout.splitlines() if ln.strip()])
            flag = "D" if n else " "
            print(f" {flag} {path:48} {branch} ({n} file)")
        else:
            mark = "P" if private else " "
            print(f"{mark} {path:48} — mancante")
            if not private:
                missing.append(path)
    if missing:
        shown = ", ".join(missing[:8])
        if len(missing) > 8:
            shown += "…"
        print(f"\nMancanti ({len(missing)}): {shown}")
        print("  clone: make clone-core  |  make clone SLUG=<slug>")
    return 0


def cmd_doctor(data: dict, args) -> int:
    root = ws_root(find_contract(args.contract), data)
    errors: list[str] = []
    warnings: list[str] = []

    ws = data.get("workspace", {})
    if not ws.get("python"):
        warnings.append("workspace.python mancante")

    for group, slug, path, repo, private, install, essential in iter_entries(data):
        dest = root / path
        if private:
            if dest.exists():
                warnings.append(f"{path}: privato ma presente localmente")
            continue
        if not dest.exists():
            if essential or group == "core":
                errors.append(f"{path}: essenziale ma assente ({repo})")
            else:
                warnings.append(f"{path}: assente ({repo})")
            continue
        if not (dest / ".git").exists():
            warnings.append(f"{path}: esiste ma non è un clone git")
        if install and not (dest / "pyproject.toml").exists():
            errors.append(f"{path}: install={install} ma manca pyproject.toml")
        if group in ("core", "infra") and item_is_python(data, group, path):
            if not (dest / "pyproject.toml").exists():
                if essential:
                    warnings.append(f"{path}: nessun pyproject.toml (non installabile?)")

    venv = root / ws.get("venv", ".venv")
    if not venv.exists():
        warnings.append(f"{venv.name}/ mancante — esegui: make setup")
    else:
        py = venv / "bin" / "python"
        if not py.exists():
            errors.append(f"{py} mancante (venv corrotto?)")

    if not (root / ".env").exists():
        warnings.append(".env mancante — cp .env.example .env (GITHUB_TOKEN obbligatorio per MCP)")

    # Template MCP
    contract_dir = find_contract(args.contract).parent
    mcp_template = contract_dir.parent / "scripts" / "mcp-servers.json"
    if not mcp_template.exists():
        warnings.append(f"template MCP non trovato: {mcp_template}")
    if not (root / ".mcp.json").exists():
        warnings.append(".mcp.json non generato — make mcp")

    print(f"doctor — workspace: {root}")
    print(f"contratto: {find_contract(args.contract)}")
    print()
    for w in warnings:
        print(f"  WARN  {w}")
    for e in errors:
        print(f"  ERROR {e}")
    print()
    if errors:
        print(f"Risultato: {len(errors)} errori, {len(warnings)} warning")
        return 1
    print(f"Risultato: ok ({len(warnings)} warning)")
    return 0


def cmd_print_installs(data: dict, args) -> int:
    """Stampa gli install in ordine (per make setup)."""
    core = [e for e in iter_entries(data) if e[0] == "core"]
    infra = [
        e
        for e in iter_entries(data)
        if e[0] == "infra" and e[6] and e[5]  # essential + install
    ]
    # riordina: lab-connectors, toolkit, poi infra
    def key(e):
        slug = e[1]
        if slug == "lab-connectors":
            return (0, slug)
        if slug == "toolkit":
            return (1, slug)
        return (2, slug)

    ordered = sorted(
        [e for e in core if e[5]] + infra,
        key=key,
    )
    for _g, slug, path, _repo, _p, install, _e in ordered:
        if install:
            print(f"{path}\t{install}")
    return 0


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="DataCivicLab workspace manager")
    p.add_argument("--contract", help="path a workspace.toml")
    sub = p.add_subparsers(dest="cmd", required=True)

    sub.add_parser("list", help="elenca repo dal contratto")
    sp = sub.add_parser("path", help="stampa path di uno slug")
    sp.add_argument("slug")
    sc = sub.add_parser("clone", help="clona repo dal contratto")
    sc.add_argument("--slug", help="uno slug alla volta")
    sc.add_argument("--group", help="core,infra,incubation,domain (comma)")
    sc.add_argument("--core", action="store_true", help="core + infra essential")
    sc.add_argument("--all", action="store_true", help="con --group domain, tutti i dominii")
    sub.add_parser("status", help="stato clone vs contratto")
    sub.add_parser("doctor", help="valida layout vs contratto")
    sub.add_parser("print-installs", help="stampa path+install per make setup")

    args = p.parse_args(argv)
    contract = find_contract(args.contract)
    data = load(contract)

    if args.cmd == "list":
        return cmd_list(data, args)
    if args.cmd == "path":
        return cmd_path(data, args)
    if args.cmd == "clone":
        return cmd_clone(data, args)
    if args.cmd == "status":
        return cmd_status(data, args)
    if args.cmd == "doctor":
        return cmd_doctor(data, args)
    if args.cmd == "print-installs":
        return cmd_print_installs(data, args)
    return 2


if __name__ == "__main__":
    sys.exit(main())
