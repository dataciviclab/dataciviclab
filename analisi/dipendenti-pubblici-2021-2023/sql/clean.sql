select
  cast("Anno Rilevazione" as integer) as anno,
  "Descrizione Tipo Istituzione" as tipo_istituzione,
  "Codice Istituzione" as codice_istituzione,
  "Codice Ente BDAP" as codice_ente_bdap,
  "Descrizione Ente" as ente,
  "Codice Comparto" as codice_comparto,
  "Descrizione Comparto" as comparto,
  "Codice Contratto Lavoro" as codice_contratto,
  "Descrizione Contratto Lavoro" as contratto_lavoro,
  "Codice Macrocategoria" as codice_macrocategoria,
  "Descrizione Macrocategoria" as macrocategoria,
  "Codice Categoria" as codice_categoria,
  "Descrizione Categoria" as categoria,
  cast("Numero Dipendenti Donne Tempo Pieno" as double) as donne_tempo_pieno,
  cast("Numero Dipendenti Uomini Tempo Pieno" as double) as uomini_tempo_pieno,
  cast("Numero Dipendenti Donne Part time Inf. 50%" as double) as donne_part_time_inf_50,
  cast("Numero Dipendenti Uomini Part time Inf. 50%" as double) as uomini_part_time_inf_50,
  cast("Numero Dipendenti Donne Part time Sup. 50%" as double) as donne_part_time_sup_50,
  cast("Numero Dipendenti Uomini Part time Sup. 50%" as double) as uomini_part_time_sup_50,
  cast("Numero Dipendenti Donne Assunte" as double) as donne_assunte,
  cast("Numero Dipendenti Uomini Assunti" as double) as uomini_assunti,
  cast("Numero Dipendenti Donne Cessate" as double) as donne_cessate,
  cast("Numero Dipendenti Uomini Cessati" as double) as uomini_cessati,
  coalesce(cast("Numero Dipendenti Donne Tempo Pieno" as double), 0)
    + coalesce(cast("Numero Dipendenti Donne Part time Inf. 50%" as double), 0)
    + coalesce(cast("Numero Dipendenti Donne Part time Sup. 50%" as double), 0) as donne_totali,
  coalesce(cast("Numero Dipendenti Uomini Tempo Pieno" as double), 0)
    + coalesce(cast("Numero Dipendenti Uomini Part time Inf. 50%" as double), 0)
    + coalesce(cast("Numero Dipendenti Uomini Part time Sup. 50%" as double), 0) as uomini_totali,
  coalesce(cast("Numero Dipendenti Donne Assunte" as double), 0)
    + coalesce(cast("Numero Dipendenti Uomini Assunti" as double), 0) as assunti_totali,
  coalesce(cast("Numero Dipendenti Donne Cessate" as double), 0)
    + coalesce(cast("Numero Dipendenti Uomini Cessati" as double), 0) as cessati_totali
from raw_input
