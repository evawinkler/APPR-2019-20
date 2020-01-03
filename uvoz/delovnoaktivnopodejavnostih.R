library(readr)
library(tidyr)
library(dplyr)

DELOVNOAKTIVNO <- read_csv2("podatki/delovnoaktivnopodejavnostih.csv", col_names=c( "dejavnosti", 2010:2018 ), 
                            skip = 3, na="-", locale=locale(encoding = "Windows-1250"))


delovnoaktivno <- gather(DELOVNOAKTIVNO, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)
delovnoaktivno$leto <- parse_integer(delovnoaktivno$leto)



