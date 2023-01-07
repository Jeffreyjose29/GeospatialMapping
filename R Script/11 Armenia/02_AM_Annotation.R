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

colours <- c(rgb(118,113,154, max = 255),
  rgb(84,77,109, max = 255),
  rgb(191,164,199, max = 255),
  rgb(211,154,200, max = 255),
  rgb(205,115,175, max = 255),
  rgb(94,38,84, max = 255),
  rgb(50,37,57, max = 255)
)
swatchplot(colours)

text_color <- darken(colours[6], 0.3)
swatchplot(text_color)
annotate_text_colour <- darken(rgb(50,37,57, max = 255), 0.1)
swatchplot(annotate_text_colour)

img <- image_read("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/UnitedArabEmirates.png")

img |> 
  image_crop(gravity = "center",
             geometry = "7500x4500") |>
  image_annotate("POPULATION DENSITY MAP",
                 gravity = "northwest",
                 location = "+263+310",
                 color = text_color,
                 size = 80,
                 weight = 200,
                 font = "serif") |>
  image_annotate("UNITED ARAB EMIRATES",
                 gravity = "northwest",
                 location = "+263+410",
                 color = text_color,
                 size = 400,
                 weight = 700,
                 font = "serif") |>
  image_annotate("VISUAL PRODUCED BY @DATADEN_ IN RSTUDIO WITH RAYSHADER",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+263+852",
                 size = 50,
                 font = "serif") |>
  image_annotate("DATA: KONTUR (RELEASED 2022-06-30)",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+263+952",
                 size = 50,
                 font = "serif") |>
  image_annotate("ABU DHABI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+3065+2350",
                 size = 50,
                 font = "serif") |>
  image_annotate("DUBAI",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4062+1664",
                 size = 50,
                 font = "serif") |>
  image_annotate("SHARJAH",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4173+1507",
                 size = 50,
                 font = "serif") |>
  image_annotate("AJMAN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4260+1402",
                 size = 50,
                 font = "serif") |>
  image_annotate("UMM AL-QALWAIN",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+4273+1135",
                 size = 50,
                 font = "serif") |>
  image_annotate("LIWA OASIS",
                 gravity = "northwest",
                 color = annotate_text_colour,
                 location = "+2742+3973",
                 size = 50,
                 font = "serif") |>
  image_write("C:/Users/jeffr/OneDrive/Desktop/Github Activities/PopulationDensityMapper/Renders/UnitedArabEmirates_Final_Plot.png")