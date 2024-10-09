library(mapview)
library(sf)
library(lubridate)
library(ctmm)

fname <- "/Users/bbarrett/Documents/suricata_hr_groups/doi_10_5061_dryad_4b8gtht7r__v20191202/trackingData.csv" #this will need to be changd to your folder

g <- st_read(fname , package='sf')
g$latitude <- parse_lat(g$latitude)#convert to decimal coords
g$longitude <- parse_lon(g$longitude)#convert to decimal coords
g2 <- st_as_sf(g, coords=c("Longitude", "Latitude"), crs = 4326 ) 
str(g2)
g2$year <- year(g2$TimestampUTC)
mapview(g2[g2$year==2017,] , zcol="GroupNumber" , cex=1.5)

mapview(g2[g2$GroupNumber==1,] , zcol="year" , cex=1.5)
mapview(g2[g2$GroupNumber==2,] , zcol="year" , cex=1.5)
g2$GroupNumber <- as.integer(g2$GroupNumber)
g2$year <- as.integer(g2$year)

for (i in 1:max(g2$GroupNumber)){
mapview(g2[g2$GroupNumber==i,] , zcol="year" , cex=1.5)
}
for (i in 1:24){
  mapview(g2[g2$GroupNumber==i,] , zcol="year" , cex=1.5)
}

str(g2)
##need to break up into 3 month chunks
#Jun-Aug, Oct-Dec, Jan-Mar, Mar-May

###ctmm
#Load package

library (ctmm)

#Load example buffalo data

data("buffalo")

#Extract data for buffalo 1, Cilla

cilla<- buffalo[[1]]

#Plot the positions
#Load package

library (ctmm)

#Load example buffalo data

data("buffalo")

#Extract data for buffalo 1, Cilla

cilla<- buffalo[[1]]

#Plot the positions

plot(cilla)

#Calculate variogram

vg.cilla <- variogram(cilla)

#Plot up to 50% of the maximum lag in the data

plot(vg.cilla)

#Zoom in on the shortest lags

plot(vg.cilla, fraction=0.005)
