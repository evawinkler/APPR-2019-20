# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                             pot.zemljevida="OB", encoding="Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
 # { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
#zemljevid <- fortify(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
 # summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

 

z1 <- tm_shape(merge(zemljevid, povprecje.regije, by.x="NAME_1", by.y="regije" )) + tm_polygons("Povprecje",title="Povprečje v €") + tm_layout(title="Povprečna mesečna neto plača glede na regijo, Slovenija, 2018")

g <- ggplot() + aes(x=leto, y=vsota, color=tip) + facet_grid(tip ~ ., scales="free_y") +
  geom_line(data=mesta.vsote %>% filter(tip == "zasedena")) +
  geom_line(data=mesta.vsote %>% filter(tip == "prosta")) + 
  scale_x_continuous(breaks=seq(2008, 2018, 2)) +
  scale_y_continuous(labels=comma_format(big.mark="")) +
  guides(color=FALSE) + ggtitle("Število prostih in zasedenih delovnih mest ")

g3 <- ggplot(izobrazba %>% filter(izobrazba == "Brez izobrazbe, nepopolna osnovnošolska"))+ aes(x = leto, y = stevilo)  + geom_line(col="red") + ggtitle("Število aktivnega prebivalstva brez izobrazbe v 1000") + xlab("Leto") + ylab("Število")

g4 <- ggplot(dejavnosti %>% filter(dejavnosti == "Predelovalne dejavnosti"))+ aes(x = leto, y = stevilo)  + geom_line(col="green") + ggtitle("Gibanje števila zaposlenih v pridelovalnih dejavnostih v 1000") + xlab("Leto") + ylab("Število") 

g5 <- ggplot(tabelahtml %>% filter(spremenljivke == "Unemployment rate(in Percent)")) + aes(x = leto, y = stevilo, group = 1)  + geom_line(col="black") +  ggtitle("Rast brezposelnosti v % ")   + theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1)) + xlab("Leto") + ylab("Število")


#napoved za pomursko regijo 

g6pomurska <- ggplot(placeporegijah %>% filter(regije == "Pomurska")) + 
  aes(x = leto, y = stevilo) + geom_point() + geom_smooth(method = "gam", se = FALSE)

mgam <- gam(stevilo ~ leto , data = placeporegijah)
leta <- data.frame(leto = seq(2019,2022))
napoved <- leta %>% mutate(stevilo = predict(mgam, .))

tabela.napoved <- bind_rows(napoved, (placeporegijah %>%  filter(regije == "Pomurska"))[c(2,3)])

graf.napoved <- ggplot(tabela.napoved, aes(x = leto, y = stevilo)) + 
  geom_point() + scale_x_continuous(name = "Leto", breaks = seq(2008,2022,1)) + ylab("Plača") +
  ggtitle("Povprečna plača v Pomurju") +
  geom_smooth(method = 'gam', formula = y ~ x, se = FALSE) + theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1))



#napoved za osrednjeslovensko regijo 


