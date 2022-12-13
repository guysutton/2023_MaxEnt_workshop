# Script 001: Download and visualise environmental layers (rasters)

# -----------------------------------------------------------------------------
# Session setup
# -----------------------------------------------------------------------------

# Load required packages
if (!require("pacman"))
  install.packages("pacman")
pacman::p_load(
  tidyverse,
  dismo,
  raster,
  here,
  corrplot,
  Hmisc,
  patchwork,
  ecospat,
  # kuenm,
  gridSVG,
  gridExtra,
  grid,
  ENMeval,
  spThin,
  viridis,
  viridisLite,
  mapdata,
  maptools,
  scales,
  geosphere,
  rgdal,
  ggtext,
  rJava,
  rgeos,
  sp,
  sf,
  ggspatial,
  ecospat,
  rnaturalearth,
  rnaturalearthdata,
  # megaSDM,
  InformationValue,
  caret, 
  terra,
  geodata
)


# Change ggplot theme
theme_set(
  theme_classic() +
    theme(
      panel.border = element_rect(colour = "black",
                                  fill = NA),
      axis.text = element_text(colour = "black"),
      axis.title.x = element_text(margin = unit(c(2, 0, 0, 0),
                                                "mm")),
      axis.title.y = element_text(margin = unit(c(0, 4, 0, 0),
                                                "mm")),
      legend.position = "none"
    )
)

# Set the theme for the maps
theme_opts <- list(
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = 'white', colour = NA),
    plot.background = element_rect(),
    axis.line = element_blank(),
    axis.text.x = element_text(colour = "black"),
    axis.text.y = element_text(colour = "black"),
    axis.ticks = element_line(colour = "black"),
    axis.title.x = element_text(colour = "black"),
    axis.title.y = element_text(colour = "black"),
    plot.title = element_text(colour = "black"),
    panel.border = element_rect(fill = NA),
    legend.key = element_blank()
  )
)


# -----------------------------------------------------------------------------
# Download climate raster layers 
# -----------------------------------------------------------------------------

# Download the WORLDCLIM raster layers for current time period to your PC
# - This will download and store all 19 WORLDCLIM layers to a folder
#   of your choice (given using 'path = ...' below)
# - Raster layers are stored as 'SpatRaster' so they are compatible with the 
#   'terra' R package 
wc_current <- geodata::worldclim_global(
  var = "bio", 
  res = 2.5,      # Minute degree resolution of raster layers 
  path = here::here("./data/environmental_layers/current/"), 
  version = "2.1"
  )

# Plot each of the 19 WORLDCLIM layers to check they imported correctly 
terra::plot(wc_current)

# Set the CRS projection for the current climate layers 
# - Use the correct wkt CRS format - no more PROJ4 strings! 
terra::crs(wc_current) <- "epsg:4326"
terra::crs(wc_current, describe = T)





