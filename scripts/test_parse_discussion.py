import unittest
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from parse_discussion import map_fields, parse_discussion_body


class ParseDiscussionTest(unittest.TestCase):
    def test_parses_h2_discussion_template(self):
        body = """## Fonte ufficiale

ISTAT SDMX

## Domanda civica

Quale territorio ha il divario maggiore?

## Copertura e granularita'

Regioni, 2012-2022.
"""

        parsed = parse_discussion_body(body)
        mapped = map_fields(parsed)

        self.assertEqual(mapped["source"], "ISTAT SDMX")
        self.assertEqual(mapped["question"], "Quale territorio ha il divario maggiore?")
        self.assertEqual(mapped["scope"], "Regioni, 2012-2022.")

    def test_still_parses_h3_discussion_template(self):
        body = """### Fonte

Portale demo

### Domanda civica

Che cosa cambia?
"""

        parsed = parse_discussion_body(body)
        mapped = map_fields(parsed)

        self.assertEqual(mapped["source"], "Portale demo")
        self.assertEqual(mapped["question"], "Che cosa cambia?")


if __name__ == "__main__":
    unittest.main()
