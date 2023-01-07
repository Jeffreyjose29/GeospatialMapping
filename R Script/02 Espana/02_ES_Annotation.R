# Install & Load Packages
# Package names
packages <- c("magick", "colorspace", "showtext", "ggplot2", "MetBrewer")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

# Add fonts
font_add_google(family = "El-Messiri", "El Messiri")

colours <- met.brewer("OKeeffe2")
swatchplot(colours)

text_color <- darken(colours[7])

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Espana.png")

img |> 
  image_crop(gravity = "center",
             geometry = "7000x4000") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "southwest",
                 location = "+200+750",
                 color = "black",
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("ESPAÑA",
                 gravity = "southwest",
                 location = "+200+300",
                 color = "black",
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("ISLAS CANARIAS NOT SHOWN",
                 gravity = "southwest",
                 location = "+200+200",
                 color = "black",
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "southeast",
                 color = alpha("black", .5),
                 location = "+200+400",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR POPULATION (RELEASED 2022-06-30)",
                 gravity = "southeast",
                 color = alpha("black", .5),
                 location = "+200+300",
                 size = 50,
                 font = "serif") |>
  image_annotate("BILBAO",
                 gravity = "northwest",
                 color = "black",
                 location = "+2271+182",
                 size = 50,
                 font = "serif") |>
  image_annotate("BARCELONA",
                 gravity = "northwest",
                 color = "black",
                 location = "+4925+609",
                 size = 50,
                 font = "serif") |>
  image_annotate("PALMA",
                 gravity = "northwest",
                 color = "black",
                 location = "+5461+1201",
                 size = 50,
                 font = "serif") |>
  image_annotate("IBIZA",
                 gravity = "northwest",
                 color = "black",
                 location = "+5228+1413",
                 size = 50,
                 font = "serif") |>
  image_annotate("VALENCIA",
                 gravity = "northwest",
                 color = "black",
                 location = "+4500+1207",
                 size = 50,
                 font = "serif") |>
  image_annotate("MADIRID",
                 gravity = "northwest",
                 color = "black",
                 location = "+3246+1411",
                 size = 50,
                 font = "serif") |>
  image_annotate("SEVILLA",
                 gravity = "northwest",
                 color = "black",
                 location = "+2787+2979",
                 size = 50,
                 font = "serif") |>
  image_annotate("LA CORUÑA",
                 gravity = "northwest",
                 color = "black",
                 location = "+312+1326",
                 size = 50,
                 font = "serif") |>
  image_annotate("ZARAGOZA",
                 gravity = "northwest",
                 color = "black",
                 location = "+3708+1022",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Espana_Final_Plot.png")
