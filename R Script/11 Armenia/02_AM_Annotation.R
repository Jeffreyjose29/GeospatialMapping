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
  rgb(240, 235, 216, max = 255),
  rgb(116, 140, 171, max = 255),
  rgb(62, 92, 118, max = 255),
  rgb(29, 45, 68, max = 255),
  rgb(13, 19, 33, max = 255)
)
swatchplot(colours)

text_color <- darken(colours[5], 0.3)
swatchplot(text_color)
annotate_text_colour <- darken(rgb(29, 45, 68, max = 255), 0.1)
swatchplot(annotate_text_colour)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Renders/Armenia.png")

img |> 
  image_crop(gravity = "center",
             geometry = "5500x5500") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+2191+310",
                 color = text_color,
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("ARMENIA",
                 gravity = "northwest",
                 location = "+1734+410",
                 color = text_color,
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1904+852",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2257+952",
                 size = 50,
                 font = "serif") |>
  image_annotate("YEREVAN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1475+3083",
                 size = 50,
                 font = "serif") |>
  image_annotate("VARDENIS",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4298+2872",
                 size = 50,
                 font = "serif") |>
  image_annotate("KAPAN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+5035+3836",
                 size = 50,
                 font = "serif") |>
  image_annotate("GYUMRI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+455+2141",
                 size = 50,
                 font = "serif") |>
  image_annotate("ARARAT",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1962+3312",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Renders/Armenia_Final_Plot.png")
