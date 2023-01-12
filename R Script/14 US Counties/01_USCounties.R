library(maps)
library(ggplot2)
library(dplyr)
library(socviz)
library(ggthemes)

county_map %>% sample_n(5)

county_data %>%
  select(id, name, state, pop_dens, pct_black) %>%
  sample_n(5)

county_full <- left_join(county_map, county_data, by = "id")


p <- ggplot(data = county_full,
            mapping = aes(x = long, y = lat,
                          fill = pop_dens, 
                          group = group))

p1 <- p + geom_polygon(color = "gray90", size = 0.05) + coord_equal()

p2 <- p1 + 
  scale_fill_manual(values = c(
  rgb(250, 163, 7, max = 255),
  rgb(232, 93, 4, max = 255),
  rgb(208, 0, 0, max = 255),
  rgb(157, 2, 8, max = 255),
  rgb(106, 4, 15, max = 255),
  rgb(55, 6, 23, max = 255),
  rgb(3, 7, 30, max = 255)
),
labels = c("0-10", "10-50", "50-100", "100-500",
           "500-1,000", "1,000-5,000", ">5,000"))

p2 + labs(fill = "Population per\nsquare mile") +
  theme_map() +
  guides(fill = guide_legend(nrow = 1)) + 
  theme(legend.position = "top") + ggtitle("United States Population Density By Counties")