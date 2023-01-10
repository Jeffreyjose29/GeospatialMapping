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

colours <- c(
  rgb(237, 242, 244, max = 255),
  rgb(72, 202, 228, max = 255),
  rgb(0, 119, 182, max = 255),
  rgb(3, 4, 94, max = 255),
  rgb(72, 191, 227, max = 255),
  rgb(114, 239, 221, max = 255)
)
swatchplot(colours)

text_color <- darken(colours[5], 0.3)
swatchplot(text_color)
annotate_text_colour <- darken(rgb(29, 45, 68, max = 255), 0.1)
swatchplot(annotate_text_colour)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Renders/GB.png")

img |> 
  image_crop(gravity = "center",
             geometry = "7000x7000") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+407+410",
                 color = text_color,
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("GREAT BRITAIN & NORTHERN IRELAND",
                 gravity = "northwest",
                 location = "+407+510",
                 color = text_color,
                 size = 250,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = text_color,
                 location = "+407+852",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = text_color,
                 location = "+407+952",
                 size = 50,
                 font = "serif") |>
  image_annotate("LONDON",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4731+5310",
                 size = 50,
                 font = "serif") |>
  image_annotate("EDINBURGH",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3426+3243",
                 size = 50,
                 font = "serif") |>
  image_annotate("GLASGOW",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1989+3261",
                 size = 50,
                 font = "serif") |>
  image_annotate("BELFAST",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2187+4044",
                 size = 50,
                 font = "serif") |>
  image_annotate("LIVERPOOL",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2371+4290",
                 size = 50,
                 font = "serif") |>
  image_annotate("BRIGHTON",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3835+5792",
                 size = 50,
                 font = "serif") |>
  image_annotate("NEWCASTLE",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3874+3687",
                 size = 50,
                 font = "serif") |>
  image_annotate("NORTH SEA",
                 gravity = "northwest",
                 color = text_color,
                 location = "+4597+2434",
                 size = 80,
                 font = "serif",
                 style = "italic") |>
  image_annotate("NORTH ATLANTIC OCEAN",
                 gravity = "northwest",
                 color = text_color,
                 location = "+301+2678",
                 size = 80,
                 font = "serif",
                 style = "italic") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Renders/GB_Final_Plot.png")
