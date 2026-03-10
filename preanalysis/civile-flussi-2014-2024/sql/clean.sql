select
  try_cast("Anno" as integer) as anno,
  trim("Fonte") as fonte,
  trim("Tipo ufficio") as tipo_ufficio,
  trim("Distretto") as distretto,
  trim("Sede") as sede,
  trim("Macromateria") as macromateria,
  trim("Materia") as materia,
  try_cast("Sopravvenuti" as double) as sopravvenuti,
  try_cast("Definiti - totale" as double) as definiti_totale,
  try_cast("Pendenti finali" as double) as pendenti_finali
from raw_input
where try_cast("Anno" as integer) is not null
  and trim(coalesce("Fonte", '')) <> ''
