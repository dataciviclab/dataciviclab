select
  anno_imposta,
  regione,
  codice_istat_comune,
  comune,
  sigla_provincia,
  numero_contribuenti,
  reddito_imponibile_eur as reddito_imponibile_totale_eur,
  imposta_netta_eur as imposta_netta_totale_eur,
  addizionale_comunale_eur as addizionale_comunale_totale_eur,
  reddito_imponibile_eur / nullif(numero_contribuenti, 0) as reddito_imponibile_medio_per_contribuente_eur
from clean_input
where anno_imposta is not null
  and codice_istat_comune is not null
  and comune is not null
  and regione is not null
  and numero_contribuenti is not null
  and reddito_imponibile_eur is not null
