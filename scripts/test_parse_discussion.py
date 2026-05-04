import io
import json
import os
import sys
import unittest
from pathlib import Path
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parent))
from parse_discussion import map_fields, parse_discussion_body, compact_fields, main


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


    def test_compact_fields_truncates_bullets(self):
        result = {
            "source": "- A\n- B\n- C\n- D\n- E\n- F\n- G",
            "question": "Domanda uno\nriga due\nriga tre extra",
            "why_now": "Motivo 1\nMotivo 2\nMotivo 3\nMotivo 4",
            "notes": "- N1\n- N2\n- N3\n- N4\n- N5\n- N6",
            "scope": "- S1\n- S2\n- S3\n- S4\n- S5\n- S6",
        }
        compacted = compact_fields(result)
        self.assertEqual(len(compacted["source"].splitlines()), 5)
        self.assertEqual(len(compacted["question"].splitlines()), 2)
        self.assertEqual(len(compacted["why_now"].splitlines()), 3)
        self.assertEqual(len(compacted["notes"].splitlines()), 5)
        self.assertEqual(len(compacted["scope"].splitlines()), 5)

    def test_compact_fields_noop_when_short(self):
        result = {"source": "- A\n- B", "question": "Domanda breve"}
        compacted = compact_fields(result)
        self.assertEqual(compacted["source"], "- A\n- B")
        self.assertEqual(compacted["question"], "Domanda breve")


class MainTest(unittest.TestCase):
    """Test main() failure modes."""

    def test_main_empty_body_exits_with_error(self):
        """DISCUSSION_BODY vuota → exit code 1 + stderr message."""
        with mock.patch.dict(os.environ, {"DISCUSSION_BODY": ""}, clear=True):
            with mock.patch("sys.argv", ["parse_discussion.py"]):
                stderr = io.StringIO()
                with self.assertRaises(SystemExit) as ctx, mock.patch("sys.stderr", stderr):
                    main()
                self.assertEqual(ctx.exception.code, 1)
                self.assertIn("DISCUSSION_BODY", stderr.getvalue())

    def test_main_missing_source_exits_with_error(self):
        """DISCUSSION_BODY senza campo source → exit code 1 + stderr message."""
        body = "## Domanda civica\n\nTest?"
        with mock.patch.dict(os.environ, {"DISCUSSION_BODY": body}, clear=True):
            with mock.patch("sys.argv", ["parse_discussion.py"]):
                stderr = io.StringIO()
                with self.assertRaises(SystemExit) as ctx, mock.patch("sys.stderr", stderr):
                    main()
                self.assertEqual(ctx.exception.code, 1)
                self.assertIn("campi obbligatori", stderr.getvalue())

    def test_main_valid_body_exits_ok_and_prints_json(self):
        """DISCUSSION_BODY valido → exit code 0 + stdout JSON."""
        body = (
            "## Fonte\n\nISTAT\n\n"
            "## Domanda civica\n\nQuanto?"
        )
        with mock.patch.dict(os.environ, {"DISCUSSION_BODY": body}, clear=True):
            with mock.patch("sys.argv", ["parse_discussion.py"]):
                stdout = io.StringIO()
                with mock.patch("sys.stdout", stdout):
                    try:
                        main()
                    except SystemExit as exc:
                        self.assertEqual(exc.code, 0)
                output = json.loads(stdout.getvalue())
                self.assertEqual(output["source"], "ISTAT")
                self.assertEqual(output["question"], "Quanto?")


if __name__ == "__main__":
    unittest.main()
