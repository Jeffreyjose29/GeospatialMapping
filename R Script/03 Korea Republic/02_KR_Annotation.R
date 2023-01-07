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

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Korea.png")


img |> 
  image_crop(gravity = "center",
             geometry = "7000x4000") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+271+219",
                 color = "black",
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("REPUBLIC OF KOREA",
                 gravity = "northwest",
                 location = "+271+319",
                 color = rgb(205, 46, 58, max = 255),
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("대한민국",
                 gravity = "northwest",
                 location = "+271+380",
                 color = "black",
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "southeast",
                 color = alpha(rgb(15, 100, 205, max = 255), .5),
                 location = "+200+400",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR POPULATION (RELEASED 2022-06-30)",
                 gravity = "southeast",
                 color = alpha(rgb(15, 100, 205, max = 255), .5),
                 location = "+200+300",
                 size = 50,
                 font = "serif") |>
  image_annotate("BUSAN",
                 gravity = "northwest",
                 color = "black",
                 location = "+3868+1949",
                 size = 50,
                 font = "serif") |>
  image_annotate("SEOUL",
                 gravity = "northwest",
                 color = "black",
                 location = "+1794+1993",
                 size = 50,
                 font = "serif") |>
  image_annotate("INCHEON",
                 gravity = "northwest",
                 color = "black",
                 location = "+993+2258",
                 size = 50,
                 font = "serif") |>
  image_annotate("DAEGU",
                 gravity = "northwest",
                 color = "black",
                 location = "+3084+2253",
                 size = 50,
                 font = "serif") |>
  image_annotate("JEJUDO ISLAND",
                 gravity = "northwest",
                 color = "black",
                 location = "+3589+3840",
                 size = 50,
                 font = "serif") |>
  image_annotate("GWANGJU",
                 gravity = "northwest",
                 color = "black",
                 location = "+2650+3278",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Korea_Final_Plot.png")