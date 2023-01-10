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
gb <- st_read("kontur_population_GB_20220630.gpkg")


## define aspect ratio based on bounding box
bb <- st_bbox(gb) 
bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(gb))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |>
  st_sfc(crs = st_crs(gb))


width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |>
  st_sfc(crs = st_crs(gb))
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

gb_rast <- st_rasterize(gb, nx = floor(size * 0.532), ny = floor(size * h_ratio))

mat <- matrix(gb_rast$population, nrow = floor(size * 0.532), ncol = floor(size * h_ratio))

# Create colour pallete
c1 <- c(
  rgb(237, 242, 244, max = 255),
  rgb(72, 202, 228, max = 255),
  rgb(0, 119, 182, max = 255),
  rgb(3, 4, 94, max = 255),
  rgb(72, 191, 227, max = 255),
  rgb(114, 239, 221, max = 255)
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

render_camera(theta = 5, phi = 40, zoom = 0.6)

outfile <- "C:/Users/jeffr/OneDrive/Desktop/Renders/GB.png"

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



