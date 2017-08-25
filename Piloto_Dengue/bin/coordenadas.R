######################################################################################
# Obtencion de coordenadas geograficas a partir de nombre del pais y localidad #######
#                       Usando la API de Google Maps                           #######
# Codigo tomado y modificado de: https://gist.github.com/josecarlosgonz/6417633 ######
#--------------------------------------------------------------------------------#####
# Paginas de referencia:                                                            ##
# http://www.jose-gonzalez.org/using-google-maps-api-r/#.WF6hL2cX77h                ##
# https://www.r-bloggers.com/placement-an-r-package-to-access-the-google-maps-api/  ##
######################################################################################

# Paquetes requeridos:

library(devtools)
library(placement)
library(RCurl)
library(RJSONIO)
library(plyr)
library(jsonlite)

# Funcion url para acceder a la API de GoogleMaps

url <- function(address, return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/geocode/"
  u <- paste(root, return.call, "?address=", address, "&sensor=", sensor, sep = "")
  return(URLencode(u))
}


# Funcion geoCode para extraer las coordenadas en latitud, longitud a partir 
# del nombre de un lugar, asi como el tipo de localización (se explica mas abajo)
# y el formato de la direccion que ha sido reconocida por GoogleMaps

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


# Un pequeno ejemplo
#address<- geoCode("Charalá")
#address

# Ejemplo de como usar la funcion ldply para obtener las coordenadas desdes un vector con
# varias nombres de lugares
# We can use Plyr to geocode a vector with addresses

address <- c("The White House, Washington, DC","The Capitol, Washington, DC")
locations  <- ldply(address, function(x) geoCode(x))
names(locations)  <- c("lat","lon","location_type", "formatted")
head(locations)

# Tipos de localizacion:
#The following are the different location types:

# "ROOFTOP" indicates that the returned result is a precise geocode for which we have location information accurate down to street address precision.
# "RANGE_INTERPOLATED" indicates that the returned result reflects an approximation (usually on a road) interpolated between two precise points (such as intersections). Interpolated results are generally returned when rooftop geocodes are unavailable for a street address.
# "GEOMETRIC_CENTER" indicates that the returned result is the geometric center of a result such as a polyline (for example, a street) or polygon (region).
# "APPROXIMATE" indicates that the returned result is approximate

#--------------------------------------------------------------------------------------###

##################################################
## Usando los datos de los paises y localidades ##
## donde se ha reportado el virus del Dengue    ##
##################################################

# Base de datos del virus del Dengue: 

datos <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue.csv", stringsAsFactors = F)

# Para PAISES:
# Extracion de los paises reportados

datos_pais <- datos$Country

paises <- unique(datos_pais)
paises <- na.omit(paises)
length(paises)

#Busqueda de las coordenadas geograficas a partir del vector "paises":

coordenadas_paises <- ldply(paises, function(x) geoCode(x))
names(coordenadas_paises)  <- c("lat","lon","location_type", "formatted")
head(coordenadas_paises)
nrow(coordenadas_paises)

# Anadir los datos de latitud, longitud como nuevas columnas a la base de datos de Dengue

coordenadas_paises$formatted <- as.character(coordenadas_paises$formatted)

for(i in 1:length(coordenadas_paises$formatted)){
  datos[which(datos$Country==paises[i]),"lat_country"] <- coordenadas_paises$lat[i]
  datos[which(datos$Country==paises[i]),"lon_country"] <- coordenadas_paises$lon[i]
  datos[which(datos$Country==paises[i]),"locationtype_country"] <- coordenadas_paises$location_type[i]
  datos[which(datos$Country==paises[i]),"formatted_country"] <- coordenadas_paises$formatted[i]
}
##----------------------------------------------------------------------------------######

# Para LOCALIDADES
# Extraccion de las localidades reportadas

datos_localidad <- datos$Localization

# Para realizar la busqueda de las coordenadas de las localidades reportadas para dengue
# es necesario no solo el nombre de la localidad, sino tambien del pais, ya que una
# localidad puede tener el mismo nombre en mas de un pais, para evitar este sesgo
# se unen el vector pais con el vector localidades para los registros que contengan estos
# dos datos (pais y localidad) y con el nuevo vector se realiza la busqueda de las coordenadas

# Las posiciones de los registros de localidades sin NAs

localidad <- which(is.na(datos_localidad)==F)

# Nombres de las localidades unicas
nombres_localidad <- unique(datos_localidad[which(is.na(datos_localidad)==F)])
length(nombres_localidad)

# Unir el nombre de la localidad con su pais corespondiente y lo guardamos en un nuevo
# vector llamada "localidad_pais"

localidad_pais <- vector()

for(i in 1:length(localidad)){
  localidad_pais[i] <- paste(datos_localidad[localidad[i]],", ",datos_pais[localidad[i]], sep = "")
}

localidad_pais <- unique(localidad_pais)
length(localidad_pais)

# Zhejiang(4), 
# Hyderabad(1, en internet dice que es una ciudad de la India), 
# Amazonas(1), 
# Abidjan(1, ya lo modifique en la base de datos)
# Revizar los gb de Dominica en comentarios


# Busqueda de las coordenadas geograficas a partir del vector "localidad_pais":

coordenadas_localidades <- ldply(localidad_pais, function(x) geoCode(x))
names(coordenadas_localidades)  <- c("lat","lon","location_type", "formatted")
head(coordenadas_localidades)

# Anadir los datos de latitud, longitud como nuevas columnas a la base de datos de Dengue
# Para localidades

coordenadas_localidades$formatted <- as.character(coordenadas_localidades$formatted)

for(i in 1:length(coordenadas_localidades$formatted)){
  datos[which(datos$Localization==nombres_localidad[i]),"lat_localization"] <- coordenadas_localidades$lat[i]
  datos[which(datos$Localization==nombres_localidad[i]),"lon_localization"] <- coordenadas_localidades$lon[i]
  datos[which(datos$Localization==nombres_localidad[i]),"locationtype_localization"] <- coordenadas_localidades$location_type[i]
  datos[which(datos$Localization==nombres_localidad[i]),"formatted_localization"] <- coordenadas_localidades$formatted[i]
}

write.csv(datos, file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue.csv")