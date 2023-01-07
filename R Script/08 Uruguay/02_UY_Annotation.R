# Install & Load Packages
# Package names
packages <- c("magick", "colorspace", "showtext", "ggplot2", "MetBrewer", "ggplot2")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

colours <- met.brewer("Hiroshige")

colours <- c(colours[6], colours[7], colours[8], colours[9], colours[10])
swatchplot(colours)

text_color <- darken(colours[5])
swatchplot(text_color)
annotate_text_colour <- darken(rgb(253, 209, 21, max = 255), 0.1)
swatchplot(annotate_text_colour)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Uruguay.png")
compass <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/compass.png")

img |> 
  image_crop(gravity = "center",
             geometry = "8000x4500") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+263+310",
                 color = text_color,
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("URUGUAY",
                 gravity = "northwest",
                 location = "+273+410",
                 color = text_color,
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3993+310",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3993+410",
                 size = 50,
                 font = "serif") |>
  image_annotate("MONTEVIDEO",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4329+4248",
                 size = 50,
                 font = "serif") |>
  image_annotate("RIVERA",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2110+1130",
                 size = 50,
                 font = "serif") |>
  image_annotate("ARTIGAS",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1100+1268",
                 size = 50,
                 font = "serif") |>
  image_annotate("SALTO",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+342+2707",
                 size = 50,
                 font = "serif") |>
  image_annotate("MALDONADO",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+5308+3675",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Uruguay_Final_Plot.png")
