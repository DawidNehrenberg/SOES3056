#Libraries
 #install.packages("marmap")
 library(marmap)
 library(httpgd)
 library(terra)
 library(viridis)
 hgd()
#Lab 4
 #sources for bathymetry data ETOPO, GEBCO
#Getting data
 papoue <- getNOAA.bathy(lon1 = 140, lon2 = 155, lat1 = -13, lat2 = 0, resolution = 4)
 #marmap stores rasters in its own data format
 class(papoue)
#Plotting data
 blues <- c("lightsteelblue4","lightsteelblue3", "lightsteelblue2", "lightsteelblue1")
 greys <- c(grey(0.6), grey(0.93), grey(0.99))
 plot(papoue, image = TRUE, land = TRUE, lwd = 0.03, bpal = list(c(0, max(papoue), greys), c(0, min(papoue), blues)))
 plot(papoue, n = 1, lwd = 0.4, add = TRUE)
#Converting to terra raster
 #terra and marmap have clashing namespaces
 papoue_raster <- marmap::as.raster(papoue)
 papoue_terra <- terra::rast(papoue_raster)
 plot(papoue_terra, axes = TRUE, main = "Papoue", col = topo.colors(125))
 res(papoue_terra) #gives you the grid resolution
 ext(papoue_terra) #gives you the extent of the grid
 minmax(papoue_terra) #gives you min and max values
 terra::hist(papoue_terra) #depth/height distributions
#depth groupings
 #min = -8731
 #max = 4019
 ranges <- seq(from = -8731.732, to = 4019.580, length.out = 10)
 #figure this out at a later date, could be a cool thing to figure out
#slope
 plot(terrain(papoue_terra, v = "slope"), col = viridis(n = 6))
 #raster images can be saved using writeRaster()