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
  rgb(141, 153, 174, max = 255),
  rgb(62, 92, 118, max = 255),
  rgb(43, 45, 66, max = 255),
  rgb(239, 35, 60, max = 255),
  rgb(216, 0, 50, max = 255)
)

swatchplot(colours)

text_color <- darken(colours[3], 0.3)
swatchplot(text_color)
annotate_text_colour <- darken(colours[4], 0.1)
swatchplot(annotate_text_colour)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Germany.png")

img |> 
  image_crop(gravity = "center",
             geometry = "5500x5500") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+263+310",
                 color = text_color,
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("DEUTSCHLAND",
                 gravity = "northwest",
                 location = "+263+410",
                 color = text_color,
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = text_color,
                 location = "+263+852",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+263+952",
                 size = 50,
                 font = "serif") |>
  image_annotate("BERLIN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4661+2348",
                 size = 50,
                 font = "serif") |>
  image_annotate("DRESDEN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4378+3484",
                 size = 50,
                 font = "serif") |>
  image_annotate("MUNICH",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3225+4979",
                 size = 50,
                 font = "serif") |>
  image_annotate("FRANKFURT",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+340+3671",
                 size = 50,
                 font = "serif") |>
  image_annotate("COLOGNE",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+314+3164",
                 size = 50,
                 font = "serif") |>
  image_annotate("DÜSSELDORF",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+238+2967",
                 size = 50,
                 font = "serif") |>
  image_annotate("HAMBURG",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2827+1475",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/Germany_Final_Plot.png")
