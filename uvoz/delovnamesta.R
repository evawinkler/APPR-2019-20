library(readr)
library(tidyr)
library(dplyr)

PROSTAM <- read_csv2("podatki/prostamesta.csv", col_names=c("prosta", "dejavnosti", 2008:2018 ), skip = 3, na="N", locale=locale(encoding = "Windows-1250"))



