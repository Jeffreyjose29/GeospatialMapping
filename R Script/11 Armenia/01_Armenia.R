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
setwd("C:/Users/jeffr/OneDrive/Desktop/Data")

# Read geo_package - Kontur data
armenia <- st_read("kontur_population_AM_20220630.gpkg")


## define aspect ratio based on bounding box
bb <- st_bbox(armenia) 
bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(armenia))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(armenia))


width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |>
  st_sfc(crs = st_crs(armenia))
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

armenia_rast <- st_rasterize(armenia, nx = floor(size * 0.99), ny = floor(size * h_ratio))

mat <- matrix(armenia_rast$population, nrow = floor(size * 0.99), ncol = floor(size * h_ratio))

# Create colour pallete
c1 <- c(
  rgb(240, 235, 216, max = 255),
  rgb(116, 140, 171, max = 255),
  rgb(62, 92, 118, max = 255),
  rgb(29, 45, 68, max = 255),
  rgb(13, 19, 33, max = 255)
)

swatchplot(c1)

texture <- grDevices::colorRampPalette(c1, bias = 2)(256)
swatchplot(texture)

# Plot that 3d thing!
rgl::rgl.close()

mat |>
  height_shade(texture = texture) |>
  plot_3d(heightmap = mat,
          zscale = 100/5,
          solid = FALSE,
          shadow = TRUE,
          shadowdepth = 5,
          linewidth = 5,
          soil = TRUE,
          background = rgb(253, 244, 239, max = 255))

render_camera(theta = 5, phi = 30, zoom = 0.7)

outfile <- "C:/Users/jeffr/OneDrive/Desktop/Renders/Armenia.png"

render_highquality(
  filename = outfile,
  interactive = FALSE,
  lightdirection = 20,
  lightaltitude = c(45, 80),
  lightcolor = c(c1[2], "white"),
  lightintensity = c(600, 400),
  samples = 100,
  width = 6000,
  height = 6000
)



