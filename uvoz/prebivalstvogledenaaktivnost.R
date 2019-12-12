library(readr)
library(tidyr)
library(dplyr)


moskivzhodna <- read_csv2("podatki/aktivnostmoskivzhodna.csv", col_names=c( "vzhodna", "razlogi ", "MOSKI", 2008:2018 ),
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"vzhodna", -"MOSKI")


moskizahodna <- read_csv2("podatki/aktivnostmoskizahodna.csv", col_names=c( "zahodna", "razlogi ", "MOSKI", 2008:2018 ), 
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"zahodna", -"MOSKI")


zenskevzhodna <- read_csv2("podatki/aktivnostzenskevzhodna.csv", col_names=c( "vzhodna", "razlogi ", "zenske", 2008:2018 ),
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"vzhodna", -"zenske")

zenskezahodna <- read_csv2("podatki/aktivnostzenskezahodna.csv", col_names=c( "zahodna", "razlogi ", "zenske", 2008:2018 ), 
                          skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"zahodna", -"zenske")

