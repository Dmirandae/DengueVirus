###################################################################################
#                            DISTANCIAS GEOGRAFICAS                               #
#                             GEOGRAPHIC DISTANCE                                 #
###################################################################################

#paquetes posibles
library(?fossil)

#este paquete requiere raster
library(?dismo)
library(raster)

# geodist

geodist(55.75,37.63, 39.9,116.4)  # Moscow - Beijing
geodist(90,0, -90,0, "nm")        # from pole to pole


library(maptool)


# calcular centroide

library(sp)
library(rgdal)
library(rgeos)

# getting sample data of the three main Belgian regions
tmpdir <- tempdir()
download.file("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_map_subunits.zip", "world.zip")
unzip("world.zip", exdir = tmpdir )
shapefile <- paste0(tmpdir,"/ne_10m_admin_0_map_subunits.shp")
world <- readOGR(shapefile, "ne_10m_admin_0_map_subunits")
unlink(tmpdir)
belgium <- world[world$ADM0_A3 == "BEL", ]

centroids <- gCentroid(belgium, byid=TRUE)
spDists(centroids, longlat=TRUE)  #distance in km