-- mart.sql - terna_electricity_by_source - mart_mix_regioni
-- Primo taglio analitico:
-- - usa solo produzione netta
-- - aggrega a livello anno/regione/fonte
-- - calcola il peso percentuale della fonte sul totale regionale

WITH netta AS (
    SELECT
        anno,
        regione,
        fonte,
        SUM(produzione_gwh) AS produzione_gwh_netta
    FROM clean_input
    WHERE tipo_produzione = 'Netta'
    GROUP BY anno, regione, fonte
),
totali_regione AS (
    SELECT
        anno,
        regione,
        SUM(produzione_gwh_netta) AS totale_regione_gwh_netta
    FROM netta
    GROUP BY anno, regione
)
SELECT
    n.anno,
    n.regione,
    n.fonte,
    ROUND(n.produzione_gwh_netta, 6) AS produzione_gwh_netta,
    ROUND(t.totale_regione_gwh_netta, 6) AS totale_regione_gwh_netta,
    ROUND(n.produzione_gwh_netta / NULLIF(t.totale_regione_gwh_netta, 0) * 100, 2) AS quota_mix_regionale_pct
FROM netta n
JOIN totali_regione t
  ON n.anno = t.anno
 AND n.regione = t.regione
ORDER BY n.anno, n.regione, quota_mix_regionale_pct DESC, n.fonte
