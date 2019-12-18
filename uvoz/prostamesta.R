library(readr)
library(tidyr)
library(dplyr)

PROSTA <- read_csv2("podatki/prostamesta.csv", col_names=c("prosta", "dejavnosti", 2008:2018 ),
                    skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"prosta")

prosta.mesta <- gather(PROSTA, -dejavnosti, key=leto, value = prosta, na.rm = TRUE)
prosta.mesta$leto <- parse_integer(prosta.mesta$leto)