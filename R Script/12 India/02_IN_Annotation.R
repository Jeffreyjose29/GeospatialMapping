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

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Renders/India.png")

img |> 
  image_crop(gravity = "center",
             geometry = "8000x8000") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northeast",
                 location = "+200+310",
                 color = rgb(255,103,25, max = 255),
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("INDIA",
                 gravity = "northeast",
                 location = "+200+410",
                 color = text_color,
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northeast",
                 color = rgb(0,106,53, max = 255),
                 location = "+200+852",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northeast",
                 color = rgb(0,106,53, max = 255),
                 location = "+200+952",
                 size = 50,
                 font = "serif") |>
  image_annotate("KERALA",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+1178+5593",
                 size = 50,
                 font = "serif") |>
  image_annotate("KOLKATA",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4175+3685",
                 size = 50,
                 font = "serif") |>
  image_annotate("CHENNAI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2442+5017",
                 size = 50,
                 font = "serif") |>
  image_annotate("PATNA",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3661+2154",
                 size = 50,
                 font = "serif") |>
  image_annotate("DELHI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2198+1465",
                 size = 50,
                 font = "serif") |>
  image_annotate("MUMBAI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+664+3880",
                 size = 50,
                 font = "serif") |>
  image_annotate("AHMEDABAD",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+387+2911",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Renders/India_Final_Plot.png")
