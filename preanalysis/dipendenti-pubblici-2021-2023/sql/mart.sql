select
  anno,
  comparto,
  sum(donne_totali + uomini_totali) as dipendenti_totali,
  sum(assunti_totali) as assunti_totali,
  sum(cessati_totali) as cessati_totali,
  sum(assunti_totali) - sum(cessati_totali) as saldo_netto,
  round(100.0 * sum(assunti_totali) / nullif(sum(donne_totali + uomini_totali), 0), 2) as tasso_assunzione_pct,
  round(100.0 * sum(cessati_totali) / nullif(sum(donne_totali + uomini_totali), 0), 2) as tasso_uscita_pct,
  round(100.0 * sum(donne_totali) / nullif(sum(donne_totali + uomini_totali), 0), 2) as quota_donne_pct
from clean_input
group by 1, 2
order by anno, dipendenti_totali desc
