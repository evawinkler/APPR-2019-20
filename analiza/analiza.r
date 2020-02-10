# 4. faza: Analiza podatkov

#napoved za pomursko regijo 

g6pomurska <- ggplot(placeporegijah %>% filter(regije == "Pomurska")) + 
  aes(x = leto, y = stevilo) + geom_point() + geom_smooth(method = "gam", se = FALSE)

mgam1 <- gam(stevilo ~ leto , data = placeporegijah %>% filter(regije == "Pomurska"))
leta1 <- data.frame(leto = seq(2019,2022))
napoved <- leta1 %>% mutate(stevilo = predict(mgam1, .))

tabela.napoved <- bind_rows(napoved, (placeporegijah %>%  filter(regije == "Pomurska"))[c(2,3)])

graf.napoved <- ggplot(tabela.napoved, aes(x = leto, y = stevilo)) + 
  geom_point() + scale_x_continuous(name = "Leto", breaks = seq(2008,2022,1)) + ylab("Plača") +
  ggtitle("Povprečna mesečna neto plača v Pomurju") +
  geom_smooth(method = 'gam', formula = y ~ x, se = FALSE) + theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1))



#napoved za osrednjeslovensko regijo 

g6osrednjeslovenska <- ggplot(placeporegijah %>% filter(regije == "Osrednjeslovenska")) + 
  aes(x = leto, y = stevilo) + geom_point() + geom_smooth(method = "gam", se = FALSE)

mgam2 <- gam(stevilo ~ leto , data = placeporegijah %>% filter(regije == "Osrednjeslovenska"))
leta2 <- data.frame(leto = seq(2019,2022))
napoved1 <- leta2 %>% mutate(stevilo = predict(mgam2, .))

tabela.napoved1 <- bind_rows(napoved1, (placeporegijah %>%  filter(regije == "Osrednjeslovenska"))[c(2,3)])

graf.napoved1 <- ggplot(tabela.napoved1, aes(x = leto, y = stevilo)) + 
  geom_point() + scale_x_continuous(name = "Leto", breaks = seq(2008,2022,1)) + ylab("Plača") +
  ggtitle("Povprečna mesečna neto plača v osrednjeslovenski regiji") +
  geom_smooth(method = 'gam', formula = y ~ x, se = FALSE) + theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1))
