
library(rgdal)
library(sf)
library(rmapshaper)

Ant <- readOGR(dsn='.',layer='Antarctica_EPSG3031')

adpe20 <- readOGR(dsn='.',layer="adpe481_20k_wgs84")
adpe30 <- readOGR(dsn='.',layer="adpe481_30k_wgs84")
adpe40 <- readOGR(dsn='.',layer="adpe481_40k_wgs84")
adpe60 <- readOGR(dsn='.',layer="adpe481_60k_wgs84")

chpe20 <- readOGR(dsn='.',layer="chpe481_20k_wgs84")
chpe30 <- readOGR(dsn='.',layer="chpe481_30k_wgs84")
chpe40 <- readOGR(dsn='.',layer="chpe481_40k_wgs84")
chpe60 <- readOGR(dsn='.',layer="chpe481_60k_wgs84")

gepe20 <- readOGR(dsn='.',layer="gepe481_20k_wgs84")
gepe30 <- readOGR(dsn='.',layer="gepe481_30k_wgs84")
gepe40 <- readOGR(dsn='.',layer="gepe481_40k_wgs84")
gepe60 <- readOGR(dsn='.',layer="gepe481_60k_wgs84")

empe20 <- readOGR(dsn='.',layer="empe481_20k_wgs84")
empe30 <- readOGR(dsn='.',layer="empe481_30k_wgs84")
empe40 <- readOGR(dsn='.',layer="empe481_40k_wgs84")
empe60 <- readOGR(dsn='.',layer="empe481_60k_wgs84")

all20 <- readOGR(dsn='.',layer="all481_20k_wgs84_dissolve")
all30 <- readOGR(dsn='.',layer="all481_30k_wgs84_dissolve")
all40 <- readOGR(dsn='.',layer="all481_40k_wgs84_dissolve")
all60 <- readOGR(dsn='.',layer="all481_60k_wgs84_dissolve")


#############

all20New <- ms_erase(all20,Ant)
all30New <- ms_erase(all30,Ant)
all40New <- ms_erase(all40,Ant)
all60New <- ms_erase(all60,Ant)

adpe20New <- ms_erase(adpe20,Ant)
adpe30New <- ms_erase(adpe30,Ant)
adpe40New <- ms_erase(adpe40,Ant)
adpe60New <- ms_erase(adpe60,Ant)

chpe20New <- ms_erase(chpe20,Ant)
chpe30New <- ms_erase(chpe30,Ant)
chpe40New <- ms_erase(chpe40,Ant)
chpe60New <- ms_erase(chpe60,Ant)

empe20New <- ms_erase(empe20,Ant)
empe30New <- ms_erase(empe30,Ant)
empe40New <- ms_erase(empe40,Ant)
empe60New <- ms_erase(empe60,Ant)

gepe20New <- ms_erase(gepe20,Ant)
gepe30New <- ms_erase(gepe30,Ant)
gepe40New <- ms_erase(gepe40,Ant)
gepe60New <- ms_erase(gepe60,Ant)


################################


saveRDS(all20New,'all_20k.rds')
saveRDS(all30New,'all_30k.rds')
saveRDS(all40New,'all_40k.rds')
saveRDS(all60New,'all_60k.rds')

saveRDS(adpe20New,'adpe_20k.rds')
saveRDS(adpe30New,'adpe_30k.rds')
saveRDS(adpe40New,'adpe_40k.rds')
saveRDS(adpe60New,'adpe_60k.rds')

saveRDS(chpe20New,'chpe_20k.rds')
saveRDS(chpe30New,'chpe_30k.rds')
saveRDS(chpe40New,'chpe_40k.rds')
saveRDS(chpe60New,'chpe_60k.rds')

saveRDS(empe20New,'empe_20k.rds')
saveRDS(empe30New,'empe_30k.rds')
saveRDS(empe40New,'empe_40k.rds')
saveRDS(empe60New,'empe_60k.rds')

saveRDS(gepe20New,'gepe_20k.rds')
saveRDS(gepe30New,'gepe_30k.rds')
saveRDS(gepe40New,'gepe_40k.rds')
saveRDS(gepe60New,'gepe_60k.rds')




Ant <- readOGR(dsn='.',layer='Ant_clipped_4326')

Ant2 <- spTransform(Ant,proj4string(chpe20))




