library(readr)
library(tidyr)
library(dplyr) 


PLACEPODEJAVNOSTIH <- read_csv2("podatki/placepodejavnostih.csv", col_names=c("neto", "dejavnosti", 2008:2018 ),
                    skip = 3, na="-", locale=locale(encoding = "Windows-1250"))%>%
  select(-"neto")

placepodejavnostih <- gather(PLACEPODEJAVNOSTIH, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)
placepodejavnostih$leto <- parse_integer(placepodejavnostih$leto)