library(readr)
library(tidyr)
library(dplyr)


MOSKIVZHODNA <- read_csv2("podatki/aktivnostmoskivzhodna.csv", col_names=c( "vzhodna", "aktivnost", "MOSKI", 2008:2018 ),
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"vzhodna", -"MOSKI")

moskivzhodna <- gather(MOSKIVZHODNA, -aktivnost, key=leto, value = stevilo , na.rm = TRUE)

moskivzhodna$leto <- parse_integer(moskivzhodna$leto)


MOSKIZAHODNA <- read_csv2("podatki/aktivnostmoskizahodna.csv", col_names=c( "zahodna", "aktivnost", "MOSKI", 2008:2018 ), 
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"zahodna", -"MOSKI")

moskizahodna <- gather(MOSKIZAHODNA, -aktivnost, key=leto, value = stevilo , na.rm = TRUE)

moskizahodna$leto <- parse_integer(moskizahodna$leto) 




ZENSKEVZHODNA <- read_csv2("podatki/aktivnostzenskevzhodna.csv", col_names=c( "vzhodna", "aktivnost", "zenske", 2008:2018 ),
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"vzhodna", -"zenske")


zenskevzhodna <- gather(ZENSKEVZHODNA, -aktivnost, key=leto, value = stevilo , na.rm = TRUE)

zenskevzhodna$leto <- parse_integer(zenskevzhodna$leto) 



ZENSKEZAHODNA <- read_csv2("podatki/aktivnostzenskezahodna.csv", col_names=c( "zahodna", "aktivnost", "zenske", 2008:2018 ), 
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"zahodna", -"zenske")


zenskezahodna <- gather(ZENSKEZAHODNA, -aktivnost, key=leto, value = stevilo , na.rm = TRUE)

zenskezahodna$leto <- parse_integer(zenskezahodna$leto) 
