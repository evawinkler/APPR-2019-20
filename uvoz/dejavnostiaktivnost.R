DEJAVNOSTI <- read_csv2("podatki/dejavnostiaktivnost.csv", col_names=c("drzava","spol", "dejavnosti", 2008:2018 ),
                       skip = 3, na="N", locale=locale(encoding = "Windows-1250")) %>% 
  select(-"drzava", - "spol")

dejavnosti <- gather(DEJAVNOSTI, -dejavnosti, key=leto, value = stevilo, na.rm = TRUE)
dejavnosti$leto <- parse_integer(dejavnosti$leto)