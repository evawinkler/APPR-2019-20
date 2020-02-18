# 3. faza: Vizualizacija podatkov


z1 <- tm_shape(merge(zemljevid, povprecje.regije, by.x="NAME_1", by.y="regije" )) + tm_polygons("Povprecje",title="Plače v €") + tm_layout(title="Povprečna mesečna neto plača glede na regijo v zadnjem destletju")

g <- ggplot() + aes(x=leto, y=vsota, color=tip) + facet_grid(tip ~ ., scales="free_y") +
  geom_line(data=mesta.vsote %>% filter(tip == "zasedena")) +
  geom_line(data=mesta.vsote %>% filter(tip == "prosta")) + 
  scale_x_continuous(breaks=seq(2008, 2018, 2)) +
  scale_y_continuous(labels=comma_format(big.mark="")) +
  guides(color=FALSE) + ggtitle("Število prostih in zasedenih delovnih mest ")

g3 <- ggplot(izobrazba %>% filter(izobrazba == "Brez izobrazbe, nepopolna osnovnošolska"))+ aes(x = leto, y = stevilo)  + geom_line(col="red") + ggtitle("Število aktivnega prebivalstva brez izobrazbe v 1000") + xlab("Leto") + ylab("Število")

g4 <- ggplot(dejavnosti %>% filter(dejavnosti == "Predelovalne dejavnosti"))+ aes(x = leto, y = stevilo)  + geom_line(col="green") + ggtitle("Gibanje števila zaposlenih v pridelovalnih dejavnostih v 1000") + xlab("Leto") + ylab("Število") 

g5 <- ggplot(tabelahtml %>% filter(spremenljivke == "Unemployment rate(in Percent)")) + aes(x = leto, y = stevilo, group = 1)  + geom_line(col="black") +  ggtitle("Rast brezposelnosti v % ")   + theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1)) + xlab("Leto") + ylab("Število")



