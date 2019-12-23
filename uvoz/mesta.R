library(readr)
library(tidyr)
library(dplyr)


PROSTA <- read_csv2("podatki/prostamesta.csv", col_names=c("prosta", "dejavnosti", 2008:2018 ),
                    skip = 3, na="N", locale=locale(encoding = "Windows-1250"))%>%
  select(-"prosta")

prosta.mesta <- gather(PROSTA, -dejavnosti, key=leto, value = prosta, na.rm = TRUE)
prosta.mesta$leto <- parse_integer(prosta.mesta$leto)

ZASEDENA <- read_csv2("podatki/zasedenamesta.csv",
                      col_names=c("zasedena", "dejavnosti", 2008:2018 ), 
                      skip = 3, na="N", locale=locale(encoding = "Windows-1250")) %>%
  select(-"zasedena")


zasedena.mesta <- gather(ZASEDENA, -dejavnosti, key=leto, value = zasedena, na.rm = TRUE)
zasedena.mesta$leto <- parse_integer(zasedena.mesta$leto)



mesta <- full_join(prosta.mesta,zasedena.mesta)