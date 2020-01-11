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

 

z1 <- tm_shape(merge(zemljevid, povprecje.regije, by.x="NAME_1", by.y="regije" ))+ tm_polygons("povprecje") 

g1 <- ggplot(data = vsota.zasedena,aes(x=leto, y=vsota)) + geom_line(col="blue")+ ggtitle("Število zasedenih mest v zadnjem destletju")
g2 <- ggplot(data = vsota.prosta,aes(x=leto, y=vsota)) + geom_point(col="green")+ ggtitle("Število prostih mest v zadnjem destletju")


g3 <- ggplot(izobrazba %>% filter(izobrazba == "Brez izobrazbe, nepopolna osnovnošolska"))+ aes(x = leto, y = stevilo)  + geom_line(col="red") + ggtitle("Število aktivnega prebivalstva brez izobrazbe")


g4 <- ggplot(dejavnosti %>% filter(dejavnosti == "Predelovalne dejavnosti")) + aes( x = leto , y = stevilo) + geom_point() + ggtitle("Gibanje števila zaposlenih v pridelovalnih dejavnostih")