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

# Add fonts
font_add_google(family = "El-Messiri", "El Messiri")

colours <- met.brewer("OKeeffe2")
swatchplot(colours)

text_color <- darken(colours[7])

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Ukraine.png")

img |> 
  image_crop(gravity = "center",
             geometry = "7000x4000") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+3870+300",
                 color = rgb(1, 91, 187, max = 255),
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("UKRAINE",
                 gravity = "northwest",
                 location = "+3870+390",
                 color = rgb(1, 91, 187, max = 255),
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("Україна",
                 gravity = "northwest",
                 location = "+3870+760",
                 color = rgb(1, 91, 187, max = 255),
                 size = 200,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = alpha(rgb(1, 91, 187, max = 255), .5),
                 location = "+237+3404",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = alpha(rgb(1, 91, 187, max = 255), .5),
                 location = "+237+3504",
                 size = 50,
                 font = "serif") |>
  image_annotate("KYIV",
                 gravity = "northwest",
                 color = "black",
                 location = "+3587+1427",
                 size = 50,
                 font = "serif") |>
  image_annotate("KHARKIV",
                 gravity = "northwest",
                 color = "black",
                 location = "+5180+2737",
                 size = 50,
                 font = "serif") |>
  image_annotate("MARIUPOL",
                 gravity = "northwest",
                 color = "black",
                 location = "+3979+3895",
                 size = 50,
                 font = "serif") |>
  image_annotate("ODESSA",
                 gravity = "northwest",
                 color = "black",
                 location = "+1644+2456",
                 size = 50,
                 font = "serif") |>
  image_annotate("LVIV",
                 gravity = "northwest",
                 color = "black",
                 location = "+1262+840",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Ukraine_Final_Plot.png")
