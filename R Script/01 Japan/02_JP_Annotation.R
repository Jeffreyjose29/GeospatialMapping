# Install & Load Packages
# Package names
packages <- c("magick", "colorspace", "showtext", "ggplot2")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

# Add fonts
font_add_google(family = "El-Messiri", "El Messiri")

colours <- c("#cad2c5", "#84a98c", "#52796f", "#354f52", "#2f3e46")
swatchplot(colours)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Japan.png")

img |>
  image_crop(gravity = "center",
             geometry = "4961x3508") |>
  image_annotate("Population Density Map",
                 gravity = "northwest",
                 location = "+200+200",
                 color = colours[5],
                 size = 80,
                 weight = 700) |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Japan_Final_Plot.png")


img |> 
  image_crop(gravity = "center",
             geometry = "4961x3508") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+200+300",
                 color = colours[5],
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("JAPAN",
                 gravity = "northwest",
                 location = "+200+400",
                 color = colours[5],
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "southeast",
                 color = alpha(colours[5], .5),
                 location = "+200+400",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR POPULATION (RELEASED 2022-06-30)",
                 gravity = "southeast",
                 color = alpha(colours[5], .5),
                 location = "+200+300",
                 size = 50,
                 font = "serif") |>
  image_annotate("TOKYO",
                 gravity = "north",
                 color = colours[5],
                 location = "+525+2075",
                 size = 50,
                 font = "serif") |>
  image_annotate("KYOTO",
                 gravity = "north",
                 color = colours[5],
                 location = "-150+2175",
                 size = 50,
                 font = "serif") |>
  image_annotate("OSAKA",
                 gravity = "north",
                 color = colours[5],
                 location = "-550+2250",
                 size = 50,
                 font = "serif") |>
  image_annotate("KOBE",
                 gravity = "north",
                 color = colours[5],
                 location = "-770+1625",
                 size = 50,
                 font = "serif") |>
  image_annotate("FUKUOKA",
                 gravity = "north",
                 color = colours[5],
                 location = "-1800+1800",
                 size = 50,
                 font = "serif") |>
  image_annotate("SAPPORO",
                 gravity = "north",
                 color = colours[5],
                 location = "+550+450",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Japan_Final_Plot.png")
