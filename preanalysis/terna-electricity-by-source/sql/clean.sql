-- clean.sql - terna_electricity_by_source
-- Input: workbook XLSX, foglio Export
-- Obiettivo: normalizzare colonne e scartare la riga finale di testo "Applied filters..."

SELECT
    CAST("Anno" AS INTEGER) AS anno,
    TRIM(CAST("Tipo produzione" AS VARCHAR)) AS tipo_produzione,
    TRIM(CAST("Regione" AS VARCHAR)) AS regione,
    TRIM(CAST("Provincia" AS VARCHAR)) AS provincia,
    TRIM(CAST("Fonte" AS VARCHAR)) AS fonte,
    CAST("Produzione (GWh)" AS DOUBLE) AS produzione_gwh
FROM raw_input
WHERE TRY_CAST("Anno" AS INTEGER) IS NOT NULL
  AND "Produzione (GWh)" IS NOT NULL
