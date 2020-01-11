IZOBRAZBA <- read_csv2("podatki/izobrazbaaktivnost.csv", col_names=c("regija","spol", "izobrazba", 2008:2018 ),
                    skip = 3, na="N", locale=locale(encoding = "Windows-1250")) %>% 
  select(-"regija", - "spol")

izobrazba <- gather(IZOBRAZBA, -izobrazba, key=leto, value = stevilo, na.rm = TRUE)
izobrazba$leto <- parse_integer(izobrazba$leto)