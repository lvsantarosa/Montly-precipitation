library(prism)
library(terra)
library(tidyverse)
library(tidyterra)
library(scico)
library(httr)

setwd('C:/Users/Notebook/Desktop/Precp_maps/')

#Open Imerg data dawnloaded from https://giovanni.gsfc.nasa.gov/giovanni/

list <- list.files('Imerg/', full.names = TRUE, pattern = ".tif$")

PREC_M <- rast(list)
names <- c("JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER")
names(PREC_M) = names

##Open the shapefiles from https://giovanni.gsfc.nasa.gov/giovanni/
BR <- vect('shp/BR.shp')
AMAZ <- vect('shp/AMAZ.shp')
CERR <- vect('shp/CERR.shp')
MTAT <- vect('shp/MTAT.shp')

##Mask the raster to biome areas
PREC_AMAZ <- mask(PREC_M, AMAZ)
PREC_CERR <- mask(PREC_M, CERR)
PREC_MTAT <- mask(PREC_M, MTAT)

## plot organization from https://michaelpaulschramm.com/posts/2022-07-22-drought/
#plor BR
ggplot() +
  geom_spatraster(data = PREC_M) +
  geom_spatvector(data = BR, fill = NA, size = 0.1) +
  scale_fill_scico(name = "Precipitation (mm)", palette = "lapaz", direction = -1,
                   breaks = c(0,100,200,300,400,500),
                   na.value = "transparent") +
  facet_wrap(~lyr, ncol = 3, nrow = 4) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        strip.text = element_text(hjust = 0, size = 9),
        strip.background = element_blank(),
        legend.position = "right",
        legend.direction = "vertical",
        legend.key.height = ggplot2::unit(40L, "pt")) +
  labs(caption = "2001-2021 Monthly Precipitation\nSource: GPM IMERGM v06 Final Run - Spatial Resolution 0.1 deg.")


## plot AMAZ 
ggplot() +
  geom_spatraster(data = PREC_AMAZ) +
  geom_spatvector(data = BR, fill = NA, size = 0.1) +
  geom_spatvector(data = AMAZ, fill = NA, size = 0.1) +
  scale_fill_scico(name = "Precipitation (mm)", palette = "lapaz", direction = -1,
                   breaks = c(0,100,200,300,400,500),
                   na.value = "transparent") +
  facet_wrap(~lyr, ncol = 3, nrow = 4) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        strip.text = element_text(hjust = 0, size = 9),
        strip.background = element_blank(),
        legend.position = "right",
        legend.direction = "vertical",
        legend.key.height = ggplot2::unit(40L, "pt")) +
  labs(caption = "2001-2021 Monthly Precipitation\nSource: GPM IMERGM v06 Final Run - Spatial Resolution 0.1 deg.")

## plot CERR 
ggplot() +
  geom_spatraster(data = PREC_CERR) +
  geom_spatvector(data = BR, fill = NA, size = 0.1) +
  geom_spatvector(data = CERR, fill = NA, size = 0.1) +
  scale_fill_scico(name = "Precipitation (mm)", palette = "lapaz", direction = -1,
                   breaks = c(0,100,200,300,400,500),
                   na.value = "transparent") +
  facet_wrap(~lyr, ncol = 3, nrow = 4) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        strip.text = element_text(hjust = 0, size = 9),
        strip.background = element_blank(),
        legend.position = "right",
        legend.direction = "vertical",
        legend.key.height = ggplot2::unit(40L, "pt")) +
  labs(caption = "2001-2021 Monthly Precipitation\nSource: GPM IMERGM v06 Final Run - Spatial Resolution 0.1 deg.")

## plot MTAT
ggplot() +
  geom_spatraster(data = PREC_MTAT) +
  geom_spatvector(data = BR, fill = NA, size = 0.1) +
  geom_spatvector(data = MTAT, fill = NA, size = 0.1) +
  scale_fill_scico(name = "Precipitation (mm)", palette = "lapaz", direction = -1,
                   breaks = c(0,100,200,300,400,500),
                   na.value = "transparent") +
  facet_wrap(~lyr, ncol = 3, nrow = 4) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        strip.text = element_text(hjust = 0, size = 9),
        strip.background = element_blank(),
        legend.position = "right",
        legend.direction = "vertical",
        legend.key.height = ggplot2::unit(40L, "pt")) +
  labs(caption = "2001-2021 Monthly Precipitation\nSource: GPM IMERGM v06 Final Run - Spatial Resolution 0.1 deg.")

