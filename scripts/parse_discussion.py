import os
import re
import sys
import json


def parse_discussion_body(body):
    """
    Parses a GitHub Discussion body (markdown with ##/### headings) to extract field values.
    Matching is case-insensitive and strips punctuation to tolerate minor template drift.
    """
    fields = {}
    current_label = None
    current_content = []

    lines = body.splitlines()
    for line in lines:
        match = re.match(r'^#{2,3}\s+(.*)', line)
        if match:
            if current_label:
                fields[current_label] = "\n".join(current_content).strip()
            current_label = match.group(1).strip()
            current_content = []
        elif current_label:
            current_content.append(line)

    if current_label:
        fields[current_label] = "\n".join(current_content).strip()

    return fields


def _normalize(text):
    """Lowercase + strip punctuation for fuzzy heading match."""
    return re.sub(r'[^\w\s]', '', text).lower().strip()


# Mapping: normalized heading fragment -> issue field key
# Using fragments so minor wording changes (accents, punctuation) don't break the match.
_FRAGMENT_MAP = {
    "fonte": "source",
    "domanda civica": "question",
    "perch": "why_now",        # covers "Perché è rilevante?" and variants
    "copertura": "scope",
    "granularit": "scope",     # fallback if heading splits differently
    "limiti": "notes",
    "rischi": "notes",
    "cosa contiene": "description",
}


def map_fields(parsed):
    result = {}
    for heading, value in parsed.items():
        norm = _normalize(heading)
        matched_key = None
        for fragment, key in _FRAGMENT_MAP.items():
            if fragment in norm:
                matched_key = key
                break
        if matched_key and matched_key not in result:
            result[matched_key] = value
    return result


def _compact_text(text, max_lines):
    """Keep first max_lines non-empty lines of a text block."""
    lines = [l for l in text.splitlines() if l.strip()]
    return "\n".join(lines[:max_lines])


def _compact_bullets(text, max_bullets):
    """Keep first max_bullets bullet lines; ignore narrative paragraphs after bullets end."""
    bullets = []
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.startswith("-") or stripped.startswith("*"):
            bullets.append(line)
            if len(bullets) >= max_bullets:
                break
    # Fallback: if no bullets found, treat as plain text
    if not bullets:
        return _compact_text(text, max_bullets)
    return "\n".join(bullets)


# Per-field compact rules: (strategy, limit)
_COMPACT_RULES = {
    "question": ("text", 2),
    "source":   ("bullets", 5),
    "scope":    ("bullets", 5),
    "why_now":  ("text", 3),
    "notes":    ("bullets", 5),
}


def compact_fields(result):
    """Apply per-field compaction rules to extracted fields."""
    compacted = {}
    for key, value in result.items():
        if not value:
            compacted[key] = value
            continue
        rule = _COMPACT_RULES.get(key)
        if rule is None:
            compacted[key] = value
            continue
        strategy, limit = rule
        if strategy == "text":
            compacted[key] = _compact_text(value, limit)
        else:
            compacted[key] = _compact_bullets(value, limit)
    return compacted


REQUIRED_FIELDS = ("source",)


def main():
    body = os.environ.get("DISCUSSION_BODY", "")
    if not body:
        print("ERROR: DISCUSSION_BODY environment variable is empty.", file=sys.stderr)
        sys.exit(1)

    parsed = parse_discussion_body(body)
    result = map_fields(parsed)

    # Fallback: use discussion title as question if not found in body
    if not result.get("question"):
        title = os.environ.get("DISCUSSION_TITLE", "").strip()
        if title:
            result["question"] = title

    missing = [f for f in REQUIRED_FIELDS if not result.get(f)]
    if missing:
        print(
            f"ERROR: campi obbligatori mancanti o non riconosciuti: {', '.join(missing)}. "
            "Verificare che il template della discussion sia compilato correttamente.",
            file=sys.stderr,
        )
        sys.exit(1)

    result = compact_fields(result)

    # Output as JSON for GitHub Actions
    print(json.dumps(result, ensure_ascii=False))


if __name__ == "__main__":
    main()
