#Libraries###############################################################
 library(sf)
 library(terra)
 library(spData)
 library(spDataLarge)
 library(httpgd)
 library(tidyverse)
 hgd()
#Vector data###############################################################
 #sf has its own data classes for geographic vector data
  #GDAL - reading, writing, manipulating geographic data
  #PROJ - library for coordinate system transformations
  #GEOS - planar geometry engine for operations such as calculating
   #buffers and centroidson data with a projected CRS
  #S2 - spherical geometry engine
#Simple features###########################################################
 #raster classes are not supported by sf
 #vignette("sf1")
 class(world)
 names(world)
 df <- world
 plot(world)
 world_mini <- world[1:2, 1:3]
#Why Simple Features#######################################################
 world_dfr <- st_read(system.file("shapes/world.shp", package = "spData"))
 world_tbl <- read_sf(system.file("shapes/world.shp", package = "spData"))
#Basic Maps################################################################
 plot(world[3:6])
 plot(world["pop"])
 world_asia <- world[world$continent == "Asia",]
 asia <- st_union(world_asia) 
 plot(world["pop"], reset = FALSE)
 plot(asia, add = TRUE, col = "red")
 plot(world["continent"], reset = FALSE) #map of the world
 cex <- sqrt(world$pop) / 10000
 world_cents <- st_centroid(world, of_largest = TRUE)
 plot(st_geometry(world_cents), add = TRUE, cex = cex)
 #cex sets the diameter of circles
 india <- world[world$name_long == "India", ]
 plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3)
 plot(st_geometry(world_asia), add = TRUE)
#Geometry Types#############################################################
#sf class###################################################################
 lnd_point <- st_point(c(0.1, 51.5))                 # sfg object
 lnd_geom <- st_sfc(lnd_point, crs = "EPSG:4326")    # sfc object
 lnd_attrib <- data.frame(                           # data.frame object
  name = "London", temperature = 25, date = as.Date("2023-06-21"))
 lnd_sf <- st_sf(lnd_attrib, geometry = lnd_geom)    # sf object
 lnd_sf
#Simple feature geometries##################################################
 #st_point creates single points from numeric vectors
 st_point(c(5, 2))                 # XY point
 #> POINT (5 2)
 st_point(c(5, 2, 3))              # XYZ point
 #> POINT Z (5 2 3)
 st_point(c(5, 2, 1), dim = "XYM") # XYM point
 #> POINT M (5 2 1)
 st_point(c(5, 2, 3, 1))           # XYZM point
 #> POINT ZM (5 2 3 1)