library(readr)
library(tidyr)
library(dplyr) 
library(tmap)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")

PLACEPOREGIJAH <- read_csv2("podatki/placeporegijah.csv", col_names=c( "regije", 2008:2018 ),
                                skip = 3, na="-", locale=locale(encoding = "Windows-1250"))

placeporegijah <- gather(PLACEPOREGIJAH, -regije, key=leto, value = stevilo , na.rm = TRUE)
placeporegijah$leto <- parse_integer(placeporegijah$leto)

povprecje.regije <- placeporegijah %>% group_by(regije) %>% summarise(povprecje=sum(stevilo)/(11))



zemljevid <- uvozi.zemljevid("https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SVN_shp.zip", "gadm36_SVN_1", encoding = "Windows-1250")



names(zemljevid)

tm_shape(merge(zemljevid, povprecje.regije, by.x="NAME_1", by.y="povprecje" ))+ tm_polygons("povprecje") 

