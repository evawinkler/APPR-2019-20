library(readr)
library(tidyr)
library(dplyr) 
library(tmap)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")

PLACEPOREGIJAH <- read_csv2("podatki/placeporegijah.csv", col_names=c( "regije", 2008:2018 ),
                                skip = 3, na="-", locale=locale(encoding = "Windows-1250"))

placeporegijah <- gather(PLACEPOREGIJAH, -regije, key=leto, value = stevilo , na.rm = TRUE)
placeporegijah$leto <- parse_integer(placeporegijah$leto)

povprecje <- placeporegijah %>% group_by(regije) %>% summarise(povprecje=sum(stevilo)/(11))


regije <- uvozi.zemljevid("https://gadm.org/img/480/gadm/SVN/SVN_divs.png", "SVN_divs", encoding =NULL, force=FALSE, mapa ="APPR/projektappr/zemljevidi")