with comuni_base as (
  select
    anno_imposta,
    'comune' as livello_territoriale,
    codice_istat_comune as codice_territorio,
    comune as territorio,
    regione,
    codice_istat_regione,
    sigla_provincia,
    cast(numero_contribuenti as double) as numero_contribuenti,
    reddito_imponibile_eur as reddito_imponibile_totale_eur,
    imposta_netta_eur as imposta_netta_totale_eur,
    addizionale_comunale_eur as addizionale_comunale_totale_eur
  from clean_all_years
  where anno_imposta is not null
    and codice_istat_comune is not null
    and comune is not null
    and regione is not null
    and numero_contribuenti is not null
    and reddito_imponibile_eur is not null
),
regioni_base as (
  select
    anno_imposta,
    'regione' as livello_territoriale,
    codice_istat_regione as codice_territorio,
    regione as territorio,
    regione,
    codice_istat_regione,
    cast(null as varchar) as sigla_provincia,
    cast(sum(numero_contribuenti) as double) as numero_contribuenti,
    sum(reddito_imponibile_eur) as reddito_imponibile_totale_eur,
    sum(imposta_netta_eur) as imposta_netta_totale_eur,
    sum(addizionale_comunale_eur) as addizionale_comunale_totale_eur
  from clean_all_years
  group by 1, 2, 3, 4, 5, 6, 7
),
territori as (
  select * from comuni_base
  union all
  select * from regioni_base
),
regioni_anno as (
  select
    anno_imposta,
    regione,
    sum(numero_contribuenti) as contribuenti_regione,
    sum(reddito_imponibile_totale_eur) as reddito_imponibile_regione_eur
  from comuni_base
  group by 1, 2
),
territori_con_quote as (
  select
    t.*,
    case
      when t.livello_territoriale = 'comune' then t.numero_contribuenti / nullif(r.contribuenti_regione, 0)
      else 1.0
    end as quota_contribuenti_su_regione,
    case
      when t.livello_territoriale = 'comune' then t.reddito_imponibile_totale_eur / nullif(r.reddito_imponibile_regione_eur, 0)
      else 1.0
    end as quota_reddito_imponibile_su_regione
  from territori t
  left join regioni_anno r
    on t.anno_imposta = r.anno_imposta
   and t.regione = r.regione
),
territori_metriche as (
  select
    *,
    reddito_imponibile_totale_eur / nullif(numero_contribuenti, 0) as reddito_imponibile_medio_per_contribuente_eur,
    imposta_netta_totale_eur / nullif(numero_contribuenti, 0) as imposta_netta_media_per_contribuente_eur,
    addizionale_comunale_totale_eur / nullif(numero_contribuenti, 0) as addizionale_comunale_media_per_contribuente_eur,
    row_number() over (
      partition by anno_imposta, livello_territoriale
      order by reddito_imponibile_totale_eur desc, territorio asc
    ) as rank_nazionale_reddito_imponibile,
    case
      when livello_territoriale = 'comune' then row_number() over (
        partition by anno_imposta, regione
        order by reddito_imponibile_totale_eur desc, territorio asc
      )
      else 1
    end as rank_regionale_reddito_imponibile
  from territori_con_quote
),
territori_delta as (
  select
    *,
    lag(numero_contribuenti) over (
      partition by livello_territoriale, codice_territorio
      order by anno_imposta
    ) as prev_numero_contribuenti,
    lag(reddito_imponibile_totale_eur) over (
      partition by livello_territoriale, codice_territorio
      order by anno_imposta
    ) as prev_reddito_imponibile_totale_eur,
    lag(imposta_netta_totale_eur) over (
      partition by livello_territoriale, codice_territorio
      order by anno_imposta
    ) as prev_imposta_netta_totale_eur
  from territori_metriche
)
select
  anno_imposta,
  livello_territoriale,
  codice_territorio,
  territorio,
  regione,
  codice_istat_regione,
  sigla_provincia,
  numero_contribuenti,
  reddito_imponibile_totale_eur,
  imposta_netta_totale_eur,
  addizionale_comunale_totale_eur,
  reddito_imponibile_medio_per_contribuente_eur,
  imposta_netta_media_per_contribuente_eur,
  addizionale_comunale_media_per_contribuente_eur,
  quota_contribuenti_su_regione,
  quota_reddito_imponibile_su_regione,
  rank_nazionale_reddito_imponibile,
  rank_regionale_reddito_imponibile,
  numero_contribuenti - prev_numero_contribuenti as delta_contribuenti_vs_anno_precedente,
  reddito_imponibile_totale_eur - prev_reddito_imponibile_totale_eur as delta_reddito_imponibile_vs_anno_precedente_eur,
  imposta_netta_totale_eur - prev_imposta_netta_totale_eur as delta_imposta_netta_vs_anno_precedente_eur,
  case
    when prev_numero_contribuenti is null then null
    else (numero_contribuenti - prev_numero_contribuenti) / nullif(prev_numero_contribuenti, 0)
  end as delta_contribuenti_vs_anno_precedente_pct,
  case
    when prev_reddito_imponibile_totale_eur is null then null
    else (reddito_imponibile_totale_eur - prev_reddito_imponibile_totale_eur) / nullif(prev_reddito_imponibile_totale_eur, 0)
  end as delta_reddito_imponibile_vs_anno_precedente_pct,
  case
    when prev_imposta_netta_totale_eur is null then null
    else (imposta_netta_totale_eur - prev_imposta_netta_totale_eur) / nullif(prev_imposta_netta_totale_eur, 0)
  end as delta_imposta_netta_vs_anno_precedente_pct
from territori_delta
order by anno_imposta, livello_territoriale, rank_nazionale_reddito_imponibile, territorio
