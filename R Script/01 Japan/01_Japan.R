# Install & Load Packages
# Package names
packages <- c("sf", "rayshader", "ggplot2", "stars", "colorspace")

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
japan <- st_read("kontur_population_JP_20220630.gpkg")


## define aspect ratio based on bounding box
bb <- st_bbox(japan)
bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(japan))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(japan))


width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |>
  st_sfc(crs = st_crs(japan))
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
japan_rast <- st_rasterize(japan, nx = floor(size * w_ratio), ny = floor(size * h_ratio))

mat <- matrix(japan_rast$population, nrow = floor(size * w_ratio), ncol = floor(size * h_ratio))

# Create colour pallete
c1 <- c("#cad2c5", "#84a98c", "#52796f", "#354f52", "#2f3e46")
swatchplot(c1)

texture <- grDevices::colorRampPalette(c1)(256)
swatchplot(texture)

# Plot that 3d thing!
rgl::rgl.close()

mat |>
  height_shade(texture = texture) |>
  plot_3d(heightmap = mat,
          zscale = 100 / 5,
          solid = FALSE,
          shadowdepth = 0)

render_camera(theta = 5, phi = 40, zoom = 0.54)

outfile <- "C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Japan.png"

render_highquality(
  filename = outfile,
  interactive = FALSE,
  lightdirection = 340,
  lightaltitude = c(45, 80),
  lightcolor = c(c1[2], "white"),
  lightintensity = c(600, 100),
  samples = 50,
  width = 6000,
  height = 6000
)



