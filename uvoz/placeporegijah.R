

PLACEPOREGIJAH <- read_xlsx("podatki/placeporegijah2.xlsx", col_names=c( "regije", 2008:2018 ),
                                skip = 4, na="-")

placeporegijah <- gather(PLACEPOREGIJAH, -regije, key=leto, value = stevilo , na.rm = TRUE)
placeporegijah$leto <- parse_integer(placeporegijah$leto)

povprecje.regije <- placeporegijah %>% group_by(regije) %>% summarise(povprecje=sum(stevilo)/(11))


zemljevid <- uvozi.zemljevid("https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SVN_shp.zip", "gadm36_SVN_1", encoding = "UTF-8")



names(zemljevid)



