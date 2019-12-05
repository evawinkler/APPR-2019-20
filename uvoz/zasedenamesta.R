library(readr)
library(tidyr)
library(dplyr)

ZASEDENA <- read_csv2("podatki/zasedenamesta.csv", col_names=c("zasedena", "dejavnosti", 2008:2018 ), skip = 3, na="N", locale=locale(encoding = "Windows-1250"))
zasedena.mesta <- gather(ZASEDENA, -zasedena,- dejavnosti,key=leto, value= zasedena , na.rm=TRUE)
zasedena.mesta$leto <- parse_integer(zasedena.mesta$leto)
