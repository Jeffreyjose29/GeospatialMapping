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
uruguay <- st_read("kontur_population_UY_20220630.gpkg")


## define aspect ratio based on bounding box
bb <- st_bbox(uruguay) 
bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(uruguay))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(uruguay))


width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |>
  st_sfc(crs = st_crs(uruguay))
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

uruguay_rast <- st_rasterize(uruguay, nx = floor(size * 0.887), ny = floor(size * h_ratio))

mat <- matrix(uruguay_rast$population, nrow = floor(size * w_ratio), ncol = floor(size * h_ratio))

# Create colour pallete
c1 <- met.brewer("Hiroshige")
#c1 <- c(c1[7], c1[6], c1[5], c1[4], c1[3], c1[2], c1[1])
c1 <- c(c1[6], c1[7], c1[8], c1[9], c1[10])
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
          shadowdepth = 0,
          linewidth = 5,
          soil = TRUE)

render_camera(theta = -40, phi = 50, zoom = 0.7)

outfile <- "C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Uruguay.png"

render_highquality(
  filename = outfile,
  interactive = FALSE,
  lightdirection = 300,
  lightaltitude = c(45, 80),
  lightcolor = c(c1[2], "white"),
  lightintensity = c(600, 400),
  samples = 100,
  width = 6000,
  height = 6000
)



