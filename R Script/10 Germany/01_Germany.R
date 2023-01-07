# Install & Load Packages
# Package names
packages <- c("sf", "rayshader", "ggplot2", "stars", "colorspace", "MetBrewer", "measurements", "units")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))



# Set directory
setwd("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Data")

# Read geo_package - Kontur data
germany <- st_read("kontur_population_DE_20220630.gpkg")


## define aspect ratio based on bounding box
bb <- st_bbox(germany) 
bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(germany))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(germany))


width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |>
  st_sfc(crs = st_crs(germany))
height <- st_distance(bottom_left, top_left)


# Handle conditions of width or height being the longer side
if(width > height) {
  w_ratio <- 1
  h_ratio <- height / width
}else{
  h_ratio <- 1
  w_ratio <- width / height
}

# Convert to raster so we can then convert to matrix
size <- 5000

germany_rast <- st_rasterize(germany, nx = floor(size * 0.737), ny = floor(size * h_ratio))

mat <- matrix(germany_rast$population, nrow = floor(size * 0.737), ncol = floor(size * h_ratio))

# Create colour pallete
# c1 <- met.brewer("Cross")
# c1 <- c(#rgb(251,240,236, max = 255), rgb(222,218,225, max = 255), 
#         #rgb(192,190,216, max = 255),
#         #rgb(170,173,209, max = 255),
#         rgb(118,113,154, max = 255),
#         rgb(84,77,109, max = 255),
#         rgb(191,164,199, max = 255),
#         rgb(211,154,200, max = 255),
#         rgb(205,115,175, max = 255),
#         rgb(94,38,84, max = 255),
#         rgb(50,37,57, max = 255)
#         )
# 
# c1 <- c(
#   rgb(240, 235, 216, max = 255),
#   rgb(116, 140, 171, max = 255),
#   rgb(62, 92, 118, max = 255),
#   rgb(29, 45, 68, max = 255),
#   rgb(13, 19, 33, max = 255)
# )

c1 <- c(
  rgb(237, 242, 244, max = 255),
  rgb(141, 153, 174, max = 255),
  rgb(62, 92, 118, max = 255),
  rgb(43, 45, 66, max = 255),
  rgb(239, 35, 60, max = 255),
  rgb(216, 0, 50, max = 255)
)
  

swatchplot(c1)

texture <- grDevices::colorRampPalette(c1, bias = 2)(256)
swatchplot(texture)

# Plot that 3d thing!
rgl::rgl.close()

mat |>
  height_shade(texture = texture) |>
  plot_3d(heightmap = mat,
          zscale = 100 / 5,
          solid = FALSE,
          shadow = TRUE,
          shadowdepth = 5,
          linewidth = 5,
          soil = TRUE,
          background = rgb(253, 244, 239, max = 255))

render_camera(theta = 0, phi = 40, zoom = 0.7)

outfile <- "C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Germany.png"

render_highquality(
  filename = outfile,
  interactive = FALSE,
  lightdirection = 130,
  lightaltitude = c(45, 80),
  lightcolor = c(c1[2], "white"),
  lightintensity = c(600, 400),
  samples = 100,
  width = 6000,
  height = 6000
)



