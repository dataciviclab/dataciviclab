select
  try_cast(column00 as integer) as anno_imposta,
  trim(cast(column01 as varchar)) as codice_catastale,
  trim(cast(column02 as varchar)) as codice_istat_comune,
  trim(cast(column03 as varchar)) as comune,
  trim(cast(column04 as varchar)) as sigla_provincia,
  trim(cast(column05 as varchar)) as regione,
  trim(cast(column06 as varchar)) as codice_istat_regione,
  try_cast(column07 as integer) as numero_contribuenti,
  try_cast(column08 as integer) as reddito_fabbricati_freq,
  try_cast(column09 as double) as reddito_fabbricati_eur,
  try_cast(column10 as integer) as reddito_lavoro_dipendente_freq,
  try_cast(column11 as double) as reddito_lavoro_dipendente_eur,
  try_cast(column12 as integer) as reddito_pensione_freq,
  try_cast(column13 as double) as reddito_pensione_eur,
  try_cast(column14 as integer) as reddito_lavoro_autonomo_freq,
  try_cast(column15 as double) as reddito_lavoro_autonomo_eur,
  try_cast(column16 as integer) as reddito_impresa_ordinaria_freq,
  try_cast(column17 as double) as reddito_impresa_ordinaria_eur,
  try_cast(column18 as integer) as reddito_impresa_semplificata_freq,
  try_cast(column19 as double) as reddito_impresa_semplificata_eur,
  try_cast(column20 as integer) as reddito_partecipazione_freq,
  try_cast(column21 as double) as reddito_partecipazione_eur,
  try_cast(column22 as integer) as reddito_imponibile_freq,
  try_cast(column23 as double) as reddito_imponibile_eur,
  try_cast(column24 as integer) as imposta_netta_freq,
  try_cast(column25 as double) as imposta_netta_eur,
  case when try_cast(column00 as integer) <= 2020 then try_cast(column26 as integer) end as bonus_spettante_freq,
  case when try_cast(column00 as integer) <= 2020 then try_cast(column27 as double) end as bonus_spettante_eur,
  case when try_cast(column00 as integer) >= 2021 then try_cast(column26 as integer) end as trattamento_spettante_freq,
  case when try_cast(column00 as integer) >= 2021 then try_cast(column27 as double) end as trattamento_spettante_eur,
  try_cast(column26 as integer) as misura_spettante_freq,
  try_cast(column27 as double) as misura_spettante_eur,
  try_cast(column28 as integer) as reddito_imponibile_addizionale_freq,
  try_cast(column29 as double) as reddito_imponibile_addizionale_eur,
  try_cast(column30 as integer) as addizionale_regionale_freq,
  try_cast(column31 as double) as addizionale_regionale_eur,
  try_cast(column32 as integer) as addizionale_comunale_freq,
  try_cast(column33 as double) as addizionale_comunale_eur,
  case when try_cast(column00 as integer) >= 2023 then try_cast(column34 as integer) end as reddito_complessivo_freq,
  case when try_cast(column00 as integer) >= 2023 then try_cast(column35 as double) end as reddito_complessivo_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column36 as integer)
    else try_cast(column34 as integer)
  end as reddito_complessivo_le_zero_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column37 as double)
    else try_cast(column35 as double)
  end as reddito_complessivo_le_zero_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column38 as integer)
    else try_cast(column36 as integer)
  end as reddito_0_10000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column39 as double)
    else try_cast(column37 as double)
  end as reddito_0_10000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column40 as integer)
    else try_cast(column38 as integer)
  end as reddito_10000_15000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column41 as double)
    else try_cast(column39 as double)
  end as reddito_10000_15000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column42 as integer)
    else try_cast(column40 as integer)
  end as reddito_15000_26000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column43 as double)
    else try_cast(column41 as double)
  end as reddito_15000_26000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column44 as integer)
    else try_cast(column42 as integer)
  end as reddito_26000_55000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column45 as double)
    else try_cast(column43 as double)
  end as reddito_26000_55000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column46 as integer)
    else try_cast(column44 as integer)
  end as reddito_55000_75000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column47 as double)
    else try_cast(column45 as double)
  end as reddito_55000_75000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column48 as integer)
    else try_cast(column46 as integer)
  end as reddito_75000_120000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column49 as double)
    else try_cast(column47 as double)
  end as reddito_75000_120000_eur,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column50 as integer)
    else try_cast(column48 as integer)
  end as reddito_oltre_120000_freq,
  case
    when try_cast(column00 as integer) >= 2023 then try_cast(column51 as double)
    else try_cast(column49 as double)
  end as reddito_oltre_120000_eur,
  cast(null as integer) as popolazione_comune
from raw_input
