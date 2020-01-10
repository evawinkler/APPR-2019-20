
PLACEPODEJAVNOSTIH <- read_xlsx("podatki/placepodejavnostih1.xlsx",col_names=c("dejavnosti", 2008:2018),
                                skip = 4, na="-")


placepodejavnostih <- gather(PLACEPODEJAVNOSTIH, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)
placepodejavnostih$leto <- parse_integer(placepodejavnostih$leto)

povprecje.dejavnosti <- placepodejavnostih %>% group_by(leto) %>% summarise(povprecje = sum(stevilo)/18)

minmax <- placepodejavnostih %>% group_by(dejavnosti) %>% summarise(razlika = max(stevilo)- min(stevilo))

PLACEPODEJAVNOSTIH08 <- read_xlsx("podatki/placepodejavnostih1.xlsx",col_names=c("dejavnosti", 2008:2018),
                                skip = 4, na="-") %>% select(-"2009", - "2010", -"2011", -"2012",
                                                             -"2013",-"2014", - "2015",
                                                             -"2016", -"2017", -"2018")

placepodejavnostih08 <- gather(PLACEPODEJAVNOSTIH1, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)



PLACEPODEJAVNOSTIH18 <- read_xlsx("podatki/placepodejavnostih1.xlsx",col_names=c("dejavnosti", 2008:2018),
                                 skip = 4, na="-") %>% select(-"2008", -"2009", - "2010", -"2011", -"2012",
                                                              -"2013",-"2014", - "2015",
                                                              -"2016", -"2017")
placepodejavnostih18 <- gather(PLACEPODEJAVNOSTIH18, -dejavnosti, key=leto, value = stevilo , na.rm = TRUE)



