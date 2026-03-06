select
  anno_imposta,
  regione,
  count(*) as comuni,
  sum(numero_contribuenti) as contribuenti,
  sum(reddito_imponibile_eur) as reddito_imponibile_totale_eur,
  sum(imposta_netta_eur) as imposta_netta_totale_eur,
  sum(addizionale_comunale_eur) as addizionale_comunale_totale_eur,
  avg(reddito_imponibile_eur / nullif(numero_contribuenti, 0)) as reddito_imponibile_medio_per_contribuente_eur
from clean_input
group by 1, 2
