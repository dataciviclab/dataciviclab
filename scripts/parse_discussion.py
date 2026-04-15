import os
import re
import sys
import json

def parse_discussion_body(body):
    """
    Parses a GitHub Discussion body (YAML form output) to extract field values.
    Headings are formatted as '### Label'.
    """
    fields = {}
    current_label = None
    current_content = []

    lines = body.splitlines()
    for line in lines:
        match = re.match(r'^###\s+(.*)', line)
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

def main():
    body = os.environ.get("DISCUSSION_BODY", "")
    if not body:
        print("ERROR: DISCUSSION_BODY environment variable is empty.")
        sys.exit(1)

    parsed = parse_discussion_body(body)
    
    # Mapping to dataset-incubator issue template
    # Discussion Label -> Issue Field
    mapping = {
        "Fonte ufficiale": "source",
        "Domanda civica possibile": "question",
        "Perché è rilevante?": "why_now",
        "Copertura e granularità": "scope",
        "Limiti o rischi noti": "notes",
        "Cosa contiene?": "description"
    }

    result = {mapping.get(k, k): v for k, v in parsed.items()}
    
    # Output as JSON for GitHub Actions
    print(json.dumps(result))

if __name__ == "__main__":
    main()
