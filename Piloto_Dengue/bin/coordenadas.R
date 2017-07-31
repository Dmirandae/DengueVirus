#Codigo tomado y modificado de: https://gist.github.com/josecarlosgonz/6417633
http://www.jose-gonzalez.org/using-google-maps-api-r/#.WF6hL2cX77h
https://www.r-bloggers.com/placement-an-r-package-to-access-the-google-maps-api/

library(devtools)
#install_github("DerekYves/placement")
library(placement)
library(RCurl)
library(RJSONIO)
library(plyr)
library(jsonlite)

url <- function(address, return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root, return.call, "?address=", address, "&sensor=", sensor, sep = "")
  return(URLencode(u))
}


geoCode <- function(address,verbose=FALSE) {
  if(verbose) cat(address,"\n")
  u <- url(address)
  doc <- getURL(u)
  x <- fromJSON(doc,simplifyVector = FALSE)
  if(x$status=="OK") {
    lat <- x$results[[1]]$geometry$location$lat
    lng <- x$results[[1]]$geometry$location$lng
    location_type  <- x$results[[1]]$geometry$location_type
    formatted_address  <- x$results[[1]]$formatted_address
    return(c(lat, lng, location_type, formatted_address))
    Sys.sleep(0.5)
  } else {
    return(c(NA,NA,NA, NA))
  }
}


address<- geoCode("Charalá")
address

# We can use Plyr to geocode a vector with addresses

address <- c("The White House, Washington, DC","The Capitol, Washington, DC")
locations  <- ldply(address, function(x) geoCode(x))
names(locations)  <- c("lat","lon","location_type", "formatted")
head(locations)



datos <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue_2017/bd_total_0717.csv", stringsAsFactors = F)

datos_pais <- datos$Country

paises <- unique(datos_pais)

coordenadas_pais <- ldply(paises, function(x) geoCode(x))
names(coordenadas_pais)  <- c("lat","lon","location_type", "formatted")
head(coordenadas_pais)



#The following are the different location types:
  
#  "ROOFTOP" indicates that the returned result is a precise geocode for which we have location information accurate down to street address precision.
#RANGE_INTERPOLATED" indicates that the returned result reflects an approximation (usually on a road) interpolated between two precise points (such as intersections). Interpolated results are generally returned when rooftop geocodes are unavailable for a street address.
#    GEOMETRIC_CENTER" indicates that the returned result is the geometric center of a result such as a polyline (for example, a street) or polygon (region).
#APPROXIMATE" indicates that the returned result is approximate.

?geonames
