# ANALIZA PROSTIH IN ZASEDENIH MEST 

zasedena.mesta <- gather(ZASEDENA, -dejavnosti, key=leto, value = zasedena, na.rm = TRUE)
zasedena.mesta$leto <- parse_integer(zasedena.mesta$leto)



mesta <- full_join(prosta.mesta,zasedena.mesta)

vsota.zasedena <- zasedena.mesta %>% group_by(leto) %>% summarise(vsota=sum(zasedena))

vsota.prosta <- prosta.mesta %>% group_by(leto) %>% summarise(vsota=sum(prosta))


# ANALIZA DELOVNO AKTIVNEGA PREBIVALSTVA 

#DEJAVNOSTI

DEJAVNOSTI <- read_csv2("podatki/dejavnostiaktivnost.csv", col_names=c("drzava","spol", "dejavnosti", 2008:2018 ),
                        skip = 3, na="N", locale=locale(encoding = "Windows-1250")) %>% 
  select(-"drzava", - "spol")

dejavnosti <- gather(DEJAVNOSTI, -dejavnosti, key=leto, value = stevilo, na.rm = TRUE)
dejavnosti$leto <- parse_integer(dejavnosti$leto)


#IZOBRAZBA 

IZOBRAZBA <- read_csv2("podatki/izobrazbaaktivnost.csv", col_names=c("regija","spol", "izobrazba", 2008:2018 ),
                       skip = 3, na="N", locale=locale(encoding = "Windows-1250")) %>% 
  select(-"regija", - "spol")

izobrazba <- gather(IZOBRAZBA, -izobrazba, key=leto, value = stevilo, na.rm = TRUE)
izobrazba$leto <- parse_integer(izobrazba$leto)

#PLAČE PO DEJAVNOSTI 

PLACEPODEJAVNOSTIH <- read_xlsx("podatki/placepodejavnostih1.xlsx",col_names=c("dejavnosti", 2008:2018),
                                skip = 4, na="-")


placepodejavnostih <- gather(PLACEPODEJAVNOSTIH, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)
placepodejavnostih$leto <- parse_integer(placepodejavnostih$leto)

povprecje.dejavnosti <- placepodejavnostih %>% group_by(leto) %>% summarise(povprecje = sum(stevilo)/18)

minmax <- placepodejavnostih %>% group_by(dejavnosti) %>% summarise(razlika = max(stevilo)- min(stevilo))


#PLAČE PO REGIJAH 

PLACEPOREGIJAH <- read_xlsx("podatki/placeporegijah2.xlsx", col_names=c( "regije", 2008:2018 ),
                            skip = 4, na="-")

placeporegijah <- gather(PLACEPOREGIJAH, -regije, key=leto, value = stevilo , na.rm = TRUE)
placeporegijah$leto <- parse_integer(placeporegijah$leto)

povprecje.regije <- placeporegijah %>% group_by(regije) %>% summarise(povprecje=sum(stevilo)/(11))


zemljevid <- uvozi.zemljevid("https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SVN_shp.zip", "gadm36_SVN_1", encoding = "UTF-8")



names(zemljevid)