# Analiza podatkov s programom R, 2019/20

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2019/20

* [![Shiny](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/evawinkler/APPR-2019-20/master?urlpath=shiny/APPR-2019-20/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/evawinkler/APPR-2019-20/master?urlpath=rstudio) RStudio

## Analiza trga dela v Sloveniji

V projektni nalogi bom analizira trg dela v Sloveniji s pomočjo dejavnikov, ki vplivajo nanj. Osredotočila se bom na obdobje od leta 2008 do leta 2018. Najprej bom analizirala delovno aktivno prebivalstvo, brezposelno prebivalstvo ter prosta mesta. V nadaljevanju pa se dotaknila še plač. Cilj naloge je predstaviti stanje na trgu dela v zadnjem desetletju. Podatke bom poiskala na Statističnem uradu Republike Slovenije.

1. tabela: Prosta delovna mesta glede na dejavnosti 
https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__07_trg_dela__30_07146_prosta_mesta/0714611S.px/

2. tabela : Delovno aktivno prebivalstvo glede na dejavnosti 
https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__07_trg_dela__02_07008_akt_preb_po_anketi__01_07620_akt_preb_ADS_cetrt/0762005S.px/

3. tabela : Prebivalci glede na aktivnost (aktivni, neaktivni, brezposelni)  
https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__07_trg_dela__02_07008_akt_preb_po_anketi__01_07620_akt_preb_ADS_cetrt/0762001S.px/

4. tabela : Povprečne mesečne plače po dejavnostih (bruto plače)  
https://pxweb.stat.si/SiStatDb/pxweb/sl/10_Dem_soc/10_Dem_soc__07_trg_dela__10_place__01_07010_place/0701011S.px/



## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `tidyr` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
