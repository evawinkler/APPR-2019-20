library(readr)
library(tidyr)
library(dplyr) 


PLACEPOREGIJAH <- read_csv2("podatki/placeporegijah.csv", col_names=c( "regije", 2008:2018 ),
                                skip = 3, na="-", locale=locale(encoding = "Windows-1250"))