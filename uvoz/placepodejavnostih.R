library(readr)
library(tidyr)
library(dplyr) 
library("readxl")
library("openxlsx")

PLACEPODEJAVNOSTIH <- read_xlsx("podatki/placepodejavnostih1.xlsx",col_names=c("dejavnosti", 2008:2018),
                                skip = 4, na="-")


placepodejavnostih <- gather(PLACEPODEJAVNOSTIH, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)
placepodejavnostih$leto <- parse_integer(placepodejavnostih$leto)

povprecje.dejavnosti <- placepodejavnostih %>% group_by(dejavnosti) %>% summarise(povprecje = sum(stevilo)/11)

minmax <- placepodejavnostih %>% group_by(dejavnosti) %>% summarise(razlika = max(stevilo)- min(stevilo))

