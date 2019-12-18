library(readr)
library(tidyr)
library(dplyr)

DELOVNOAKTIVNO <- read_csv2("podatki/delovnoaktivnopodejavnostih.csv", col_names=c( "imena", 2010:2018 ), 
                            skip = 3, na="-", locale=locale(encoding = "Windows-1250"))

