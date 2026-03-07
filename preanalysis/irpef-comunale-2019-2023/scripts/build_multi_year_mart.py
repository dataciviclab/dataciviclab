from __future__ import annotations

from pathlib import Path

import duckdb


YEARS = [2019, 2020, 2021, 2022, 2023]
DATASET_SLUG = "irpef_comunale_2019_2023"


def main() -> None:
    script_dir = Path(__file__).resolve().parent
    repo_root = script_dir.parents[2]
    clean_root = repo_root / "_out" / "data" / "clean" / DATASET_SLUG
    mart_root = repo_root / "_out" / "data" / "mart" / DATASET_SLUG
    sql_path = script_dir.parent / "sql" / "mart_multi_anno.sql"

    clean_inputs = [
        clean_root / str(year) / f"{DATASET_SLUG}_{year}_clean.parquet" for year in YEARS
    ]
    missing = [path for path in [*clean_inputs, sql_path] if not path.exists()]
    if missing:
        missing_list = "\n".join(f"- {path}" for path in missing)
        raise FileNotFoundError(f"Input mancanti:\n{missing_list}")

    mart_root.mkdir(parents=True, exist_ok=True)
    output_path = mart_root / "irpef_capacita_fiscale_multi_anno.parquet"
    sql = sql_path.read_text(encoding="utf-8")
    union_clean_sql = "\nUNION ALL\n".join(
        f"SELECT * FROM read_parquet('{path.as_posix()}')" for path in clean_inputs
    )

    con = duckdb.connect()
    try:
        con.execute(
            f"""
            create or replace temp view clean_all_years as
            {union_clean_sql}
            """
        )
        con.execute(
            f"""
            COPY (
                {sql}
            ) TO '{output_path.as_posix()}'
            (FORMAT PARQUET, COMPRESSION ZSTD);
            """
        )
    finally:
        con.close()

    print(f"Creato: {output_path}")


if __name__ == "__main__":
    main()
