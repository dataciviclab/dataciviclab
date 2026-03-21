with nazionale as (
  select
    anno,
    'nazionale' as livello_aggregazione,
    cast(null as varchar) as distretto,
    count(*) as righe,
    sum(sopravvenuti) as sopravvenuti_totali,
    sum(definiti_totale) as definiti_totali,
    sum(pendenti_finali) as pendenti_finali_totali
  from clean_input
  group by 1
),
per_distretto as (
  select
    anno,
    'distretto' as livello_aggregazione,
    coalesce(nullif(trim(distretto), ''), '(non indicato)') as distretto,
    count(*) as righe,
    sum(sopravvenuti) as sopravvenuti_totali,
    sum(definiti_totale) as definiti_totali,
    sum(pendenti_finali) as pendenti_finali_totali
  from clean_input
  group by 1, 3
)
select * from nazionale
union all
select * from per_distretto
